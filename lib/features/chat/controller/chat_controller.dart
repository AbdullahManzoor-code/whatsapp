import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/features/chat/repository/chat_repository.dart';
import 'package:whatsapp/features/chat/widget/chat_contact_info.dart';
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

  sendtextmsg(BuildContext context, reciverid, String text) {
    ref.read(userdatauthprovider).whenData((value) =>
        chatrepository.sendtextmsg(
            context: context,
            reciverid: reciverid,
            sender: value!,
            text: text));
  }
}
