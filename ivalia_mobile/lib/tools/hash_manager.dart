import 'dart:convert';
import 'package:crypto/crypto.dart' as crypto;

class HashManager {
  static String sha256(String input) {
    var bytes = utf8.encode(input);
    return crypto.sha256.convert(bytes).toString();
  }
}