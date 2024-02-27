// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/features/common/widget/custombutton.dart';
import 'package:country_picker/country_picker.dart';
import 'package:whatsapp/repository/controler.dart';

class Loginscreen extends ConsumerStatefulWidget {
  const Loginscreen({super.key});

  @override
  ConsumerState<Loginscreen> createState() => _LoginscreenState();
  static String id = "/login_Screen";
}

Country? country;
final phonenumbercontroller = TextEditingController();

class _LoginscreenState extends ConsumerState<Loginscreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    phonenumbercontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    pickcountry() {
      showCountryPicker(
          context: context,
          onSelect: (Country conutry) {
            setState(() {
              country = conutry;
            });
          });
    }

    void sendponnenumber() {
      String phonenumber = phonenumbercontroller.text.trim();
      if (country != null && phonenumber.isNotEmpty) {
        ref
            .read(Authcontrollerprovder)
            .sgininwithphone(context, "+${country!.phoneCode}$phonenumber");
      }
    }

    return Scaffold(
      backgroundColor: appBarColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_sharp)),
        backgroundColor: appBarColor,
        title: const Text(
          "Enter your phone number",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: size.height * 0.05,
                ),
                const Text("Whatsapp will need to verify your phone number"),
                SizedBox(
                  height: size.height * 0.0,
                ),
                TextButton(
                  onPressed: pickcountry,
                  style: const ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(Colors.blue)),
                  child: const Text("Pick your country"),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextField(
                        controller: phonenumbercontroller,
                        keyboardType: TextInputType.phone,
                        cursorColor: Colors.blue,
                        decoration: InputDecoration(
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            hintText: "phone number",
                            prefixStyle:
                                const TextStyle(fontWeight: FontWeight.bold),
                            prefixText: (country != null)
                                ? ("+${country!.phoneCode}  ")
                                : null))),
              ],
            ),
            Column(
              children: [
                SizedBox(
                    width: 200,
                    child: custombutton(
                        title: "NEXT", height: 60, todo: sendponnenumber)),
                const SizedBox(
                  height: 20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
