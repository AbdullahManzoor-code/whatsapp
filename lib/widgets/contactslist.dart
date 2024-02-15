import 'package:flutter/material.dart';
import 'package:whatsapp/info.dart';
import 'package:whatsapp/screens/mobliechat_screen.dart';

class contactslist extends StatelessWidget {
  const contactslist({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MoblieChatScreen(),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(info[index]["message"].toString()),
                    ),
                    trailing: Text(info[index]["time"].toString()),
                    title: Text(info[index]["name"].toString()),
                    leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(info[index]["profilePic"].toString())),
                  ),
                ),
              ),
              const Divider(
                color: Colors.white,
                indent: 100,
              )
            ],
          );
        },
        itemCount: info.length,
      ),
    );
  }
}
