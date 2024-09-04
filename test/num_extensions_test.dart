// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innerlibs/innerlibs.dart';

void main() {
  group('NumExtensions', () {
    test('formatFileSize', () {
      expect(1023.formatFileSize, equals('1023 bytes'));
      expect(1024.formatFileSize, equals('1.00 KB'));
      expect((1024 * 1024).formatFileSize, equals('1.00 MB'));
      expect((1024 * 1024 * 1024).formatFileSize, equals('1.00 GB'));
      expect((1024 * 1024 * 1024 * 1024).formatFileSize, equals('1.00 TB'));
      expect((1024 * 1024 * 1024 * 1024 * 1024).formatFileSize, equals('1.00 PB'));
    });

    test('widthBox', () {
      expect(100.widthBox, isA<SizedBox>());
      expect(100.widthBox.width, equals(100));
    });

    test('heightBox', () {
      expect(200.heightBox, isA<SizedBox>());
      expect(200.heightBox.height, equals(200));
    });

    test('delay', () async {
      final start = DateTime.now();
      await 100.delay();
      final end = DateTime.now();
      expect(end.difference(start).inMilliseconds, greaterThanOrEqualTo(100));
    });

    test('fixedLength', () {
      print(1.123456789.fixedLength(8));
      print(1.123456789.fixedLength(8, fractionDigits: 2));
    });

    // Add more test cases for other extension methods...
  });

  group('NumNullExtensions', () {
    test('isNullOrZero', () {
      expect(0.isNullOrZero, isTrue);
      expect(10.isNullOrZero, isFalse);
      expect((-10).isNullOrZero, isFalse);
      expect(null.isNullOrZero, isTrue);
    });

    test('nullIfZero', () {
      expect(0.nullIfZero, isNull);
      expect(10.nullIfZero, equals(10));
      expect((-10).nullIfZero, equals(-10));
      expect(null.nullIfZero, isNull);
    });

    // Add more test cases for other extension methods...
  });

  group('DurationExtensions', () {
    test('getFormatted', () {
      expect(const Duration(hours: 2, minutes: 30).getFormatted(), equals('2 h 30 min'));
      expect(const Duration(minutes: 45, seconds: 30).getFormatted(), equals('45 min 30 s'));
      expect(const Duration(seconds: 15, milliseconds: 500).getFormatted(includeMilliseconds: true), equals('15 s 500 ms'));
      expect(const Duration(seconds: 10, microseconds: 200).getFormatted(includeMicroseconds: true), equals('10 s 200 µs'));
    });

    test('formatted', () {
      expect(const Duration(hours: 1, minutes: 30).formatted, equals('1 h 30 min'));
      expect(const Duration(minutes: 45, seconds: 30).formatted, equals('45 min 30 s'));
      expect(const Duration(seconds: 15, milliseconds: 500).formatted, equals('15 s'));
    });

    test("Dir Json", () async {
      var s = await Directory("C:\\teste").toJson();
      print(jsonEncode(s));
    });

    // Add more test cases for other extension methods...

    test("Random Word", () async {
      var s = randomWord();
      print(jsonEncode(s));
    });

    test("days", () {
      consoleLog(DateUtils.day(1));
    });
    test("clamp", () {
      //1234567
      consoleLog(20.clampRotate(1, 7));
      //1234567
      consoleLog(-7.clampRotate(1, 7));
    });
  });
}
