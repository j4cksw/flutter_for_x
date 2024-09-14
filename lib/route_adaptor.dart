import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:ott_getx/otp_screen_controller.dart';

import 'otp_screen.dart';

class RouteAdaptor {
  toOtpScreen() {
    Get.to(OTPScreen(
      controller: OTPScreenController(httpClient: Get.find<Client>()),
    ));
  }
}
