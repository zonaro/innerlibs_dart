import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

// *************************************
// *******  MilkTruck by Miguez  *******
// *************************************

/// A widget to draw a Milk Truck.
class MilkTruck extends StatelessWidget {
  final double width;
  final Color patchColor;
  final Color truckColor;
  final Color bumperColor;
  final Color strokeColor;
  final Color boxColor;
  final Color headLightColor;
  final Color rearViewMirrorColor;
  final Color frontGrilleColor;
  final Color ornamentColor;
  final Color windshieldColor;
  final double rotationAngle;

  const MilkTruck({
    super.key,
    required this.width,
    this.boxColor = NamedColor.milk,
    this.patchColor = NamedColor.black,
    this.truckColor = NamedColor.white,
    this.strokeColor = NamedColor.black,
    this.bumperColor = NamedColor.black,
    this.headLightColor = NamedColor.yellow,
    this.rearViewMirrorColor = NamedColor.black,
    this.frontGrilleColor = NamedColor.black,
    this.ornamentColor = NamedColor.black,
    this.windshieldColor = NamedColor.iceberg,
    this.rotationAngle = 0.0,
  });

  factory MilkTruck.fromTheme({required ThemeData theme, required double width}) {
    if (theme.brightness == ui.Brightness.dark) {
      return MilkTruck(
        width: width,
        boxColor: theme.colorScheme.secondary,
        patchColor: theme.colorScheme.primary,
        truckColor: theme.colorScheme.secondary,
        strokeColor: theme.colorScheme.onSurface,
        bumperColor: theme.colorScheme.onSurface,
        headLightColor: theme.colorScheme.onSurface,
        rearViewMirrorColor: theme.colorScheme.onSurface,
        frontGrilleColor: theme.colorScheme.onSurface,
        ornamentColor: theme.colorScheme.onSurface,
        windshieldColor: theme.colorScheme.onSurface,
      );
    } else {
      return MilkTruck(
        width: width,
        boxColor: theme.colorScheme.secondary,
        patchColor: theme.colorScheme.primary,
        truckColor: theme.colorScheme.secondary,
        strokeColor: theme.colorScheme.onSurface,
        bumperColor: theme.colorScheme.onSurface,
        headLightColor: theme.colorScheme.onSurface,
        rearViewMirrorColor: theme.colorScheme.onSurface,
        frontGrilleColor: theme.colorScheme.onSurface,
        ornamentColor: theme.colorScheme.onSurface,
        windshieldColor: theme.colorScheme.onSurface,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -math.pi / rotationAngle,
      child: CustomPaint(
        size: Size(width, (width * 1.8903846153846153).toDouble()),
        painter: _CaminhaoPainter(
          patchColor: patchColor,
          truckColor: truckColor,
          strokeColor: strokeColor,
          bumperColor: bumperColor,
          boxColor: boxColor,
          headLightColor: headLightColor,
          rearViewMirrorColor: rearViewMirrorColor,
          frontGrilleColor: frontGrilleColor,
          ornamentColor: ornamentColor,
          windshieldColor: windshieldColor,
        ),
      ),
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class _CaminhaoPainter extends CustomPainter {
  final Color patchColor;
  final Color truckColor;
  final Color bumperColor;
  final Color strokeColor;
  final Color boxColor;
  final Color headLightColor;
  final Color rearViewMirrorColor;
  final Color frontGrilleColor;
  final Color ornamentColor;
  final Color windshieldColor;

  _CaminhaoPainter({
    required this.boxColor,
    required this.bumperColor,
    required this.patchColor,
    required this.truckColor,
    required this.strokeColor,
    required this.headLightColor,
    required this.rearViewMirrorColor,
    required this.frontGrilleColor,
    required this.ornamentColor,
    required this.windshieldColor,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01538462;
    paint0Stroke.color = strokeColor.withOpacity(1.0);
    paint0Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawRRect(
        RRect.fromRectAndCorners(Rect.fromLTWH(size.width * 0.09423077, size.height * 0.8862258, size.width * 0.8230769, size.height * 0.1097050),
            bottomRight: Radius.circular(size.width * 0.07069231),
            bottomLeft: Radius.circular(size.width * 0.07069231),
            topLeft: Radius.circular(size.width * 0.07069231),
            topRight: Radius.circular(size.width * 0.07069231)),
        paint0Stroke);

    Paint parachoqueFill = Paint()..style = PaintingStyle.fill;
    parachoqueFill.color = bumperColor.withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(Rect.fromLTWH(size.width * 0.09423077, size.height * 0.8862258, size.width * 0.8230769, size.height * 0.1097050),
            bottomRight: Radius.circular(size.width * 0.07069231),
            bottomLeft: Radius.circular(size.width * 0.07069231),
            topLeft: Radius.circular(size.width * 0.07069231),
            topRight: Radius.circular(size.width * 0.07069231)),
        parachoqueFill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.06923077, size.height * 0.7121058);
    path_1.cubicTo(size.width * 0.06500000, size.height * 0.7121058, size.width * 0.06153846, size.height * 0.7102747, size.width * 0.06153846, size.height * 0.7080366);
    path_1.lineTo(size.width * 0.06153846, size.height * 0.06215666);
    path_1.cubicTo(size.width * 0.06153846, size.height * 0.03013225, size.width * 0.1108077, size.height * 0.004069176, size.width * 0.1713462, size.height * 0.004069176);
    path_1.lineTo(size.width * 0.8286538, size.height * 0.004069176);
    path_1.cubicTo(size.width * 0.8891923, size.height * 0.004069176, size.width * 0.9384615, size.height * 0.03013225, size.width * 0.9384615, size.height * 0.06215666);
    path_1.lineTo(size.width * 0.9384615, size.height * 0.7080366);
    path_1.cubicTo(size.width * 0.9384615, size.height * 0.7102747, size.width * 0.9350000, size.height * 0.7121058, size.width * 0.9307692, size.height * 0.7121058);
    path_1.lineTo(size.width * 0.06923077, size.height * 0.7121058);
    path_1.close();

    Paint paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01538462;
    paint1Stroke.color = strokeColor;
    paint1Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_1, paint1Stroke);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = boxColor;
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.8286538, size.height * 0.008138352);
    path_2.cubicTo(size.width * 0.8850385, size.height * 0.008138352, size.width * 0.9307692, size.height * 0.03232960, size.width * 0.9307692, size.height * 0.06215666);
    path_2.lineTo(size.width * 0.9307692, size.height * 0.7080366);
    path_2.lineTo(size.width * 0.06923077, size.height * 0.7080366);
    path_2.lineTo(size.width * 0.06923077, size.height * 0.06215666);
    path_2.cubicTo(size.width * 0.06923077, size.height * 0.03232960, size.width * 0.1149615, size.height * 0.008138352, size.width * 0.1713462, size.height * 0.008138352);
    path_2.lineTo(size.width * 0.8286538, size.height * 0.008138352);
    path_2.moveTo(size.width * 0.8286538, 0);
    path_2.lineTo(size.width * 0.1713462, 0);
    path_2.cubicTo(size.width * 0.1065385, 0, size.width * 0.05384615, size.height * 0.02787386, size.width * 0.05384615, size.height * 0.06215666);
    path_2.lineTo(size.width * 0.05384615, size.height * 0.7080366);
    path_2.cubicTo(size.width * 0.05384615, size.height * 0.7125331, size.width * 0.06073077, size.height * 0.7161750, size.width * 0.06923077, size.height * 0.7161750);
    path_2.lineTo(size.width * 0.9307692, size.height * 0.7161750);
    path_2.cubicTo(size.width * 0.9392692, size.height * 0.7161750, size.width * 0.9461538, size.height * 0.7125331, size.width * 0.9461538, size.height * 0.7080366);
    path_2.lineTo(size.width * 0.9461538, size.height * 0.06215666);
    path_2.cubicTo(size.width * 0.9461538, size.height * 0.02787386, size.width * 0.8934615, 0, size.width * 0.8286538, 0);
    path_2.lineTo(size.width * 0.8286538, 0);
    path_2.close();

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = strokeColor;
    canvas.drawPath(path_2, paint2Fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.3423077, size.height * 0.9766022);
    path_3.lineTo(size.width * 0.1978077, size.height * 0.9766022);
    path_3.cubicTo(size.width * 0.1395385, size.height * 0.9766022, size.width * 0.09230769, size.height * 0.9516175, size.width * 0.09230769, size.height * 0.9207935);
    path_3.lineTo(size.width * 0.09230769, size.height * 0.7289725);
    path_3.lineTo(size.width * 0.3249615, size.height * 0.9399797);
    path_3.lineTo(size.width * 0.3423077, size.height * 0.9766022);
    path_3.close();

    Paint paint3Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01538462;
    paint3Stroke.color = strokeColor.withOpacity(1.0);
    paint3Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_3, paint3Stroke);

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = truckColor.withOpacity(1.0);
    canvas.drawPath(path_3, paint3Fill);

    Path path_4 = Path();
    path_4.moveTo(size.width * 0.6653846, size.height * 0.9766022);
    path_4.lineTo(size.width * 0.8098846, size.height * 0.9766022);
    path_4.cubicTo(size.width * 0.8681538, size.height * 0.9766022, size.width * 0.9153846, size.height * 0.9516175, size.width * 0.9153846, size.height * 0.9207935);
    path_4.lineTo(size.width * 0.9153846, size.height * 0.7289725);
    path_4.cubicTo(size.width * 0.9153846, size.height * 0.7289725, size.width * 0.6827308, size.height * 0.9399797, size.width * 0.6827308, size.height * 0.9399797);
    path_4.lineTo(size.width * 0.6653846, size.height * 0.9766022);
    path_4.close();

    Paint paint4Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01538462;
    paint4Stroke.color = strokeColor;
    paint4Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_4, paint4Stroke);

    Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = truckColor;
    canvas.drawPath(path_4, paint4Fill);

    Path path_5 = Path();
    path_5.moveTo(size.width * 0.3423077, size.height * 0.9806714);
    path_5.cubicTo(size.width * 0.3387692, size.height * 0.9806714, size.width * 0.3356923, size.height * 0.9794100, size.width * 0.3348462, size.height * 0.9775992);
    path_5.lineTo(size.width * 0.3177692, size.height * 0.9415463);
    path_5.lineTo(size.width * 0.06257692, size.height * 0.7101119);
    path_5.cubicTo(size.width * 0.06119231, size.height * 0.7088505, size.width * 0.06119231, size.height * 0.7073042, size.width * 0.06257692, size.height * 0.7060427);
    path_5.cubicTo(size.width * 0.06396154, size.height * 0.7047813, size.width * 0.06650000, size.height * 0.7040081, size.width * 0.06923077, size.height * 0.7040081);
    path_5.lineTo(size.width * 0.9307692, size.height * 0.7040081);
    path_5.cubicTo(size.width * 0.9333077, size.height * 0.7040081, size.width * 0.9356923, size.height * 0.7046796, size.width * 0.9371154, size.height * 0.7057782);
    path_5.cubicTo(size.width * 0.9385385, size.height * 0.7068769, size.width * 0.9388462, size.height * 0.7083011, size.width * 0.9379231, size.height * 0.7095422);
    path_5.lineTo(size.width * 0.9225385, size.height * 0.7304781);
    path_5.cubicTo(size.width * 0.9223846, size.height * 0.7306816, size.width * 0.9222308, size.height * 0.7308647, size.width * 0.9220000, size.height * 0.7310478);
    path_5.lineTo(size.width * 0.6898846, size.height * 0.9415463);
    path_5.lineTo(size.width * 0.6728077, size.height * 0.9775992);
    path_5.cubicTo(size.width * 0.6719615, size.height * 0.9794100, size.width * 0.6688846, size.height * 0.9806714, size.width * 0.6653462, size.height * 0.9806714);
    path_5.lineTo(size.width * 0.3422692, size.height * 0.9806714);
    path_5.close();

    Paint paint5Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01538462;
    paint5Stroke.color = strokeColor;
    paint5Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_5, paint5Stroke);

