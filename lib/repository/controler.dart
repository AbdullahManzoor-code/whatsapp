import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/repository/auth_repository.dart';

// ignore: non_constant_identifier_names
final Authcontrollerprovder = Provider((ref) {
  // ignore: non_constant_identifier_names
  final Authrepository = ref.watch(Authrepositerprovider);
  return Authcontroller(authrepository: Authrepository);
});

class Authcontroller {
  final Authrepository authrepository;

  Authcontroller({required this.authrepository});

  sgininwithphone(BuildContext context, String phonenumber) {
    authrepository.signinwithphonenumber(context, phonenumber);
  }

  verfiyphonenumber(
      BuildContext context, String verificationid, String userOTP) {
    authrepository.verfiyOTP(
        verificationID: verificationid, userOTP: userOTP, context: context);
  }
}
