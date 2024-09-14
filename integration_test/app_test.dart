import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ott_getx/main.dart';
import 'package:ott_getx/otp_screen.dart';
import 'package:ott_getx/success_screen.dart';

class MockHttpClient extends Mock implements Client {}

void main() {
  testWidgets('Verify success', (WidgetTester tester) async {
    final mockHttpClient = MockHttpClient();

    when(() => mockHttpClient.post(
            Uri.parse('http://localhost:8882/otp/validate'),
            body: {'otp_code': '123456'}))
        .thenAnswer((_) => Future.value(Response('{}', 200)));

    await tester.pumpWidget(MyApp(
      httpClient: mockHttpClient,
    ));

    // Should see phone number input
    expect(find.byKey(const Key('phone_number_input')), findsOneWidget);

    // Fill valid phone number
    await tester.enterText(
        find.byKey(const Key('phone_number_input')), '0987654321');

    // Tap on send OTP button
    await tester.tap(find.byKey(const Key('submit_button')));

    await tester.pumpAndSettle();

    // Should see OTP screen
    expect(find.byType(OTPScreen), findsOneWidget);

    // Fill valid OTP code
    await tester.enterText(find.byKey(const Key('otp_input')), '123456');

    // Tap on submit button
    await tester.tap(find.byKey(const Key('submit_button')));
    await tester.pumpAndSettle();
    // Should see success screen
    expect(find.byType(SuccessScreen), findsOneWidget);
  });

  testWidgets('Invalid phone number', (WidgetTester tester) async {
    final mockHttpClient = MockHttpClient();
    await tester.pumpWidget(MyApp(
      httpClient: mockHttpClient,
    ));

    // Should see phone number input
    expect(find.byKey(const Key('phone_number_input')), findsOneWidget);

    // Fill valid phone number
    await tester.enterText(find.byKey(const Key('phone_number_input')), '0');

    // Tap on send OTP button
    await tester.tap(find.byKey(const Key('submit_button')));

    await tester.pumpAndSettle();

    expect(find.text('invalid phone number'), findsWidgets);
  });
}
