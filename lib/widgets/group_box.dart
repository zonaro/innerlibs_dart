import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GroupBox extends SingleChildRenderObjectWidget {
  final Color titleColor;
  final Color backgroundColor;
  final String title;
  final TextAlign textAlign;
  final double fontSize;

  const GroupBox({
    Key? key,
    required this.title,
    required Widget child,
    this.textAlign = TextAlign.left,
    this.fontSize = 14.0,
    this.titleColor = Colors.black,
    this.backgroundColor = Colors.white,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderGroupBox(
      titleColor: titleColor,
      title: title,
      fontSize: fontSize,
      backgroundColor: backgroundColor,
      textAlign: textAlign,
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderGroupBox renderObject) {
    renderObject.titleColor = titleColor;
    renderObject.backgroundColor = backgroundColor;
    renderObject.title = title;
    renderObject.fontSize = fontSize;
    renderObject.textAlign = textAlign;
  }
}

class RenderGroupBox extends RenderBox with RenderObjectWithChildMixin<RenderBox> {
  RenderGroupBox({
    required Color titleColor,
    required String title,
    required double fontSize,
    required Color backgroundColor,
    required TextAlign textAlign,
  })  : _titleColor = titleColor,
        _title = title,
        _textAlign = textAlign,
        _backgroundColor = backgroundColor,
        _fontSize = fontSize;

  Color get titleColor => _titleColor;
  Color _titleColor;
  set titleColor(Color value) {
    if (_titleColor == value) return;
    _titleColor = value;
    markNeedsPaint();
  }

  Color get backgroundColor => _backgroundColor;
  Color _backgroundColor;
  set backgroundColor(Color value) {
    if (_backgroundColor == value) return;
    _backgroundColor = value;
    markNeedsPaint();
  }

  String get title => _title;
  String _title;
  set title(String value) {
    if (_title == value) return;
    _title = value;
    markNeedsPaint();
  }

  TextAlign get textAlign => _textAlign;
  TextAlign _textAlign;
  set textAlign(TextAlign value) {
    if (_textAlign == value) return;
    _textAlign = value;
    markNeedsPaint();
  }

  double get fontSize => _fontSize;
  double _fontSize;
  set fontSize(double value) {
    if (_fontSize == value) return;
    _fontSize = value;
    markNeedsPaint();
  }

  @override
  void performLayout() {
    if (child == null) {
      size = constraints.smallest;
    } else {
      child!.layout(constraints, parentUsesSize: true);
      size = constraints.constrain(Size(child!.size.width, child!.size.height));
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child != null) {
      context.paintChild(child!, offset);

      final canvas = context.canvas;
      canvas.save();
      canvas.translate(offset.dx, offset.dy);
      final textSpan = TextSpan(
        text: ' $title ',
        style: TextStyle(
          color: titleColor,
          fontSize: fontSize,
          height: 1.0,
          backgroundColor: backgroundColor,
        ),
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(
        minWidth: 0,
        maxWidth: size.width,
      );

      final TextPainter txtPainter = TextPainter(text: textSpan, textDirection: TextDirection.ltr);
      txtPainter.layout(minWidth: 0, maxWidth: double.infinity);
      double xPos = 10.0;
      switch (textAlign) {
        case TextAlign.center:
          xPos = (size.width - txtPainter.size.width) / 2.0;
          break;
        case TextAlign.right:
          xPos = (size.width - txtPainter.size.width - 10);
          break;
        default:
          xPos = 10.0;
      }
      final titleOffset = Offset(xPos, -fontSize / 2);
      textPainter.paint(canvas, titleOffset);

      canvas.restore();
    }
  }

  @protected
  @override
  bool get alwaysNeedsCompositing => true;
}
