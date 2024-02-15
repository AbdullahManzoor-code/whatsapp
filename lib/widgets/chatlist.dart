import 'package:flutter/material.dart';
import 'package:whatsapp/info.dart';
import 'package:whatsapp/widgets/my_messages_card.dart';

class chatlist extends StatelessWidget {
  const chatlist({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        final isme = messages[index]['isMe'];

        return mymessagecard(
            isme: bool.parse(isme.toString()),
            message: messages[index]["text"],
            time: messages[index]["time"].toString());
      },
      itemCount: messages.length,
    );
  }
}
