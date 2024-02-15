import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/features/landing_screen.dart';
import 'package:whatsapp/repository/auth_repository.dart';
import 'package:whatsapp/screens/OTP_Screen.dart';
import 'package:whatsapp/screens/login_Screen.dart';
import 'package:whatsapp/screens/mobliechat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:whatsapp/screens/user_info_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor, primaryColor: appBarColor),
      title: 'Whatsapp',
      home: Loginscreen(),
      // const responvielayout(
      //     moblielayout: moblielayout(), weblayout: weblayout()),
      routes: {
        LandingScreen.id: (context) => const LandingScreen(),
        MoblieChatScreen.id: (context) => const MoblieChatScreen(),
        Loginscreen.id: (context) => const Loginscreen(),
        OTPScreen.id: (context) => OTPScreen(
              verificationid: ref.read(verificationprovider),
            ),
        Userinfo.id: (context) => const Userinfo()
      },
    );
  }
}
