import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/widgets.dart' as wg;
import 'package:innerlibs/innerlibs.dart';

/// Cria um ImageProvider com o placeholder gerado.
Future<wg.ImageProvider> placeholdImage({
  required dynamic size,
  Color background = const Color(0xFFCCCCCC),
  String text = '',
  Color? foreground,
  wg.TextStyle? textStyle,
  double minFontSize = 8.0,
}) async {
  final recorder = PictureRecorder();
  final canvas = Canvas(recorder);

  late Size s;

  if (size is Size) {
    s = size;
  } else if (size is wg.Size) {
    s = Size(size.width, size.height);
  } else if (size is String) {
    s = size.toSize;
  } else if (size is num) {
    s = Size.square(size.toDouble());
  } else {
    throw ArgumentError('Invalid size type. Use Size, int, double, num or String.');
  }

  if (s.isEmpty || s == Size.zero) {
    throw ArgumentError('Invalid size');
  }

  // Preenche o fundo
  final paint = Paint()..color = background;
  canvas.drawRect(Rect.fromLTWH(0, 0, s.width, s.height), paint);

  // Define o texto
  final displayText = (text.trim().isEmpty) ? '${s.width.toInt()}x${s.height.toInt()}' : text;

  // Define cor do texto
  foreground = foreground ?? background;

  if (foreground.isDark) {
    foreground = foreground.lighten(0.3);
  } else {
    foreground = foreground.darken(0.3);
  }

  // Configura estilo do texto e ajusta tamanho para caber em uma linha
  double fontSize = s.shortestSide * 0.1; // Tamanho inicial do texto baseado no tamanho do menor lado

  wg.TextPainter tp;

  textStyle ??= wg.TextStyle(
    color: foreground,
    fontSize: fontSize,
    fontWeight: FontWeight.bold,
  );

  do {
    textStyle = textStyle!.copyWith(fontSize: fontSize);
    final textSpan = wg.TextSpan(text: displayText, style: textStyle);
    tp = wg.TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
      maxLines: 1,
    );

    tp.layout(
      minWidth: 0,
      maxWidth: s.width,
    );
    fontSize -= 1;
  } while (tp.width > s.width && fontSize > minFontSize);

  // Centraliza o texto
  final dx = (s.width - tp.width) / 2;
  final dy = (s.height - tp.height) / 2;
  tp.paint(canvas, Offset(dx, dy));

  // Finaliza a imagem
  final picture = recorder.endRecording();
  final img = await picture.toImage(s.width.toInt(), s.height.toInt());

  // Converte para PNG
  final byteData = await img.toByteData(format: ImageByteFormat.png);
  final Uint8List pngBytes = byteData!.buffer.asUint8List();

  return wg.MemoryImage(pngBytes);
}
