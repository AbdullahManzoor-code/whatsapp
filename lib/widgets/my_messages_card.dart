import 'package:flutter/material.dart';
import 'package:giphy_picker/giphy_picker.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/features/common/enums/msg_enum.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'videplayeritem.dart';

// ignore: must_be_immutable
class mymessagecard extends StatelessWidget {
  final message;
  final time;
  bool isme;
  Messagetype messagetype;
  mymessagecard(
      {super.key,
      required this.message,
      required this.time,
      required this.isme,
      required this.messagetype});

  @override
  Widget build(BuildContext context) {
    bool Istext = messagetype.type == "text";
    return Align(
      alignment: isme ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 45),
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          color: isme ? messageColor : senderMessageColor,
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Stack(
            children: [
              Padding(
                padding: Istext
                    ? const EdgeInsets.only(
                        top: 10, bottom: 20, right: 30, left: 10)
                    : const EdgeInsets.only(
                        top: 5, bottom: 5, right: 5, left: 5),
                child: messagetype.type == "video"
                    ? videplayer(videourl: message)
                    : messagetype.type == "image"
                        ? CachedNetworkImage(
                            imageUrl: message,
                          )
                        : messagetype.type == "gif"
                            ? Image.network(
                                message,
                              )
                            : Text(message),
              ),
              Positioned(
                  right: 10,
                  bottom: 10,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.done_all,
                        color: Colors.white,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        time.toString(),
                        style: const TextStyle(fontSize: 10),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
