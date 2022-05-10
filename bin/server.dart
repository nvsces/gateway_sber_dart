import 'dart:convert';
import 'dart:io';

import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

import 'service.dart';

void main(List<String> arguments) async {
  print('Hello world!');
  var app = Router();
  final ip = InternetAddress.anyIPv4;

  app.get('/gateway/<amount>', (Request request, String amount) async {
    print('gateway endpoint');
    final service = Service();
    final url = await service.webviewPayment(amount);
    final body = {"formUrl": url};
    return Response.ok(jsonEncode(body),
        headers: {'Content-Type': 'application/json'});
  });

  app.get('/user/<user>', (Request request, String user) {
    return Response.ok('hello $user');
  });

  var server = await io.serve(app, ip, 9090);
}
