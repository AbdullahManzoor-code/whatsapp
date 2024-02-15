import 'package:flutter/material.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/screens/login_Screen.dart';

import 'common/widget/custombutton.dart';

class LandingScreen extends StatelessWidget {
  static String id = "/landing_Screen";
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 48, 54, 57),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          const Center(
            child: Text(
              "Welcome To Whatsapp",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: size.height * 0.1,
          ),
          Image(
            image: const AssetImage("assets/bg.png"),
            color: tabColor,
            height: size.height * 0.45,
            width: size.width * 0.8,
          ),
          SizedBox(
            height: size.height / 10,
          ),
          const Text(
            'Read our Privacy Policy. Tap "Agree and continue" to accept the Terms of Service.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              width: 300,
              child: custombutton(
                title: "AGREE AND CONTINUE",
                height: size.height * 0.08,
                todo: () {
                  Navigator.pushNamed(context, Loginscreen.id);
                },
              ))
        ],
      )),
    );
  }
}
