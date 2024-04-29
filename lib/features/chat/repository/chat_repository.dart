import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/features/chat/widget/chat_contact_info.dart';
import 'package:whatsapp/features/chat/widget/message.dart';
import 'package:whatsapp/features/common/enums/msg_enum.dart';
import 'package:whatsapp/features/common/repository/common_repositry_storefile.dart';
import 'package:whatsapp/features/common/widget/utilis/error.dart';
import 'package:whatsapp/models/user_model.dart';
import 'package:uuid/uuid.dart';

final chatrepostoryprovider = Provider((ref) => Chatrepository(
    firestore: FirebaseFirestore.instance, auth: FirebaseAuth.instance));

class Chatrepository {
  Chatrepository({
    required this.firestore,
    required this.auth,
  });

  FirebaseFirestore firestore;

  FirebaseAuth auth;

  void sendtextmsg(
      {required BuildContext context,
      required String reciverid,
      required Usermodel sender,
      required String text}) async {
    try {
      var time = DateTime.now();
      Usermodel receiver;

      var userdata = await firestore.collection('users').doc(reciverid).get();
      String messageid = const Uuid().v1();
      receiver = Usermodel.fromJson(userdata.data()!);
      _savechatscreendatatosubcollection(
          receiver, reciverid, sender, time, text);
      _savemsgtosubcollection(
          type: Messagetype.text,
          text: text,
          messageid: messageid as String,
          senderid: sender.userid,
          receiverid: reciverid,
          timesent: DateTime.now());
    } catch (e) {
      showsnackbar(context, e.toString());
    }
  }

  _savemsgtosubcollection({
    required Messagetype type,
    required String text,
    required String messageid,
    required String senderid,
    required String receiverid,
    required DateTime timesent,
  }) async {
    try {
      final msg = Message(
          type: Messagetype.text,
          text: text,
          messageid: messageid,
          senderid: auth.currentUser!.uid,
          receiverid: receiverid,
          timesent: timesent,
          isseen: false);
      await firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection('chats')
          .doc(receiverid)
          .collection('messages')
          .doc(messageid)
          .set(msg.toJson());

      await firestore
          .collection('users')
          .doc(receiverid)
          .collection('chats')
          .doc(auth.currentUser!.uid)
          .collection('messages')
          .doc(messageid)
          .set(msg.toJson());
    } catch (e) {
      throw e;
    }
  }

  _savechatscreendatatosubcollection(Usermodel receiver, String reciverid,
      Usermodel sender, DateTime time, msg) async {
    try {
      var reciverchatcontact = Chatcontactinfo(
          name: sender.name,
          profilepic: sender.profileurl,
          contactid: sender.userid,
          lastmsg: msg,
          time: time);
      await firestore
          .collection('users')
          .doc(reciverid)
          .collection('chats')
          .doc(auth.currentUser!.uid)
          .set(reciverchatcontact.toJson());
      var senderchattcontact = Chatcontactinfo(
          name: receiver.name,
          profilepic: receiver.profileurl,
          contactid: receiver.userid,
          lastmsg: msg,
          time: time);
      await firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection('chats')
          .doc(reciverid)
          .set(senderchattcontact.toJson());
    } catch (e) {
      SnackBar(content: Text("${e}"));
    }
  }

  Stream<List<Chatcontactinfo>> getconctedcontacts() {
    return firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('chats')
        .snapshots()
        .asyncMap((event) async {
      List<Chatcontactinfo> contactlist = [];
      for (var doc in event.docs) {
        var contact = Chatcontactinfo.fromJson(doc.data());

        var userdata =
            await firestore.collection('users').doc(contact.contactid).get();

        var user = Usermodel.fromJson(userdata.data()!);
        print(user);
        contactlist.add(Chatcontactinfo(
            name: user.name,
            profilepic: user.profileurl,
            contactid: contact.contactid,
            lastmsg: contact.lastmsg,
            time: contact.time));
      }
      return contactlist;
    });
  }

  Stream<List<Message>> getmessages(String receiverid) {
    return firestore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("chats")
        .doc(receiverid)
        .collection("messages")
        .orderBy("timesent")
        .snapshots()
        .map((event) {
      List<Message> Messages = [];
      for (var msg in event.docs) {
        Messages.add(Message.fromJson(msg.data()));
      }
      return Messages.reversed.toList();
    });
  }

  void sendfilemessage(
      {required Ref ref,
      required BuildContext context,
      required File file,
      required Messagetype messagetype,
      required String recevierId,
      required Usermodel senderdata}) async {
    String messageid = Uuid().v1();

    String fileurl = await ref
        .read(Commonstorefiletofirebaseprovider)
        .storetofirebase(file,
            'chats/${messagetype.type}/${senderdata.userid}/$recevierId/$messageid');
    var text;
    switch (messagetype) {
      case Messagetype.audio:
        text = "🔉audio";
        break;
      case Messagetype.vedio:
        text = "📽 video";
        break;

      case Messagetype.gif:
        text = "Gif";
        break;

      case Messagetype.image:
        text = "📸 Image";
        break;

      case Messagetype.text:
        break;
    }
    var time = DateTime.now();
    _savemsgtosubcollection(
        type: messagetype,
        text: fileurl,
        messageid: messageid,
        senderid: senderdata.userid,
        receiverid: recevierId,
        timesent: time);
    var recevierdata =
        await firestore.collection("users").doc(recevierId).get();
    Usermodel recevier = Usermodel.fromJson(recevierdata.data()!);
    _savechatscreendatatosubcollection(
        recevier, recevierId, senderdata, time, file);
  }
}
