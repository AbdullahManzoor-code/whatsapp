import 'package:flutter/material.dart';
import 'package:whatsapp/colors.dart';

// ignore: must_be_immutable
class mymessagecard extends StatelessWidget {
  final message;
  final time;
  bool isme;
  mymessagecard(
      {super.key,
      required this.message,
      required this.time,
      required this.isme});

  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsets.only(
                    top: 10, bottom: 20, right: 30, left: 10),
                child: Text(message),
              ),
              Positioned(
                  top: 30,
                  right: 10,
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
                        time,
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
