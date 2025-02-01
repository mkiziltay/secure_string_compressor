# Secure String Compressor

A Dart package to compress and decompress strings using GZip and Base64 encoding with AES Encryption. It performs both compression and encrypted decompression at the same time.
If you wish, you can also use the compression process to compress your data in an unencrypted form. Below is a format that will serve both of your requests.

## Features
** Encrypt and decrypt string data while compressing-decompressing with AES encryption.
** Compress and decompress string data using gzip without encryption.
** Combine encryption and compression for secure and efficient data storage and transmission.

## Installation
Add the following to your pubspec.yaml file:
```
dependencies:
  secure_string_compressor: ^1.1.0
```
Then install it by running flutter pub get in your terminal.

## Usage

* With Encryption
```dart
// Import the package
import 'package:secure_string_compressor/secure_string_compressor.dart';

// Compress and encrypt a string with aes key
String compressedString = await secureCompressSync("your string");

// Decompress a string from encrypted string with same aes key
String decompressedString = await secureDecompressSync(compressedString);
```

* Without encrytion
```dart
// Import the package
import 'package:secure_string_compressor/string_compressor.dart';

// Compress a string without encryption process
String compressedString = compress("your string");

// Decompress a unencrypted string from compressed string
String decompressedString = decompress(compressedString);
```
