import 'package:encrypt/encrypt.dart';

class EncryptionManager {
  static final _key = Key.fromUtf8('kjdf&%v34vcsgOcRkxFXOI45\$6,FDodf');
  static final _iv = IV.fromUtf8('.\$#shsFlkFgfsfW8');

  static String encrypt(String input) {
    final encryptor = Encrypter(AES(_key, mode: AESMode.cbc));
    final encrypted = encryptor.encrypt(input, iv: _iv);
    return encrypted.base64;
  }

  static String decrypt(String input) {
    final encryptor = Encrypter(AES(_key, mode: AESMode.cbc));
    final decrypted = encryptor.decrypt(Encrypted.fromBase64(input), iv: _iv);
    return decrypted;
  }
}