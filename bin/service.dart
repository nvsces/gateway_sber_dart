import 'dart:math';

import 'config.dart';
import 'sber/sberbank_acquiring_core.dart';

class Service {
  SberbankAcquiring acquiring = SberbankAcquiring(
    SberbankAcquiringConfig(
      userName: ConfigEnv.username,
      password: ConfigEnv.password,
    ),
  );

  Future<String> webviewPayment(String amount) async {
    var rng = Random();
    final orderNumber = rng.nextInt(1000000);
    final RegisterResponse register = await acquiring.register(RegisterRequest(
      amount: int.parse(amount) * 100,
      returnUrl: 'https://test.ru/return.html',
      failUrl: 'https://test.ru/fail.html',
      orderNumber: '$orderNumber',
      pageView: 'MOBILE',
    ));

    final String formUrl = register.formUrl ?? '';

    return formUrl;
  }
}