    Paint paint5Fill = Paint()..style = PaintingStyle.fill;
    paint5Fill.color = truckColor;
    canvas.drawPath(path_5, paint5Fill);

    Paint paint7Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01538462;
    paint7Stroke.color = strokeColor;
    canvas.drawRRect(
        RRect.fromRectAndCorners(Rect.fromLTWH(size.width * 0.3500000, size.height * 0.9460834, size.width * 0.3076923, size.height * 0.01932859),
            bottomRight: Radius.circular(size.width * 0.01146154),
            bottomLeft: Radius.circular(size.width * 0.01146154),
            topLeft: Radius.circular(size.width * 0.01146154),
            topRight: Radius.circular(size.width * 0.01146154)),
        paint7Stroke);

    Paint paint7Fill = Paint()..style = PaintingStyle.fill;
    paint7Fill.color = frontGrilleColor;
    canvas.drawRRect(
        RRect.fromRectAndCorners(Rect.fromLTWH(size.width * 0.3500000, size.height * 0.9460834, size.width * 0.3076923, size.height * 0.01932859),
            bottomRight: Radius.circular(size.width * 0.01146154),
            bottomLeft: Radius.circular(size.width * 0.01146154),
            topLeft: Radius.circular(size.width * 0.01146154),
            topRight: Radius.circular(size.width * 0.01146154)),
        paint7Fill);

