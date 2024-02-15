import 'package:flutter/material.dart';
import 'package:whatsapp/info.dart';
import 'package:image_picker/image_picker.dart';

class Userinfo extends StatelessWidget {
  static String id = "/user_info_screen";
  const Userinfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundImage:
                      NetworkImage(info[0]["profilePic"].toString()),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.add_a_photo))
              ],
            )
          ],
        ),
      )),
    );
  }
}
