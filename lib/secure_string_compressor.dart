library shrink_string_dart;

import 'package:encrypt/encrypt.dart';
import 'aes_encryption.dart';
import 'string_compressor.dart';

String secureCompressSync(
    {required String data,
    required String encryptionKey,
    required String initialVector}) {
  AesEncryption encryptor = AesEncryption(encryptionKey, initialVector);
  //compress
  String compressed = compressSync(data);
  //encrypt
  Encrypted encoded =
      encryptor.encryption(compressed, encryptionKey, initialVector);
  return encoded.base64;
}

String secureDecompressSync(
    {required String encoded,
    required String decryptionKey,
    required String initialVector}) {
  AesEncryption encryptor = AesEncryption(decryptionKey, initialVector);
  //decrypt
  String decoded = encryptor.decryption(
      Encrypted.fromBase64(encoded), decryptionKey, initialVector);
  return decompressSync(decoded);
}
