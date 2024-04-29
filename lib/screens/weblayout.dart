import 'package:flutter/material.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/features/chat/widget/chatlist.dart';
import 'package:whatsapp/features/chat/widget/contactslist.dart';
import 'package:whatsapp/widgets/web_profile_bar.dart';
import 'package:whatsapp/widgets/webchat_appbar.dart';
import 'package:whatsapp/widgets/websearch_bar.dart';

class weblayout extends StatelessWidget {
  const weblayout({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  webprofile(),
                  websearchbar(),
                  ContactsList(),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.50,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/backgroundImage.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                const webchatappbar(),
                const Expanded(
                    child: chatlist(
                  receiverid: "",
                )),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  decoration: const BoxDecoration(
                      color: searchBarColor,
                      border: Border(bottom: BorderSide(color: dividerColor))),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.attach_file)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.emoji_emotions)),
                      Expanded(
                          child: TextField(
                        decoration: inputdeco.copyWith(hintText: "Message"),
                      )),
                      // InputDecoration(
                      //     fillColor: searchBarColor,
                      //     filled: true,
                      //     hintText: "Type message here...",
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //       borderSide:
                      //           const BorderSide(color: Colors.grey),
                      //     ),
                      //     focusedBorder: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //       borderSide:
                      //           const BorderSide(color: Colors.grey),
                      //     ),
                      //     disabledBorder: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //       borderSide:
                      //           const BorderSide(color: Colors.grey),
                      //     ),
                      //     enabledBorder: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //       borderSide:
                      //           const BorderSide(color: Colors.grey),
                      //     ),
                      //     contentPadding: EdgeInsets.all(10))
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.send)),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.mic)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
