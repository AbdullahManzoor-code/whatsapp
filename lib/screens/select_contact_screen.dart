import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/features/chat/controller/chat_controller.dart';
import 'package:whatsapp/features/common/widget/utilis/loader.dart';
import 'package:whatsapp/features/select_contacts/controller/select_contact_contorller.dart';
import 'package:whatsapp/screens/errorscreen.dart';

class Selectcontactlist extends ConsumerWidget {
  static String id = "select_contact_screen";
  void selectcontact(
      WidgetRef ref, Contact selectedcontact, BuildContext context) {
    ref
        .read(selectcontactprovider)
        .selectcontactcontoller(context, selectedcontact);
  }

  // const selectcontactlist({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColor,
          title: const Text("Select Contacts"),
          actions: [
            Row(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.search))
              ],
            )
          ],
        ),
        body: ref.watch(contactprovider).when(
              data: (contactlists) => StreamBuilder<Object>(
                  stream: ref.read(chatcontrollerprovider).getcontedcontacts(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: contactlists.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () =>
                              selectcontact(ref, contactlists[index], context),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: CircleAvatar(
                                  // child: Image.network(
                                  //     contactlists[index].photo.toString()),
                                  ),
                              title: Text(contactlists[index].displayName),
                            ),
                          ),
                        );
                      },
                    );
                  }),
              error: (error, stackTrace) {
                Navigator.pushNamed(context, ErrorScreen.id);
                return null;
              },
              loading: () => const loader(),
            ));
  }
}
