# Secure String Compressor

A Dart package for compressing and decompressing strings using AES Encryptology process with GZip and Base64 encoding.


## Usage

```dart
// Import the package
import 'package:secure_string_compressor/secure_string_compressor.dart';

// Compress and encrypt a string with aes key
String compressedString = secureCompressSync("your string");

// Decompress a string from encrypted string with same aes key
String decompressedString = secureDecompressSync(compressedString);


## Installation
```yaml
dependencies:
  secure_string_compressor: ^1.0.0
```
Then install it by running flutter pub get in your terminal.