import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/features/chat/controller/chat_controller.dart';
import 'package:whatsapp/features/common/enums/msg_enum.dart';
import 'package:whatsapp/features/common/widget/utilis/fliepicker.dart';
import 'package:image_picker/image_picker.dart';

class Chat_bottom_W extends ConsumerStatefulWidget {
  Chat_bottom_W({
    required this.receiverid,
  });

  final receiverid;
  @override
  ConsumerState<Chat_bottom_W> createState() => _Chat_bottom_WState();
}

bool isshowR = false;
String text = "";

class _Chat_bottom_WState extends ConsumerState<Chat_bottom_W> {
  late TextEditingController textcontroller;
  void sendtextmsg() {
    if (isshowR & text.isNotEmpty) {
      ref
          .watch(chatcontrollerprovider)
          .sendtextmsg(context, widget.receiverid, text.trim());
      textcontroller.clear();
      text = "";
    }
  }

  void sendimage() async {
    File? image = await pickimagefromgellray(context);
    if (image != null) {
      sendfile(file: image, messagetype: Messagetype.image);
    }
  }

  void sendfile({required File file, required Messagetype messagetype}) {
    ref.read(chatcontrollerprovider).sendfilemessage(
          context: context,
          file: file,
          messagetype: messagetype,
          recevierId: widget.receiverid,
        );
  }

  @override
  void initState() {
    // TODO: implement initState
    textcontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textcontroller.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                controller: textcontroller,
                onChanged: (value) {
                  text = value;
                  if (value.isNotEmpty) {
                    setState(() {
                      isshowR = true;
                    });
                  } else {
                    setState(() {
                      isshowR = false;
                    });
                  }
                },
                decoration: inputdeco.copyWith(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: "type message here...",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.emoji_emotions)),
                    ),
                    suffixIcon: SizedBox(
                      width: 100,
                      height: 10,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.attach_file)),
                          IconButton(
                              onPressed: sendimage,
                              icon: const Icon(Icons.camera))
                        ],
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(10))),
          ),
        ),
        CircleAvatar(
          backgroundColor: messageColor,
          radius: 30,
          child: GestureDetector(
              onTap: sendtextmsg,
              child: Icon(
                isshowR ? Icons.send : Icons.mic,
              )),
        )
      ],
    );
  }
}
