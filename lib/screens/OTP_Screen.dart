import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/repository/controler.dart';

class OTPScreen extends ConsumerWidget {
  static String id = "/OTP_Screen";

  @override
  Widget build(BuildContext context, ref) {
    final String verificationid =
        ModalRoute.of(context)?.settings.arguments as String;

    verifyOTP(BuildContext context, String userOTP, WidgetRef ref) {
      ref
          .read(Authcontrollerprovder)
          .verfiyphonenumber(context, verificationid, userOTP);
    }

    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_sharp)),
          backgroundColor: appBarColor,
          title: const Text("Verifying Your Number"),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text("We have sent sms code on your phone "),
            Center(
              child: SizedBox(
                  width: size.width * 0.5,
                  child: TextField(
                      onChanged: (value) {
                        if (value.length == 6) {
                          verifyOTP(context, value.trim(), ref);
                        }
                      },
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText: "- - - - - -",
                          hintStyle: TextStyle(fontSize: 30)))),
            ),
          ],
        ));
  }
}
