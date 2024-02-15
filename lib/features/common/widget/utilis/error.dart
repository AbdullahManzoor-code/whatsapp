import 'package:flutter/material.dart';

void showsnackbar(BuildContext context, errormessage) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text("$errormessage")));
}