    Paint paint8Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01538462;
    paint8Stroke.color = strokeColor;
    canvas.drawRRect(
        RRect.fromRectAndCorners(Rect.fromLTWH(size.width * 0.1730769, size.height * 0.9420142, size.width * 0.1076923, size.height * 0.02034588),
            bottomRight: Radius.circular(size.width * 0.01688462),
            bottomLeft: Radius.circular(size.width * 0.01688462),
            topLeft: Radius.circular(size.width * 0.01688462),
            topRight: Radius.circular(size.width * 0.01688462)),
        paint8Stroke);

    Paint paint8Fill = Paint()..style = PaintingStyle.fill;
    paint8Fill.color = headLightColor;
    canvas.drawRRect(
        RRect.fromRectAndCorners(Rect.fromLTWH(size.width * 0.1730769, size.height * 0.9420142, size.width * 0.1076923, size.height * 0.02034588),
            bottomRight: Radius.circular(size.width * 0.01688462),
            bottomLeft: Radius.circular(size.width * 0.01688462),
            topLeft: Radius.circular(size.width * 0.01688462),
            topRight: Radius.circular(size.width * 0.01688462)),
        paint8Fill);

    Paint paint9Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01538462;
    paint9Stroke.color = strokeColor;
    canvas.drawRRect(
        RRect.fromRectAndCorners(Rect.fromLTWH(size.width * 0.7269231, size.height * 0.9420142, size.width * 0.1076923, size.height * 0.02034588),
            bottomRight: Radius.circular(size.width * 0.01688462),
            bottomLeft: Radius.circular(size.width * 0.01688462),
            topLeft: Radius.circular(size.width * 0.01688462),
            topRight: Radius.circular(size.width * 0.01688462)),
        paint9Stroke);

    Paint paint9Fill = Paint()..style = PaintingStyle.fill;
    paint9Fill.color = headLightColor;
    canvas.drawRRect(
        RRect.fromRectAndCorners(Rect.fromLTWH(size.width * 0.7269231, size.height * 0.9420142, size.width * 0.1076923, size.height * 0.02034588),
            bottomRight: Radius.circular(size.width * 0.01688462),
            bottomLeft: Radius.circular(size.width * 0.01688462),
            topLeft: Radius.circular(size.width * 0.01688462),
            topRight: Radius.circular(size.width * 0.01688462)),
        paint9Fill);

    Path path_10 = Path();
    path_10.moveTo(size.width * 0.5019231, size.height * 0.7538149);
    path_10.cubicTo(size.width * 0.5051154, size.height * 0.7600000, size.width * 0.5073846, size.height * 0.7661851, size.width * 0.5096923, size.height * 0.7723703);
    path_10.cubicTo(size.width * 0.5095385, size.height * 0.7785554, size.width * 0.5096538, size.height * 0.7847406, size.width * 0.5096154, size.height * 0.7909257);
    path_10.lineTo(size.width * 0.5096154, size.height * 0.8280570);
    path_10.cubicTo(size.width * 0.5096154, size.height * 0.8402848, size.width * 0.5096154, size.height * 0.8719227, size.width * 0.5096154, size.height * 0.8837436);
    path_10.cubicTo(size.width * 0.5072692, size.height * 0.8899288, size.width * 0.5050000, size.height * 0.8961139, size.width * 0.5019231, size.height * 0.9023194);
    path_10.cubicTo(size.width * 0.4988462, size.height * 0.8961343, size.width * 0.4965769, size.height * 0.8899491, size.width * 0.4942308, size.height * 0.8837640);
    path_10.cubicTo(size.width * 0.4942308, size.height * 0.8720651, size.width * 0.4942308, size.height * 0.8401831, size.width * 0.4942308, size.height * 0.8280570);
    path_10.cubicTo(size.width * 0.4942308, size.height * 0.8280570, size.width * 0.4942308, size.height * 0.7909257, size.width * 0.4942308, size.height * 0.7909257);
    path_10.cubicTo(size.width * 0.4942308, size.height * 0.7847406, size.width * 0.4943077, size.height * 0.7785554, size.width * 0.4941538, size.height * 0.7723703);
    path_10.cubicTo(size.width * 0.4964615, size.height * 0.7661851, size.width * 0.4987308, size.height * 0.7600000, size.width * 0.5019231, size.height * 0.7538149);
    path_10.lineTo(size.width * 0.5019231, size.height * 0.7538149);
    path_10.close();

