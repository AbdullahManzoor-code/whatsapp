import 'package:flutter/material.dart';
import 'package:whatsapp/colors.dart';

class websearchbar extends StatelessWidget {
  const websearchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.77,
          child: TextField(
              decoration: inputdeco.copyWith(
                  prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          ))),
        ));
  }
}
