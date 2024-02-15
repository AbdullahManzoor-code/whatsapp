import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/features/common/widget/utilis/error.dart';
import 'package:whatsapp/screens/OTP_Screen.dart';
import 'package:whatsapp/screens/user_info_screen.dart';

String verificationid = '';
// ignore: non_constant_identifier_names
final Authrepositerprovider = Provider((ref) => Authrepository(
    auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance));
final verificationprovider = Provider((ref) => verificationid);

class Authrepository {
  Authrepository({
    required this.auth,
    required this.firestore,
  });

  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  signinwithphonenumber(BuildContext context, String phonenumber) async {
    // try{

    // }catch(e){}

    await auth.verifyPhoneNumber(
      phoneNumber: phonenumber,
      verificationCompleted: (phoneAuthCredential) async {
        await auth.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (error) {
        showsnackbar(context, error);
      },
      codeSent: (verificationId, forceResendingToken) async {
        verificationid = verificationId;
        Navigator.pushNamed(context, OTPScreen.id, arguments: verificationId);
        // print("object&&&&&&&&&&&&&&&&&&&&&&&&7");
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  verfiyOTP(
      {required BuildContext context,
      required String verificationID,
      required String userOTP}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationID, smsCode: userOTP);
      await auth.signInWithCredential(credential);
      Navigator.pushNamed(context, Userinfo.id);
    } on FirebaseAuthException catch (e) {
      showsnackbar(context, e.message);
    }
  }
}
