import 'package:flutter/material.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/info.dart';

// ignore: camel_case_types
class webprofile extends StatelessWidget {
  const webprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: dividerColor,
      height: MediaQuery.of(context).size.height * 0.081,
      width: MediaQuery.of(context).size.width * 0.50,
      // decoration: const BoxDecoration(
      //     border: Border(right: BorderSide(color: dividerColor))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: CircleAvatar(
              radius: 30,
              // maxRadius: 30,
              backgroundImage: NetworkImage(info[0]['profilePic'].toString()),
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.comment,
                ),
                color: Colors.grey,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
                color: Colors.grey,
              )
            ],
          )
        ],
      ),
    );
  }
}
