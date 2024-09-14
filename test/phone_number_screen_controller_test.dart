import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ott_getx/phone_number_screen_controller.dart';
import 'package:ott_getx/route_adaptor.dart';

class MockRouteAdaptor extends Mock implements RouteAdaptor {}

void main() {
  test('submit with valid phone number should navigate to OTP screen', () {
    final mockRouteAdaptor = MockRouteAdaptor();
    final controller =
        PhoneScreenNumberController(routeAdaptor: mockRouteAdaptor);

    controller.submit('0987654321');

    verify(() => mockRouteAdaptor.toOtpScreen());
  });

  test('submit with invalid phone number should NOT navigate to OTP screen',
      () {
    final mockRouteAdaptor = MockRouteAdaptor();
    final controller =
        PhoneScreenNumberController(routeAdaptor: mockRouteAdaptor);

    controller.submit('');

    verifyNever(() => mockRouteAdaptor.toOtpScreen());
  });

  test('submit with invalid phone number should set isError to true', () {
    final mockRouteAdaptor = MockRouteAdaptor();
    final controller =
        PhoneScreenNumberController(routeAdaptor: mockRouteAdaptor);

    controller.submit('');

    expect(controller.isError.value, true);
  });
}
