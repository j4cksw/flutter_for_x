import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart';
import 'package:ott_getx/phone_number_screen.dart';
import 'package:ott_getx/phone_number_screen_controller.dart';
import 'package:ott_getx/route_adaptor.dart';

void main() {
  runApp(MyApp(httpClient: Client()));
}

class MyApp extends StatelessWidget {
  final Client httpClient;

  const MyApp({super.key, required this.httpClient});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final phoneNumberContoller =
        PhoneScreenNumberController(routeAdaptor: RouteAdaptor());

    Get.put(httpClient);

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PhoneNumberScreen(
        controller: phoneNumberContoller,
      ),
    );
  }
}
