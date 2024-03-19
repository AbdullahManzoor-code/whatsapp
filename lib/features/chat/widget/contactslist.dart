import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/features/chat/controller/chat_controller.dart';
import 'package:whatsapp/features/chat/widget/chat_contact_info.dart';
import 'package:whatsapp/features/chat/mobliechat_screen.dart';
import 'package:intl/intl.dart';

class ContactsList extends ConsumerWidget {
  const ContactsList({Key? key});

  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: StreamBuilder<List<Chatcontactinfo>>(
        stream: ref.watch(chatcontrollerprovider).getcontedcontacts(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator(); // Placeholder for when data is loading
          }

          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              var data = snapshot.data![index];

              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, MoblieChatScreen.id,
                          arguments: {
                            'name': data.name,
                            'uid': data.contactid
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(data.lastmsg),
                        ),
                        trailing: Text(DateFormat.Hm().format(data.time)),
                        title: Text(data.name),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(data.profilepic),
                        ),
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
            itemCount: snapshot.data!.length,
          );
        },
      ),
    );
  }
}
