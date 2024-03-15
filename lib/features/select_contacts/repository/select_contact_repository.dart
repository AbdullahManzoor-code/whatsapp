import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/features/common/widget/utilis/error.dart';
import 'package:whatsapp/models/user_model.dart';
import 'package:whatsapp/screens/mobliechat_screen.dart';

final getcontactsproviderrepostry = Provider(
    (ref) => Selectcontactsrepository(firebase: FirebaseFirestore.instance));

class Selectcontactsrepository {
  Selectcontactsrepository({
    required this.firebase,
  });

  final FirebaseFirestore firebase;

  Future<List<Contact>> getcontacts() async {
    List<Contact> contactlist = [];
    try {
      if (await FlutterContacts.requestPermission()) {
        contactlist = await FlutterContacts.getContacts(withProperties: true);
      }
    } catch (e) {
      debugPrintStack(label: e.toString());
    }
    return contactlist;
  }

  Selectcontactfromlist(Contact selectedcontact, BuildContext context) async {
    print(
        "${selectedcontact.phones[0].normalizedNumber} ######################");
    var usercollection = await firebase.collection('users').get();
    bool isfound = false;
    for (var doc in usercollection.docs) {
      print(selectedcontact);
      var userdata = Usermodel.fromJson(doc.data());
      String selectedphonenum = selectedcontact.phones[0].normalizedNumber;
      if (selectedphonenum == userdata.phonenumber) {
        isfound = true;
        Navigator.pushNamed(context, MoblieChatScreen.id,
            arguments: {'name': userdata.name, 'uid': userdata.userid});
      }
    }
    if (!isfound) {
      showsnackbar(context, "contact not found");
    }
    // } catch (e) {
    //   showsnackbar(context, e.toString());
    //   print(e);
    // }
  }
}
