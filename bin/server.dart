import 'dart:io';

import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

import 'service.dart';

void main(List<String> arguments) async {
  print('Hello world!');
  var app = Router();
  final ip = InternetAddress.anyIPv4;

  app.get('/hello', (Request request) async {
    print('hello endpoint');
    final service = Service();
    final url = await service.webviewPayment();
    return Response.ok(url);
  });

  app.get('/url', (Request request) async {
    print('url endpoint');
    return Response.ok('Страница работает');
  });

  app.get('/user/<user>', (Request request, String user) {
    return Response.ok('hello $user');
  });

  var server = await io.serve(app, ip, 9090);
}
