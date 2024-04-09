import 'package:flutter/material.dart';

/// Starts scrolling [child] vertically and horizontally when the widget sizes
/// reaches below [minWidth] or [minHeight]
class MinSize extends StatefulWidget {
  const MinSize({
    Key? key,
    this.minWidth,
    this.minHeight,
    required this.child,
  }) : super(key: key);

  final Widget child;

  final double? minWidth;

  final double? minHeight;

  @override
  createState() => _MinSizeState();
}

class _MinSizeState extends State<MinSize> {
  late final _verticalController = ScrollController();
  late final _horizontalController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final shouldScrollVertical = widget.minHeight != null && constraints.maxHeight <= widget.minHeight!;
        final contentHeight = shouldScrollVertical ? widget.minHeight : constraints.maxHeight;
        final verticalPhysics = shouldScrollVertical ? const AlwaysScrollableScrollPhysics() : const NeverScrollableScrollPhysics();

        final shouldScrollHorizontal = widget.minWidth != null && constraints.maxWidth <= widget.minWidth!;
        final contentWidth = shouldScrollHorizontal ? widget.minWidth : constraints.maxWidth;
        final horizontalPhysics = shouldScrollHorizontal ? const AlwaysScrollableScrollPhysics() : const NeverScrollableScrollPhysics();

        return Scrollbar(
          controller: _verticalController,
          thumbVisibility: shouldScrollVertical,
          child: SingleChildScrollView(
            controller: _verticalController,
            scrollDirection: Axis.vertical,
            physics: verticalPhysics,
            child: Scrollbar(
              interactive: true,
              controller: _horizontalController,
              thumbVisibility: shouldScrollHorizontal,
              child: SingleChildScrollView(
                controller: _horizontalController,
                scrollDirection: Axis.horizontal,
                physics: horizontalPhysics,
                child: UnconstrainedBox(
                  child: SizedBox(
                    height: contentHeight,
                    width: contentWidth,
                    child: widget.child,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
