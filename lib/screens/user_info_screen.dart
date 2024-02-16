import 'dart:io';

import 'package:flutter/material.dart';
import 'package:whatsapp/features/common/widget/utilis/fliepicker.dart';
import 'package:whatsapp/info.dart';

class Userinfo extends StatefulWidget {
  static String id = "/user_info_screen";
  const Userinfo({super.key});

  @override
  State<Userinfo> createState() => _UserinfoState();
}

class _UserinfoState extends State<Userinfo> {
  @override
  Widget build(BuildContext context) {
    File? image;
    selectim() async {
      setState(() async {
        image = await pickimage(context);
      });
    }

    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(40),
              child: Stack(
                children: [
                  image == null
                      ? CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              NetworkImage(info[0]["profilePic"].toString()),
                        )
                      : CircleAvatar(
                          radius: 60,
                          backgroundImage: FileImage(image!),
                        ),
                  Positioned(
                      bottom: -2,
                      right: 5,
                      child: IconButton(
                          onPressed: () {
                            selectim();
                            print(
                                "$image{}{}{}{{}{}{}{}}{{{..................}}{}}");
                          },
                          icon: Icon(Icons.add_a_photo))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Enter your name ",
                    suffixIcon:
                        IconButton(onPressed: () {}, icon: Icon(Icons.done))),
              ),
            )
          ],
        ),
      )),
    );
  }
}
