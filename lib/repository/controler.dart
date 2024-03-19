import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/models/user_model.dart';
import 'package:whatsapp/repository/auth_repository.dart';

// ignore: non_constant_identifier_names
final Authcontrollerprovder = Provider((ref) {
  // ignore: non_constant_identifier_names
  final Authrepository = ref.watch(Authrepositerprovider);
  return Authcontroller(authrepository: Authrepository, ref: ref);
});

final userdatauthprovider = FutureProvider((ref) {
  final authcon = ref.watch(Authcontrollerprovder);

  return authcon.getuserdata();
});

class Authcontroller {
  final ProviderRef ref;
  final Authrepository authrepository;

  Authcontroller({required this.authrepository, required this.ref});

  sgininwithphone(BuildContext context, String phonenumber) {
    authrepository.signinwithphonenumber(context, phonenumber);
  }

  verfiyphonenumber(
      BuildContext context, String verificationid, String userOTP) {
    authrepository.verfiyOTP(
        verificationID: verificationid, userOTP: userOTP, context: context);
  }

  storedatatofirebase(String name, BuildContext context, File? file) {
    authrepository.storefile(
        name: name, ref: ref, context: context, photo: file);
  }

  Future<Usermodel?> getuserdata() async {
    Usermodel? user = await authrepository.getcurrentuser();

    return user;
  }

  Stream<Usermodel> getdatafromuid(String uid) {
    return authrepository.getdataofuserafterauth(uid);
  }
}
