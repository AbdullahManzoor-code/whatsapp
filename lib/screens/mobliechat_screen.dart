import 'package:flutter/material.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/info.dart';
import 'package:whatsapp/widgets/chatlist.dart';

// ignore: camel_case_types
class MoblieChatScreen extends StatelessWidget {
  static String id = "/mobliechat_screen";
  const MoblieChatScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.video_call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
        backgroundColor: appBarColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(info[0]["profilePic"].toString()),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              info[0]["name"].toString(),
              style:
                  TextStyle(fontSize: MediaQuery.of(context).size.width * 0.03),
            ),
          ],
        ),
      ),
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/backgroundImage.png"),
            fit: BoxFit.cover,
          )),
          child: Column(
            children: [
              const Expanded(child: chatlist()),
              TextField(
                  decoration: inputdeco.copyWith(
                      prefixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.emoji_emotions)),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.attach_file)),
                            IconButton(
                                onPressed: () {}, icon: const Icon(Icons.image))
                          ],
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(10))),
            ],
          )),
    );
  }
}
