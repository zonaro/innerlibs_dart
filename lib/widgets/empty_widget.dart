import 'dart:math';

import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

/// {@tool snippet}
///
/// This example shows how to use [EmptyWidget]
///
///  ``` dart
/// EmptyWidget(
///   image: null,
///   packageImage: PackageImage.Image_1,
///   title: 'No Notification',
///   subTitle: 'No  notification available yet',
///   titleTextStyle: TextStyle(
///     fontSize: 22,
///     color: Color(0xff9da9c7),
///     fontWeight: FontWeight.w500,
///   ),
///   subtitleTextStyle: TextStyle(
///     fontSize: 14,
///     color: Color(0xffabb8d6),
///   ),
/// )
/// ```
/// {@end-tool}

class EmptyWidget extends StatefulWidget {
  /// Display image, Text or icon
  final dynamic child;

  /// Set text for subTitle
  final String? subTitle;

  /// Set text style for subTitle
  final TextStyle? subtitleTextStyle;

  /// Set text for title
  final String? title;

  /// Text style for title
  final TextStyle? titleTextStyle;

  /// Hides the background circular ball animation
  ///
  /// By default `false` value is set
  final bool showBackgroundAnimation;

  /// Background color for the circular ball animation
  final Color backgroundColor;

  /// Shadow color for the circular ball animation
  final Color? shadowColor;

  const EmptyWidget({
    super.key,
    this.title,
    this.subTitle,
    this.subtitleTextStyle,
    this.titleTextStyle,
    this.child,
    this.showBackgroundAnimation = true,
    this.backgroundColor = Colors.transparent,
    this.shadowColor,
  });

  @override
  State<StatefulWidget> createState() => _EmptyListWidgetState();
}

class _EmptyListWidgetState extends State<EmptyWidget> with TickerProviderStateMixin {
  // String title, subTitle,image = 'assets/images/emptyImage.png';

  late AnimationController _backgroundController;

  late Animation _imageAnimation; /*!*/
  AnimationController? _imageController; /*!*/
  TextStyle? _subtitleTextStyle; /*!*/
  TextStyle? _titleTextStyle; /*!*/
  late AnimationController _widgetController; /*!*/

  animationListner() {
    if (_imageController == null) {
      return;
    }
    if (_imageController!.isCompleted) {
      setState(() {
        _imageController!.reverse();
      });
    } else {
      setState(() {
        _imageController!.forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _shell(child: _shellChild());
  }

  @override
  void dispose() {
    _backgroundController.dispose();
    _imageController!.dispose();
    _widgetController.dispose();
    super.dispose();
  }

  double getDimention(double unit) {
    if (context.width <= 360.0) {
      return unit / 1.3;
    } else {
      return unit;
    }
  }

  double getHeightDimention(double unit) {
    if (context.height <= 460.0) {
      return unit / 1.5;
    } else {
      return getDimention(unit);
    }
  }

  @override
  void initState() {
    _backgroundController = AnimationController(duration: const Duration(minutes: 1), vsync: this, lowerBound: 0, upperBound: 20)..repeat();
    _widgetController = AnimationController(duration: const Duration(seconds: 1), vsync: this, lowerBound: 0, upperBound: 1)..forward();
    _imageController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
    _imageAnimation = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(parent: _imageController!, curve: Curves.linear),
    );
    super.initState();
  }

  Widget _imageBackground() {
    return Container(
      width: getHeightDimention(context.width * .95),
      height: getHeightDimention(context.width * .95),
      decoration: BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(
          offset: const Offset(0, 0),
          color: widget.shadowColor ?? context.colorScheme.primary,
        ),
        BoxShadow(blurRadius: 30, offset: const Offset(20, 0), color: widget.backgroundColor, spreadRadius: -5),
      ], shape: BoxShape.circle),
    );
  }

  Widget _imageWidget() {
    return Expanded(
      flex: 3,
      child: AnimatedBuilder(
        animation: _imageAnimation,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
            offset: Offset(0, sin(_imageAnimation.value > .9 ? 1 - _imageAnimation.value : _imageAnimation.value)),
            child: child,
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: forceWidget(widget.child, fit: BoxFit.contain, alignment: Alignment.center),
        ),
      ),
    );
  }

  Widget _shell({Widget? child}) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxHeight > constraints.maxWidth) {
        return SizedBox(
          height: constraints.maxWidth,
          width: constraints.maxWidth,
          child: child,
        );
      } else {
        return child!;
      }
    });
  }

  Widget _shellChild() {
    _titleTextStyle = widget.titleTextStyle ?? context.theme.typography.dense.headlineSmall!.copyWith(color: context.colorScheme.primary);
    _subtitleTextStyle = widget.subtitleTextStyle ?? context.theme.typography.dense.bodyLarge!.copyWith(color: context.colorScheme.primary);

    bool noImage = widget.child == null;

    return FadeTransition(
      opacity: _widgetController,
      child: Container(
        alignment: Alignment.center,
        color: Colors.transparent,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            if (widget.showBackgroundAnimation)
              RotationTransition(
                turns: _backgroundController,
                child: _imageBackground(),
              ),
            LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
              return Container(
                height: constraints.maxWidth,
                width: constraints.maxWidth - 30,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    if (noImage == false)
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                    if (noImage == false) _imageWidget(),
                    Column(
                      children: <Widget>[
                        if (widget.title != null)
                          Text(
                            widget.title!,
                            style: _titleTextStyle,
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.center,
                          ),
                        const SizedBox(
                          height: 10,
                        ),
                        if (widget.subTitle != null) Text(widget.subTitle!, style: _subtitleTextStyle, overflow: TextOverflow.clip, textAlign: TextAlign.center)
                      ],
                    ),
                    if (noImage == false)
                      Expanded(
                        flex: 1,
                        child: Container(),
                      )
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
