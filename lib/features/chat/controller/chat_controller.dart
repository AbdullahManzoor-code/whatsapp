import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/features/chat/repository/chat_repository.dart';
import 'package:whatsapp/features/chat/widget/chat_contact_info.dart';
import 'package:whatsapp/features/chat/widget/message.dart';
import 'package:whatsapp/features/common/enums/msg_enum.dart';
import 'package:whatsapp/repository/controler.dart';

final chatcontrollerprovider = Provider((ref) {
  final cont = ref.watch(chatrepostoryprovider);
  return chatcontroller(chatrepository: cont, ref: ref);
});

class chatcontroller {
  chatcontroller({
    required this.chatrepository,
    required this.ref,
  });

  Chatrepository chatrepository;
  ProviderRef ref;

  Stream<List<Chatcontactinfo>> getcontedcontacts() {
    return chatrepository.getconctedcontacts();
  }

  Stream<List<Message>> getmsgfromdatabase(String receiverid) {
    return chatrepository.getmessages(receiverid);
  }

  sendtextmsg(
      {required BuildContext context,
      required String reciverid,
      required String text,
      Messagetype type = Messagetype.text}) {
    ref.read(userdatauthprovider).whenData((value) =>
        chatrepository.sendtextmsg(
            context: context,
            reciverid: reciverid,
            sender: value!,
            text: text,
            type: type));
  }

  void sendfilemessage({
    required BuildContext context,
    required File file,
    required Messagetype messagetype,
    required String recevierId,
  }) async {
    ref.read(userdatauthprovider).whenData((value) => ref
        .read(chatrepostoryprovider)
        .sendfilemessage(
            ref: ref,
            context: context,
            file: file,
            messagetype: messagetype,
            recevierId: recevierId,
            senderdata: value!));
  }
}
