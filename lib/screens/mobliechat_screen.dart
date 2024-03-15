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
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final name = args['name'];
    final uid = args['uid'];
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new_sharp))
          ],
        ),
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
              name.jsify(),
              style: TextStyle(fontSize: Checkbox.width),
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
