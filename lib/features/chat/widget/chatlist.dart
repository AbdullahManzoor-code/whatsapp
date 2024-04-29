import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/features/chat/controller/chat_controller.dart';
import 'package:whatsapp/features/chat/widget/message.dart';
import 'package:whatsapp/widgets/my_messages_card.dart';

class chatlist extends ConsumerWidget {
  const chatlist({required this.receiverid, super.key});

  final String receiverid;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<List<Message>>(
        stream: ref.read(chatcontrollerprovider).getmsgfromdatabase(receiverid),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }

          return ListView.builder(
            shrinkWrap: true,
            reverse: true,
            itemBuilder: (BuildContext context, int index) {
              var msg = snapshot.data![index];

              bool isme =
                  (msg.senderid == FirebaseAuth.instance.currentUser!.uid)
                      ? true
                      : false;

              return mymessagecard(
                  isme: bool.parse(isme.toString()),
                  message: msg.text,
                  time: "${msg.timesent.hour}:${msg.timesent.minute}");
            },
            itemCount: snapshot.data!.length,
          );
        });
  }
}
