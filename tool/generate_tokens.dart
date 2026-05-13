import 'dart:convert';
import 'dart:io';

void main() {
  final File input = File('tokens/design_tokens.light.json');
  final File output = File('lib/ui/tokens/design_tokens.dart');

  if (!input.existsSync()) {
    stderr.writeln('Token source file not found: ${input.path}');
    exitCode = 1;
    return;
  }

  final dynamic parsed = jsonDecode(input.readAsStringSync());
  if (parsed is! Map<String, dynamic>) {
    stderr.writeln('Invalid token JSON: root must be an object.');
    exitCode = 1;
    return;
  }

  final Map<String, dynamic> colors =
      (parsed['colors'] as Map?)?.cast<String, dynamic>() ??
          <String, dynamic>{};
  final Map<String, dynamic> numbers =
      (parsed['numbers'] as Map?)?.cast<String, dynamic>() ??
          <String, dynamic>{};

  final StringBuffer buffer = StringBuffer()
    ..writeln("import 'package:flutter/material.dart';")
    ..writeln()
    ..writeln('// GENERATED FILE - DO NOT EDIT BY HAND.')
    ..writeln('// Run: dart run tool/generate_tokens.dart')
    ..writeln('class AppTokens {')
    ..writeln('  const AppTokens._();')
    ..writeln();

  colors.forEach((String key, dynamic value) {
    if (value is! String || !value.startsWith('0x')) {
      stderr.writeln(
          'Invalid color token "$key": expected hex string like 0xFFAABBCC.');
      exitCode = 1;
      return;
    }
    buffer.writeln('  static const Color $key = Color($value);');
  });

  if (exitCode != 0) {
    return;
  }

  if (colors.isNotEmpty) {
    buffer.writeln();
  }

  numbers.forEach((String key, dynamic value) {
    if (value is! num) {
      stderr.writeln('Invalid numeric token "$key": expected number.');
      exitCode = 1;
      return;
    }
    final String literal =
        value % 1 == 0 ? '${value.toInt()}.0' : value.toString();
    buffer.writeln('  static const double $key = $literal;');
  });

  if (exitCode != 0) {
    return;
  }

  buffer
    ..writeln('}')
    ..writeln();

  output.writeAsStringSync(buffer.toString());
  stdout.writeln('Generated ${output.path} from ${input.path}');
}
