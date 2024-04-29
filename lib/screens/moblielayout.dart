import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/repository/auth_repository.dart';
import 'package:whatsapp/screens/select_contact_screen.dart';
import 'package:whatsapp/features/chat/widget/contactslist.dart';

// ignore: camel_case_types
class moblielayout extends ConsumerStatefulWidget {
  const moblielayout({super.key});

  @override
  ConsumerState<moblielayout> createState() => _moblielayoutState();
}

class _moblielayoutState extends ConsumerState<moblielayout>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state case AppLifecycleState.resumed) {
      ref.read(Authrepositerprovider).Setuserstate(true);
    } else {
      ref.read(Authrepositerprovider).Setuserstate(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: appBarColor,
            title: const Text("Whatsapp"),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: (Colors.grey),
                  ))
            ],
            bottom: const TabBar(
                indicatorColor: tabColor,
                indicatorWeight: 4,
                labelColor: tabColor,
                labelPadding: EdgeInsets.all(10),
                overlayColor:
                    MaterialStatePropertyAll(Color.fromARGB(255, 93, 89, 89)),
                unselectedLabelColor: Colors.grey,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                tabs: [Text("Chats"), Text("Updates"), Text("Calls")]),
          ),
          body: const ContactsList(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, Selectcontactlist.id);
            },
            backgroundColor: tabColor,
            child: const Icon(
              Icons.comment,
              color: Colors.white,
            ),
          ),
        ));
  }
}
