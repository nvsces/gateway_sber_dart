import 'config.dart';
import 'sber/sberbank_acquiring_core.dart';

class Service {
  SberbankAcquiring acquiring = SberbankAcquiring(
    SberbankAcquiringConfig(
      userName: ConfigEnv.username,
      password: ConfigEnv.password,
    ),
  );

  Future<String> webviewPayment() async {
    final RegisterResponse register = await acquiring.register(RegisterRequest(
      amount: 1000,
      returnUrl: 'https://test.ru/return.html',
      failUrl: 'https://test.ru/fail.html',
      orderNumber: 'test233111',
      pageView: 'MOBILE',
    ));

    final String formUrl = register.formUrl ?? '';

    return formUrl;
  }
}

// final List<PaymentItem> items = <PaymentItem>[
//   PaymentItem(name: 'T-Shirt', price: 2000),
//   PaymentItem(name: 'Trousers', price: 1600),
// ];


