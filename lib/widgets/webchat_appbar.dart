import 'package:flutter/material.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/info.dart';

class webchatappbar extends StatelessWidget {
  const webchatappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dividerColor,
      height: MediaQuery.of(context).size.height * 0.081,
      width: MediaQuery.of(context).size.width * 0.50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage:
                      NetworkImage(info[2]["profilePic"].toString()),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                Text(info[2]["name"].toString()),
              ],
            ),
            Row(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
              ],
            )
          ],
        ),
      ),
    );
  }
}
