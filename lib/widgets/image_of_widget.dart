import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ImageOfWidget extends StatefulWidget {
  final Widget child;
  final double scale;
  final ImageFrameBuilder? frameBuilder;
  final ImageErrorWidgetBuilder? errorBuilder;
  final String? semanticLabel;
  final bool excludeFromSemantics;
  final double? width;
  final double? height;
  final Color? color;
  final Animation<double>? opacity;
  final BlendMode? colorBlendMode;
  final BoxFit? fit;
  final AlignmentGeometry alignment;
  final ImageRepeat repeat;
  final Rect? centerSlice;
  final bool matchTextDirection;
  final bool gaplessPlayback;
  final bool isAntiAlias;
  final FilterQuality filterQuality;

  const ImageOfWidget({
    super.key,
    required this.child,
    this.scale = 1.0,
    this.frameBuilder,
    this.errorBuilder,
    this.semanticLabel,
    this.excludeFromSemantics = false,
    this.width,
    this.height,
    this.color,
    this.opacity,
    this.colorBlendMode,
    this.fit,
    this.alignment = Alignment.center,
    this.repeat = ImageRepeat.noRepeat,
    this.centerSlice,
    this.matchTextDirection = false,
    this.gaplessPlayback = false,
    this.isAntiAlias = false,
    this.filterQuality = FilterQuality.medium,
  });

  @override
  createState() => _ImageOfWidgetState();
}

class _ImageOfWidgetState extends State<ImageOfWidget> {
  final GlobalKey _globalKey = GlobalKey();
  Uint8List? _imageBytes;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: _imageBytes == null
          ? RepaintBoundary(
              key: _globalKey,
              child: widget.child,
            )
          : Image.memory(
              _imageBytes!,
              scale: widget.scale,
              frameBuilder: widget.frameBuilder,
              errorBuilder: widget.errorBuilder,
              semanticLabel: widget.semanticLabel,
              excludeFromSemantics: widget.excludeFromSemantics,
              width: widget.width,
              height: widget.height,
              color: widget.color,
              opacity: widget.opacity,
              colorBlendMode: widget.colorBlendMode,
              fit: widget.fit,
              alignment: widget.alignment,
              repeat: widget.repeat,
              centerSlice: widget.centerSlice,
              matchTextDirection: widget.matchTextDirection,
              gaplessPlayback: widget.gaplessPlayback,
              isAntiAlias: widget.isAntiAlias,
              filterQuality: widget.filterQuality,
            ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _capturePng());
  }

  Future<void> _capturePng() async {
    try {
      RenderRepaintBoundary boundary = _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();
      setState(() {
        _imageBytes = pngBytes;
      });
    } catch (e) {
      Future.delayed(const Duration(milliseconds: 500), () => _capturePng());
    }
  }
}
