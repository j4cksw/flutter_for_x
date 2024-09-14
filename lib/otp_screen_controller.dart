import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ott_getx/success_screen.dart';

class OTPScreenController extends GetxController {
  late http.Client httpClient;

  OTPScreenController({required this.httpClient});

  void submit(String text) async {
    final response = await httpClient.post(
        Uri.parse('http://localhost:8882/otp/validate'),
        body: {'otp_code': text});

    if (response.statusCode == 200) {
      Get.to(SuccessScreen());
    }
  }
}
