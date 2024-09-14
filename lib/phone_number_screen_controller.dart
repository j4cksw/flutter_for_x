import 'package:get/get.dart';
import 'package:ott_getx/route_adaptor.dart';

class PhoneScreenNumberController extends GetxController {
  RxBool isError = false.obs;

  final RouteAdaptor routeAdaptor;

  PhoneScreenNumberController({required this.routeAdaptor});

  submit(String phoneNumber) {
    if (phoneNumber.length == 10) {
      routeAdaptor.toOtpScreen();
    }
    isError.value = true;
  }
}
