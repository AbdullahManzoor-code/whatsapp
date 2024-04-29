import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/features/common/widget/utilis/loader.dart';
import 'package:whatsapp/models/user_model.dart';
import 'package:whatsapp/repository/controler.dart';
import 'package:whatsapp/features/chat/widget/chatlist.dart';

import 'widget/chat_bottom_w.dart';

// ignore: camel_case_types
class MoblieChatScreen extends ConsumerStatefulWidget {
  static String id = "/mobliechat_screen";

  const MoblieChatScreen({Key? key});

  @override
  ConsumerState<MoblieChatScreen> createState() => _MoblieChatScreenState();
}

class _MoblieChatScreenState extends ConsumerState<MoblieChatScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final name = args['name'];
    final uid = args['uid'];
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.video_call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
        backgroundColor: appBarColor,
        title: StreamBuilder(
            stream: ref.watch(Authcontrollerprovder).getdatafromuid(uid),
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
              Expanded(child: chatlist(receiverid: uid)),
              Chat_bottom_W(
                receiverid: uid,
              ),
            ],
          )),
    );
  }
}
