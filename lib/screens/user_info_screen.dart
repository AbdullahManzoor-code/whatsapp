import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/features/common/widget/utilis/fliepicker.dart';
import 'package:whatsapp/info.dart';
import 'package:whatsapp/repository/controler.dart';

class Userinfo extends ConsumerStatefulWidget {
  static String id = "/user_info_screen";
  const Userinfo({super.key});

  @override
  ConsumerState<Userinfo> createState() => _UserinfoState();
}

class _UserinfoState extends ConsumerState<Userinfo> {
  File? image;
  TextEditingController nameeditingcontrolor = TextEditingController();
  @override
  void dispose() {
    nameeditingcontrolor.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    selectim() async {
      image = await pickimagefromgellray(context);
      setState(() {});
    }

    savedatatofirebase() async {
      String name = nameeditingcontrolor.text.trim();
      if (name.isNotEmpty) {
        await ref
            .read(Authcontrollerprovder)
            .storedatatofirebase(name, context, image);
      }
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
                          },
                          icon: const Icon(Icons.add_a_photo))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: nameeditingcontrolor,
                decoration: InputDecoration(
                    hintText: "Enter your name ",
                    suffixIcon: IconButton(
                        onPressed: savedatatofirebase,
                        icon: const Icon(Icons.done))),
              ),
            )
          ],
        ),
      )),
    );
  }
}
