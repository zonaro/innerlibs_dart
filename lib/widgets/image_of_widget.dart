import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

// ignore: must_be_immutable
class ImageOfWidget extends StatefulWidget implements Image {
  final Widget child;
  final double scale;
  @override
  final ImageFrameBuilder? frameBuilder;
  @override
  final ImageErrorWidgetBuilder? errorBuilder;
  @override
  final String? semanticLabel;
  @override
  final bool excludeFromSemantics;
  @override
  final double? width;
  @override
  final double? height;
  @override
  final Color? color;
  @override
  final Animation<double>? opacity;
  @override
  final BlendMode? colorBlendMode;
  @override
  final BoxFit? fit;
  @override
  final AlignmentGeometry alignment;
  @override
  final ImageRepeat repeat;
  @override
  final Rect? centerSlice;
  @override
  final bool matchTextDirection;
  @override
  final bool gaplessPlayback;
  @override
  final bool isAntiAlias;
  @override
  final FilterQuality filterQuality;

  @override
  ImageProvider<Object> image;

  @override
  final ImageLoadingBuilder? loadingBuilder;

  ImageOfWidget({
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
    this.filterQuality = FilterQuality.high,
    this.loadingBuilder,
  }) : image = MemoryImage(Uint8List(0), scale: scale);

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
          : Image(
              image: widget.image,
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
              loadingBuilder: widget.loadingBuilder,
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
      _imageBytes = await _globalKey.renderImageAsBytes();
      widget.image = MemoryImage(_imageBytes!, scale: widget.scale);
      setState(() {});
    } catch (e) {
      Future.delayed(const Duration(milliseconds: 500), () => _capturePng());
    }
  }
}
