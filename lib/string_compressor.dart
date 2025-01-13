import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

/// performs string compression in same isolate
String compressSync(String s) {
  List<int> bytes = utf8.encode(s);
  List<int> compressedBytes = GZipCodec().encode(bytes);
  return base64.encode(compressedBytes);
}

/// performs string decompression in same isolate
String decompressSync(String s) {
  List<int> compressedBytes = base64.decode(s);
  List<int> decompressedBytes = GZipCodec().decode(compressedBytes);
  return utf8.decode(decompressedBytes);
}

/// performs string compression in a separate isolate
Future<String> compress(String s) async {
  return await compute(compressSync, s);
}

/// performs string decompression in a separate isolate
Future<String> decompress(String s) async {
  return await compute(decompressSync, s);
}