    Paint paint10Fill = Paint()..style = PaintingStyle.fill;
    paint10Fill.color = truckColor.mergeWith(strokeColor, 0.5);
    canvas.drawPath(path_10, paint10Fill);

    Paint paint11Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01538462;
    paint11Stroke.color = strokeColor;
    canvas.drawOval(Rect.fromCenter(center: Offset(size.width * 0.5019231, size.height * 0.9247202), width: size.width * 0.06153846, height: size.height * 0.01220753), paint11Stroke);

    Paint paint11Fill = Paint()..style = PaintingStyle.fill;
    paint11Fill.color = ornamentColor;
    canvas.drawOval(Rect.fromCenter(center: Offset(size.width * 0.5019231, size.height * 0.9247202), width: size.width * 0.06153846, height: size.height * 0.01220753), paint11Fill);

    Path path_12 = Path();
    path_12.moveTo(size.width * 0.2653846, size.height * 0.7548321);
    path_12.cubicTo(size.width * 0.2735385, size.height * 0.7594710, size.width * 0.2808462, size.height * 0.7643540, size.width * 0.2881538, size.height * 0.7692167);
    path_12.cubicTo(size.width * 0.2933077, size.height * 0.7746694, size.width * 0.2986923, size.height * 0.7800814, size.width * 0.3039615, size.height * 0.7855137);
    path_12.lineTo(size.width * 0.3356923, size.height * 0.8180671);
    path_12.cubicTo(size.width * 0.3461538, size.height * 0.8287894, size.width * 0.3731538, size.height * 0.8565209, size.width * 0.3832692, size.height * 0.8668973);
    path_12.cubicTo(size.width * 0.3864615, size.height * 0.8728993, size.width * 0.3897692, size.height * 0.8788606, size.width * 0.3923077, size.height * 0.8850458);
    path_12.cubicTo(size.width * 0.3842692, size.height * 0.8803662, size.width * 0.3769615, size.height * 0.8754832, size.width * 0.3696154, size.height * 0.8706409);
    path_12.cubicTo(size.width * 0.3596154, size.height * 0.8603866, size.width * 0.3323846, size.height * 0.8324313, size.width * 0.3220000, size.height * 0.8218108);
    path_12.cubicTo(size.width * 0.3220000, size.height * 0.8218108, size.width * 0.2902692, size.height * 0.7892574, size.width * 0.2902692, size.height * 0.7892574);
    path_12.cubicTo(size.width * 0.2849615, size.height * 0.7838454, size.width * 0.2797692, size.height * 0.7783927, size.width * 0.2743462, size.height * 0.7730010);
    path_12.cubicTo(size.width * 0.2711154, size.height * 0.7670193, size.width * 0.2678077, size.height * 0.7610376, size.width * 0.2653846, size.height * 0.7548321);
    path_12.lineTo(size.width * 0.2653846, size.height * 0.7548321);
    path_12.close();

    Paint paint12Fill = Paint()..style = PaintingStyle.fill;
    paint12Fill.color = truckColor.mergeWith(strokeColor, .5);
    canvas.drawPath(path_12, paint12Fill);

    Path path_13 = Path();
    path_13.moveTo(size.width * 0.7384615, size.height * 0.7548321);
    path_13.cubicTo(size.width * 0.7360385, size.height * 0.7610376, size.width * 0.7327692, size.height * 0.7670193, size.width * 0.7295000, size.height * 0.7730010);
    path_13.cubicTo(size.width * 0.7240769, size.height * 0.7783927, size.width * 0.7188846, size.height * 0.7838454, size.width * 0.7135769, size.height * 0.7892574);
    path_13.lineTo(size.width * 0.6818462, size.height * 0.8218108);
    path_13.cubicTo(size.width * 0.6713846, size.height * 0.8325331, size.width * 0.6443846, size.height * 0.8602645, size.width * 0.6342692, size.height * 0.8706409);
    path_13.cubicTo(size.width * 0.6268846, size.height * 0.8755036, size.width * 0.6196154, size.height * 0.8803662, size.width * 0.6115769, size.height * 0.8850458);
    path_13.cubicTo(size.width * 0.6141154, size.height * 0.8788810, size.width * 0.6173846, size.height * 0.8728993, size.width * 0.6206154, size.height * 0.8668973);
    path_13.cubicTo(size.width * 0.6306154, size.height * 0.8566429, size.width * 0.6578462, size.height * 0.8286877, size.width * 0.6682308, size.height * 0.8180671);
    path_13.cubicTo(size.width * 0.6682308, size.height * 0.8180671, size.width * 0.6999615, size.height * 0.7855137, size.width * 0.6999615, size.height * 0.7855137);
    path_13.cubicTo(size.width * 0.7052308, size.height * 0.7800814, size.width * 0.7106154, size.height * 0.7746897, size.width * 0.7157692, size.height * 0.7692167);
    path_13.cubicTo(size.width * 0.7231154, size.height * 0.7643540, size.width * 0.7303846, size.height * 0.7594710, size.width * 0.7385385, size.height * 0.7548321);
    path_13.lineTo(size.width * 0.7385385, size.height * 0.7548321);
    path_13.close();

