library shrink_string_dart;

import 'package:encrypt/encrypt.dart';
import 'package:flutter/foundation.dart';
import 'aes_encryption.dart';
import 'string_compressor.dart';

Future<String> secureCompressSync(
    {required String data,
    required String encryptionKey,
    required String initialVector}) async {
  List<String> args = [data, encryptionKey, initialVector];
  return await compute(secureCompress, args);
}

Future<String> secureDecompressSync(
    {required String encoded,
    required String decryptionKey,
    required String initialVector}) async {
  List<String> args = [encoded, decryptionKey, initialVector];
  return await compute(secureDecompress, args);
}

Future<String> secureCompress(List<String> args) async {
  String data = args[0];
  String key = args[1];
  String vector = args[2];

  AesEncryption encryptor = AesEncryption(key, vector);
  //compress
  String compressed = compressSync(data);
  //encrypt
  Encrypted encoded = encryptor.encryption(compressed, key, vector);
  return encoded.base64;
}

Future<String> secureDecompress(List<String> args) async {
  String encoded = args[0];
  String key = args[1];
  String vector = args[2];

  AesEncryption encryptor = AesEncryption(key, vector);
  //decrypt
  String decoded =
      encryptor.decryption(Encrypted.fromBase64(encoded), key, vector);
  return decompressSync(decoded);
}
