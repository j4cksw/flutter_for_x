import 'package:flutter/material.dart';
import 'package:ott_getx/otp_screen_controller.dart';

class OTPScreen extends StatelessWidget {
  final OTPScreenController controller;
  final TextEditingController textcontroller = TextEditingController();

  OTPScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(height: 80,),
        TextField(
          key: const Key('otp_input'),
          controller: textcontroller,
        ),
        TextButton(
            key: const Key('submit_button'),
            onPressed: () {
              controller.submit(textcontroller.text);
            },
            child: const Text('send otp')),
      ],
    ));
  }
}
