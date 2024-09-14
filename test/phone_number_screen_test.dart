import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ott_getx/phone_number_screen.dart';
import 'package:ott_getx/phone_number_screen_controller.dart';

class MockPhoneScreenNumberController extends Mock
    implements PhoneScreenNumberController {}

void main() {
  Widget createPhoneNumberScreen(PhoneScreenNumberController controller) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: PhoneNumberScreen(
        controller: controller,
      ),
    );
  }

  testWidgets('Verify success', (WidgetTester tester) async {
    // Arrange
    final mockController = MockPhoneScreenNumberController();
    when(() => mockController.isError).thenReturn(false.obs);

    // Action
    await tester.pumpWidget(createPhoneNumberScreen(mockController));
    await tester.enterText(find.byKey(const Key('phone_number_input')), '1234');
    await tester.tap(find.byKey(const Key('submit_button')));

    // Assert
    verify(() => mockController.submit(any())).called(1);
    expect(find.text('invalid phone number'), findsNothing);
  });

  testWidgets('Show error text', (WidgetTester tester) async {
    final mockController = MockPhoneScreenNumberController();
    when(() => mockController.isError).thenReturn(true.obs);

    await tester.pumpWidget(createPhoneNumberScreen(mockController));

    await tester.enterText(find.byKey(const Key('phone_number_input')), '1234');

    await tester.tap(find.byKey(const Key('submit_button')));

    expect(find.text('invalid phone number'), findsOneWidget);
  });
}