    Paint paint13Fill = Paint()..style = PaintingStyle.fill;
    paint13Fill.color = truckColor.mergeWith(strokeColor, .5);
    canvas.drawPath(path_13, paint13Fill);

    Path path_14 = Path();
    path_14.moveTo(size.width * 0.06923077, size.height * 0.6968464);
    path_14.lineTo(size.width * 0.06923077, size.height * 0.7080366);
    path_14.lineTo(size.width * 0.04530769, size.height * 0.6915972);
    path_14.cubicTo(size.width * 0.04100000, size.height * 0.6954018, size.width * 0.03388462, size.height * 0.6978637, size.width * 0.02596154, size.height * 0.6978637);
    path_14.cubicTo(size.width * 0.01269231, size.height * 0.6978637, size.width * 0.001923077, size.height * 0.6910275, size.width * 0.001923077, size.height * 0.6826043);
    path_14.lineTo(size.width * 0.001923077, size.height * 0.6602238);
    path_14.cubicTo(size.width * 0.001923077, size.height * 0.6518006, size.width * 0.01269231, size.height * 0.6449644, size.width * 0.02596154, size.height * 0.6449644);
    path_14.cubicTo(size.width * 0.03261538, size.height * 0.6449644, size.width * 0.03857692, size.height * 0.6466734, size.width * 0.04296154, size.height * 0.6494405);
    path_14.cubicTo(size.width * 0.04730769, size.height * 0.6522075, size.width * 0.05000000, size.height * 0.6560122, size.width * 0.05000000, size.height * 0.6602238);
    path_14.lineTo(size.width * 0.05000000, size.height * 0.6826043);
    path_14.cubicTo(size.width * 0.05000000, size.height * 0.6830519, size.width * 0.05000000, size.height * 0.6834995, size.width * 0.04988462, size.height * 0.6839471);
    path_14.lineTo(size.width * 0.06923077, size.height * 0.6968464);
    path_14.close();

    Paint paint14Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01538462;
    paint14Stroke.color = strokeColor;
    canvas.drawPath(path_14, paint14Stroke);

    Paint paint14Fill = Paint()..style = PaintingStyle.fill;
    paint14Fill.color = rearViewMirrorColor;
    canvas.drawPath(path_14, paint14Fill);

    Path path_15 = Path();
    path_15.moveTo(size.width * 0.9307692, size.height * 0.6968464);
    path_15.lineTo(size.width * 0.9307692, size.height * 0.7080366);
    path_15.cubicTo(size.width * 0.9307692, size.height * 0.7080366, size.width * 0.9546923, size.height * 0.6915972, size.width * 0.9546923, size.height * 0.6915972);
    path_15.cubicTo(size.width * 0.9590000, size.height * 0.6954018, size.width * 0.9661154, size.height * 0.6978637, size.width * 0.9740385, size.height * 0.6978637);
    path_15.cubicTo(size.width * 0.9873077, size.height * 0.6978637, size.width * 0.9980769, size.height * 0.6910275, size.width * 0.9980769, size.height * 0.6826043);
    path_15.lineTo(size.width * 0.9980769, size.height * 0.6602238);
    path_15.cubicTo(size.width * 0.9980769, size.height * 0.6518006, size.width * 0.9873077, size.height * 0.6449644, size.width * 0.9740385, size.height * 0.6449644);
    path_15.cubicTo(size.width * 0.9673846, size.height * 0.6449644, size.width * 0.9614231, size.height * 0.6466734, size.width * 0.9570385, size.height * 0.6494405);
    path_15.cubicTo(size.width * 0.9526923, size.height * 0.6522075, size.width * 0.9500000, size.height * 0.6560122, size.width * 0.9500000, size.height * 0.6602238);
    path_15.lineTo(size.width * 0.9500000, size.height * 0.6826043);
    path_15.cubicTo(size.width * 0.9500000, size.height * 0.6830519, size.width * 0.9500000, size.height * 0.6834995, size.width * 0.9501154, size.height * 0.6839471);
    path_15.lineTo(size.width * 0.9307692, size.height * 0.6968464);
    path_15.close();

    Paint paint15Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01538462;
    paint15Stroke.color = strokeColor;
    canvas.drawPath(path_15, paint15Stroke);

    Paint paint15Fill = Paint()..style = PaintingStyle.fill;
    paint15Fill.color = rearViewMirrorColor;
    canvas.drawPath(path_15, paint15Fill);

    Path path_16 = Path();
    path_16.moveTo(size.width * 0.5000000, size.height * 0.7202442);
    path_16.cubicTo(size.width * 0.3566923, size.height * 0.7202442, size.width * 0.2115769, size.height * 0.7174975, size.width * 0.06865385, size.height * 0.7121058);
    path_16.cubicTo(size.width * 0.06461538, size.height * 0.7119430, size.width * 0.06150000, size.height * 0.7101729, size.width * 0.06150000, size.height * 0.7080366);
    path_16.lineTo(size.width * 0.06150000, size.height * 0.6326551);
    path_16.cubicTo(size.width * 0.06150000, size.height * 0.6091556, size.width * 0.09765385, size.height * 0.5900305, size.width * 0.1420769, size.height * 0.5900305);
    path_16.lineTo(size.width * 0.8578846, size.height * 0.5900305);
    path_16.cubicTo(size.width * 0.9023077, size.height * 0.5900305, size.width * 0.9384615, size.height * 0.6091556, size.width * 0.9384615, size.height * 0.6326551);
    path_16.lineTo(size.width * 0.9384615, size.height * 0.7080366);
    path_16.cubicTo(size.width * 0.9384615, size.height * 0.7101729, size.width * 0.9353462, size.height * 0.7119430, size.width * 0.9313077, size.height * 0.7121058);
    path_16.cubicTo(size.width * 0.7896538, size.height * 0.7174568, size.width * 0.6458462, size.height * 0.7202035, size.width * 0.5038462, size.height * 0.7202442);
    path_16.lineTo(size.width * 0.5000000, size.height * 0.7202442);
    path_16.close();

