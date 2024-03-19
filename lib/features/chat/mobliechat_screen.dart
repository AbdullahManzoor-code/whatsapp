import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/features/common/widget/utilis/loader.dart';
import 'package:whatsapp/models/user_model.dart';
import 'package:whatsapp/repository/controler.dart';
import 'package:whatsapp/features/chat/widget/chatlist.dart';

import 'widget/chat_bottom_w.dart';

// ignore: camel_case_types
class MoblieChatScreen extends ConsumerWidget {
  static String id = "/mobliechat_screen";

  const MoblieChatScreen({Key? key});

  @override
  Widget build(BuildContext context, ref) {
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
        title: StreamBuilder(
            stream: ref.read(Authcontrollerprovder).getdatafromuid(uid),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const loader();
              }
              Usermodel user = snapshot.data;
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(user.profileurl),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.03),
                      ),
                      Text(user.online ? 'online' : 'offline',
                          style: TextStyle(fontSize: 10))
                    ],
                  ),
                ],
              );
            }),
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
              Chat_bottom_W(
                receiverid: uid,
              ),
            ],
          )),
    );
  }
}
