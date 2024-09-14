import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ott_getx/phone_number_screen_controller.dart';

class PhoneNumberScreen extends StatelessWidget {
  final PhoneScreenNumberController controller;
  final TextEditingController textcontroller = TextEditingController();

  PhoneNumberScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 80,),
          TextField(
            key: const Key('phone_number_input'),
            controller: textcontroller,
          ),
          TextButton(
              key: const Key('submit_button'),
              onPressed: () {
                controller.submit(textcontroller.text);
              },
              child: const Text('send otp')),
          Obx(() {
            return controller.isError.value
                ? const Text('invalid phone number')
                : const SizedBox.shrink();
          })
        ],
      ),
    );
  }
}
