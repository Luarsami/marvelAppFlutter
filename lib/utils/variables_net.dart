import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

final baseUrl = dotenv.env['API_URL'];
final publicKey = dotenv.env['PUBLIC_KEY'];
final privateKey = dotenv.env['PRIVATE_KEY'];

final timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
final hash =
    md5.convert(utf8.encode('$timeStamp$privateKey$publicKey')).toString();
