import 'dart:math';

import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

class WaveContainer extends StatefulWidget {
  final double waterVolume;

  final Color waterColor;
  const WaveContainer({
    super.key,
    this.waterVolume = 0.5,
    this.waterColor = Colors.blue,
  });

  @override
  createState() => _WaveContainerState();
}

class WavePainter extends CustomPainter {
  final double animationValue;
  final double waterVolume;
  final Color waterColor;

  WavePainter({required this.animationValue, required this.waterVolume, required this.waterColor});
  @override
  void paint(Canvas canvas, Size size) {
    // Draw the rest of water below the waves
    final underwaterPaint = Paint()
      ..color = waterColor
      ..style = PaintingStyle.fill;

    canvas.drawRect(Rect.fromLTWH(0, (size.height * (1 - waterVolume)) + 20, size.width, (size.height * (1 - waterVolume))), underwaterPaint);
 
   


    final paint = Paint()
      ..color = waterColor
      ..style = PaintingStyle.fill;

    final path1 = Path();
    const waveHeight = 20.0;
    final waveLength = size.width / 2;

    path1.moveTo(0, size.height * (1 - waterVolume));
    for (double i = 0; i <= size.width; i++) {
      path1.lineTo(
        i,
        size.height * (1 - waterVolume) - waveHeight * sin((i / waveLength * 2 * pi) + (animationValue * 2 * pi)),
      );
    }
    path1.lineTo(size.width, size.height);
    path1.close();

    canvas.drawPath(path1, paint);

    // Add a second wave with a different color and reverse animation
    final paint2 = Paint()
      ..color = waterColor.withOpacity(0.7)
      ..style = PaintingStyle.fill;

    final path2 = Path();
    const waveHeight2 = 15.0;
    final waveLength2 = size.width / 3;

    path2.moveTo(0, size.height * (1 - waterVolume));
    for (double i = 0; i <= size.width; i++) {
      path2.lineTo(
        i,
        size.height * (1 - waterVolume) - waveHeight2 * sin((i / waveLength2 * 2 * pi) - (animationValue * 2 * pi)),
      );
    }
    path2.lineTo(size.width, size.height);
    path2.close();

    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _WaveContainerState extends State<WaveContainer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: 200,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: WavePainter(
              animationValue: _controller.value,
              waterVolume: widget.waterVolume,
              waterColor: widget.waterColor,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }
}
