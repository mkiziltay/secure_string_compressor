import 'dart:convert';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart' as encrypt;

class AesEncryption {
  late encrypt.Key _key;
  late encrypt.IV _iv;
  late encrypt.Encrypter _encrypter;

  AesEncryption(String key, String iv) {
    _key = encrypt.Key(uint8ListFromBase64Key(key));
    _iv = encrypt.IV(uint8ListFromBase64Key(iv));
    _encrypter = encrypt.Encrypter(encrypt.AES(_key));
  }

  _encryptString(String text) => _encrypter.encrypt(text, iv: _iv);

  _decryptString(encrypt.Encrypted text) => _encrypter.decrypt(text, iv: _iv);

  getCode(String encoded) => encrypt.Encrypted.fromBase64(encoded);

  encrypt.Key generateKey(int length) {
    return encrypt.Key.fromLength(length);
  }

  String base64KeyFromUint8List(Uint8List intList) {
    return base64Encode(intList);
  }

  Uint8List uint8ListFromBase64Key(String encodedKey) {
    return base64Decode(encodedKey);
  }

  encryption(String data, String aesKey, String ivKey) {
    return _encryptString(data);
  }

  decryption(encrypt.Encrypted encoded, String aesKey, String ivKey) {
    return _decryptString(encoded);
  }
}