    Paint paint16Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01538462;
    paint16Stroke.color = strokeColor;
    paint16Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_16, paint16Stroke);

    Paint paint16Fill = Paint()..style = PaintingStyle.fill;
    paint16Fill.color = truckColor;
    canvas.drawPath(path_16, paint16Fill);

    Path path_17 = Path();
    path_17.moveTo(size.width * 0.8578846, size.height * 0.5940997);
    path_17.cubicTo(size.width * 0.8981154, size.height * 0.5940997, size.width * 0.9307692, size.height * 0.6113530, size.width * 0.9307692, size.height * 0.6326551);
    path_17.lineTo(size.width * 0.9307692, size.height * 0.7080366);
    path_17.cubicTo(size.width * 0.7974615, size.height * 0.7130824, size.width * 0.6548462, size.height * 0.7161139, size.width * 0.5038462, size.height * 0.7161750);
    path_17.cubicTo(size.width * 0.5025769, size.height * 0.7161750, size.width * 0.5012692, size.height * 0.7161750, size.width * 0.5000000, size.height * 0.7161750);
    path_17.cubicTo(size.width * 0.3475769, size.height * 0.7161750, size.width * 0.2036154, size.height * 0.7131231, size.width * 0.06923077, size.height * 0.7080366);
    path_17.lineTo(size.width * 0.06923077, size.height * 0.6326551);
    path_17.cubicTo(size.width * 0.06923077, size.height * 0.6113733, size.width * 0.1018462, size.height * 0.5940997, size.width * 0.1421154, size.height * 0.5940997);
    path_17.lineTo(size.width * 0.8579231, size.height * 0.5940997);
    path_17.moveTo(size.width * 0.8578846, size.height * 0.5859613);
    path_17.lineTo(size.width * 0.1421154, size.height * 0.5859613);
    path_17.cubicTo(size.width * 0.09346154, size.height * 0.5859613, size.width * 0.05384615, size.height * 0.6068973, size.width * 0.05384615, size.height * 0.6326551);
    path_17.lineTo(size.width * 0.05384615, size.height * 0.7080366);
    path_17.cubicTo(size.width * 0.05384615, size.height * 0.7123093, size.width * 0.06007692, size.height * 0.7158494, size.width * 0.06811538, size.height * 0.7161546);
    path_17.cubicTo(size.width * 0.2112308, size.height * 0.7215666, size.width * 0.3565000, size.height * 0.7243133, size.width * 0.4999615, size.height * 0.7243133);
    path_17.lineTo(size.width * 0.5038077, size.height * 0.7243133);
    path_17.cubicTo(size.width * 0.6460000, size.height * 0.7242726, size.width * 0.7900000, size.height * 0.7215259, size.width * 0.9318077, size.height * 0.7161546);
    path_17.cubicTo(size.width * 0.9398462, size.height * 0.7158494, size.width * 0.9460769, size.height * 0.7123093, size.width * 0.9460769, size.height * 0.7080366);
    path_17.lineTo(size.width * 0.9460769, size.height * 0.6326551);
    path_17.cubicTo(size.width * 0.9460769, size.height * 0.6069176, size.width * 0.9065000, size.height * 0.5859613, size.width * 0.8578077, size.height * 0.5859613);
    path_17.lineTo(size.width * 0.8578077, size.height * 0.5859613);
    path_17.close();

    Paint paint17Fill = Paint()..style = PaintingStyle.fill;
    paint17Fill.color = strokeColor;
    canvas.drawPath(path_17, paint17Fill);

    Path path_18 = Path();
    path_18.moveTo(size.width * 0.5019231, size.height * 0.6937945);
    path_18.cubicTo(size.width * 0.3658462, size.height * 0.6937945, size.width * 0.2280769, size.height * 0.6920651, size.width * 0.09230769, size.height * 0.6886470);
    path_18.lineTo(size.width * 0.09230769, size.height * 0.6425636);
    path_18.cubicTo(size.width * 0.09230769, size.height * 0.6304374, size.width * 0.1212308, size.height * 0.6205493, size.width * 0.1568077, size.height * 0.6205493);
    path_18.lineTo(size.width * 0.8470385, size.height * 0.6205493);
    path_18.cubicTo(size.width * 0.8826154, size.height * 0.6205493, size.width * 0.9115385, size.height * 0.6304171, size.width * 0.9115385, size.height * 0.6425636);
    path_18.lineTo(size.width * 0.9115385, size.height * 0.6886470);
    path_18.cubicTo(size.width * 0.7770000, size.height * 0.6920244, size.width * 0.6404615, size.height * 0.6937538, size.width * 0.5056154, size.height * 0.6937945);
    path_18.lineTo(size.width * 0.5018846, size.height * 0.6937945);
    path_18.close();

    Paint paint18Fill = Paint()..style = PaintingStyle.fill;
    paint18Fill.shader = ui.Gradient.linear(Offset(size.width * 0.09230769, size.height * 0.6571719), Offset(size.width * 0.9115385, size.height * 0.6571719),
        [windshieldColor.makeLighter(), windshieldColor, windshieldColor.makeLighter()], [0, 0.51, 1]);
    canvas.drawPath(path_18, paint18Fill);

    Path path_19 = Path();
    path_19.moveTo(size.width * 0.8470385, size.height * 0.6236012);
    path_19.cubicTo(size.width * 0.8788846, size.height * 0.6236012, size.width * 0.9057692, size.height * 0.6322889, size.width * 0.9057692, size.height * 0.6425636);
    path_19.lineTo(size.width * 0.9057692, size.height * 0.6857375);
    path_19.cubicTo(size.width * 0.7730769, size.height * 0.6890336, size.width * 0.6385385, size.height * 0.6907223, size.width * 0.5056154, size.height * 0.6907426);
    path_19.lineTo(size.width * 0.5019231, size.height * 0.6907426);
    path_19.cubicTo(size.width * 0.3677692, size.height * 0.6907426, size.width * 0.2319615, size.height * 0.6890539, size.width * 0.09807692, size.height * 0.6857375);
    path_19.lineTo(size.width * 0.09807692, size.height * 0.6425636);
    path_19.cubicTo(size.width * 0.09807692, size.height * 0.6322889, size.width * 0.1249615, size.height * 0.6236012, size.width * 0.1568077, size.height * 0.6236012);
    path_19.lineTo(size.width * 0.8470385, size.height * 0.6236012);
    path_19.moveTo(size.width * 0.8470385, size.height * 0.6174975);
    path_19.lineTo(size.width * 0.1568077, size.height * 0.6174975);
    path_19.cubicTo(size.width * 0.1180000, size.height * 0.6174975, size.width * 0.08653846, size.height * 0.6287080, size.width * 0.08653846, size.height * 0.6425636);
    path_19.lineTo(size.width * 0.08653846, size.height * 0.6915565);
    path_19.cubicTo(size.width * 0.2161154, size.height * 0.6948525, size.width * 0.3549231, size.height * 0.6968464, size.width * 0.5019231, size.height * 0.6968464);
    path_19.cubicTo(size.width * 0.5031538, size.height * 0.6968464, size.width * 0.5043846, size.height * 0.6968464, size.width * 0.5056154, size.height * 0.6968464);
    path_19.cubicTo(size.width * 0.6512308, size.height * 0.6968057, size.width * 0.7887692, size.height * 0.6948321, size.width * 0.9173077, size.height * 0.6915565);
    path_19.lineTo(size.width * 0.9173077, size.height * 0.6425636);
    path_19.cubicTo(size.width * 0.9173077, size.height * 0.6287284, size.width * 0.8858462, size.height * 0.6174975, size.width * 0.8470385, size.height * 0.6174975);
    path_19.lineTo(size.width * 0.8470385, size.height * 0.6174975);
    path_19.close();

    Paint paint19Fill = Paint()..style = PaintingStyle.fill;
    paint19Fill.color = strokeColor;
    canvas.drawPath(path_19, paint19Fill);

    Path path_20 = Path();
    path_20.moveTo(size.width * 0.3884615, size.height * 0.03865717);
    path_20.cubicTo(size.width * 0.3701923, size.height * 0.04069176, size.width * 0.3598846, size.height * 0.03875890, size.width * 0.3538462, size.height * 0.03662258);
    path_20.cubicTo(size.width * 0.3445385, size.height * 0.03332655, size.width * 0.3416923, size.height * 0.02821974, size.width * 0.3346154, size.height * 0.02848423);
    path_20.cubicTo(size.width * 0.3274615, size.height * 0.02874873, size.width * 0.3233462, size.height * 0.03422177, size.width * 0.3230769, size.height * 0.03458800);
    path_20.cubicTo(size.width * 0.3186923, size.height * 0.04061038, size.width * 0.3261538, size.height * 0.04624619, size.width * 0.3269231, size.height * 0.04679552);
    path_20.cubicTo(size.width * 0.3312692, size.height * 0.04834181, size.width * 0.3373077, size.height * 0.05092574, size.width * 0.3426154, size.height * 0.05487284);
    path_20.cubicTo(size.width * 0.3513846, size.height * 0.06138352, size.width * 0.3533077, size.height * 0.06797558, size.width * 0.3538462, size.height * 0.07121058);
    path_20.cubicTo(size.width * 0.3538462, size.height * 0.07121058, size.width * 0.3576923, size.height * 0.1220753, size.width * 0.2884615, size.height * 0.1180061);
    path_20.cubicTo(size.width * 0.2192308, size.height * 0.1139369, size.width * 0.2038462, size.height * 0.1525941, size.width * 0.2038462, size.height * 0.1525941);
    path_20.cubicTo(size.width * 0.2038462, size.height * 0.1525941, size.width * 0.2038462, size.height * 0.1892167, size.width * 0.1461538, size.height * 0.1932859);
    path_20.cubicTo(size.width * 0.08846154, size.height * 0.1973550, size.width * 0.06923077, size.height * 0.1448627, size.width * 0.06923077, size.height * 0.1448627);
    path_20.lineTo(size.width * 0.06923077, size.height * 0.06215666);
    path_20.cubicTo(size.width * 0.06923077, size.height * 0.03232960, size.width * 0.1149615, size.height * 0.008138352, size.width * 0.1713462, size.height * 0.008138352);
    path_20.lineTo(size.width * 0.4230769, size.height * 0.008138352);
    path_20.cubicTo(size.width * 0.4236538, size.height * 0.009175992, size.width * 0.4300769, size.height * 0.02103764, size.width * 0.4153846, size.height * 0.03051882);
    path_20.cubicTo(size.width * 0.4056154, size.height * 0.03682604, size.width * 0.3923846, size.height * 0.03829095, size.width * 0.3884615, size.height * 0.03865717);
    path_20.close();

    Paint paint20Fill = Paint()..style = PaintingStyle.fill;
    paint20Fill.color = patchColor;
    canvas.drawPath(path_20, paint20Fill);

    Path path_21 = Path();
    path_21.moveTo(size.width * 0.9307692, size.height * 0.06215666);
    path_21.lineTo(size.width * 0.9307692, size.height * 0.1487487);
    path_21.cubicTo(size.width * 0.9201538, size.height * 0.1474059, size.width * 0.9115385, size.height * 0.1464903, size.width * 0.9115385, size.height * 0.1464903);
    path_21.cubicTo(size.width * 0.9115385, size.height * 0.1464903, size.width * 0.8307692, size.height * 0.1424212, size.width * 0.8331154, size.height * 0.1935097);
    path_21.cubicTo(size.width * 0.8354231, size.height * 0.2445982, size.width * 0.7653846, size.height * 0.2441506, size.width * 0.7653846, size.height * 0.2441506);
    path_21.cubicTo(size.width * 0.7653846, size.height * 0.2441506, size.width * 0.6807692, size.height * 0.2360122, size.width * 0.6961538, size.height * 0.2054934);
    path_21.cubicTo(size.width * 0.7115385, size.height * 0.1749746, size.width * 0.6769231, size.height * 0.1566633, size.width * 0.6038462, size.height * 0.1586979);
    path_21.cubicTo(size.width * 0.5307692, size.height * 0.1607325, size.width * 0.5192308, size.height * 0.1485249, size.width * 0.5192308, size.height * 0.1485249);
    path_21.cubicTo(size.width * 0.5192308, size.height * 0.1485249, size.width * 0.4538462, size.height * 0.1159715, size.width * 0.5673077, size.height * 0.08455748);
    path_21.cubicTo(size.width * 0.6569615, size.height * 0.05971516, size.width * 0.6589615, size.height * 0.02262462, size.width * 0.6558846, size.height * 0.008138352);
    path_21.lineTo(size.width * 0.8286538, size.height * 0.008138352);
    path_21.cubicTo(size.width * 0.8850385, size.height * 0.008138352, size.width * 0.9307692, size.height * 0.03232960, size.width * 0.9307692, size.height * 0.06215666);
    path_21.close();

    Paint paint21Fill = Paint()..style = PaintingStyle.fill;
    paint21Fill.color = patchColor;
    canvas.drawPath(path_21, paint21Fill);

    Path path_22 = Path();
    path_22.moveTo(size.width * 0.6270000, size.height * 0.5263683);
    path_22.cubicTo(size.width * 0.6270000, size.height * 0.5263683, size.width * 0.6513077, size.height * 0.4196948, size.width * 0.6415769, size.height * 0.4032757);
    path_22.cubicTo(size.width * 0.6318462, size.height * 0.3868566, size.width * 0.6367308, size.height * 0.3704578, size.width * 0.6561538, size.height * 0.3540387);
    path_22.cubicTo(size.width * 0.6756154, size.height * 0.3376195, size.width * 0.8749615, size.height * 0.3403662, size.width * 0.8749615, size.height * 0.4196948);
    path_22.cubicTo(size.width * 0.8749615, size.height * 0.4990234, size.width * 0.7388077, size.height * 0.5564598, size.width * 0.6999231, size.height * 0.5564598);
    path_22.cubicTo(size.width * 0.6610385, size.height * 0.5564598, size.width * 0.6221154, size.height * 0.5509868, size.width * 0.6270000, size.height * 0.5263683);
    path_22.close();

    Paint paint22Fill = Paint()..style = PaintingStyle.fill;
    paint22Fill.color = patchColor;
    canvas.drawPath(path_22, paint22Fill);

    Path path_23 = Path();
    path_23.moveTo(size.width * 0.5215769, size.height * 0.3947304);
    path_23.cubicTo(size.width * 0.5184615, size.height * 0.4048627, size.width * 0.5136154, size.height * 0.4145473, size.width * 0.5000000, size.height * 0.4231943);
    path_23.cubicTo(size.width * 0.4813462, size.height * 0.4350560, size.width * 0.4601923, size.height * 0.4361139, size.width * 0.4384615, size.height * 0.4415056);
    path_23.cubicTo(size.width * 0.3698077, size.height * 0.4585148, size.width * 0.3901538, size.height * 0.4950966, size.width * 0.3281154, size.height * 0.5097660);
    path_23.cubicTo(size.width * 0.2874615, size.height * 0.5193896, size.width * 0.2326154, size.height * 0.5145677, size.width * 0.2047692, size.height * 0.5030315);
    path_23.cubicTo(size.width * 0.2004615, size.height * 0.5012411, size.width * 0.1922692, size.height * 0.4974161, size.width * 0.1863077, size.height * 0.4945473);
    path_23.cubicTo(size.width * 0.1547692, size.height * 0.4793082, size.width * 0.1511923, size.height * 0.4737131, size.width * 0.1384615, size.height * 0.4699898);
    path_23.cubicTo(size.width * 0.1262308, size.height * 0.4664293, size.width * 0.1056538, size.height * 0.4646185, size.width * 0.06923077, size.height * 0.4732655);
    path_23.lineTo(size.width * 0.06923077, size.height * 0.3122482);
    path_23.cubicTo(size.width * 0.07223077, size.height * 0.3139776, size.width * 0.1197692, size.height * 0.3404273, size.width * 0.1846154, size.height * 0.3336724);
    path_23.cubicTo(size.width * 0.2243077, size.height * 0.3295422, size.width * 0.2476923, size.height * 0.3153611, size.width * 0.2548462, size.height * 0.3106612);
    path_23.cubicTo(size.width * 0.2954615, size.height * 0.2789420, size.width * 0.3571538, size.height * 0.2618515, size.width * 0.4141538, size.height * 0.2669583);
    path_23.cubicTo(size.width * 0.4519231, size.height * 0.2703561, size.width * 0.4760000, size.height * 0.2824415, size.width * 0.4846154, size.height * 0.2868769);
    path_23.cubicTo(size.width * 0.5450385, size.height * 0.3180468, size.width * 0.5301538, size.height * 0.3667345, size.width * 0.5215769, size.height * 0.3947304);
    path_23.close();

    Paint paint23Fill = Paint()..style = PaintingStyle.fill;
    paint23Fill.color = patchColor;
    canvas.drawPath(path_23, paint23Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
