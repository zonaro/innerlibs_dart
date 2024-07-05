import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

/// A widget that displays a floating overlay with a list of children widgets.
///
/// The [FloatingOverlay] widget is used to display a list of children widgets in an overlay.
/// The children can be either a [DraggableChildren] or a regular [Widget].
/// If the child is not of type [DraggableChildren], it will be automatically converted to a [Widget] using the [Object.forceWidget()] method.
/// If the child is a [Widget], it will be wrapped into a [DraggableChildren] for consistency.
///
/// Example usage:
/// ```dart
/// FloatingOverlay(
///   children: [
///     DraggableChildren(
///       child: Container(
///         width: 100,
///         height: 100,
///         color: Colors.red,
///       ),
///     ),
///     Text('Hello, World!'),
///   ],
/// )
/// ```
class FloatingArea extends StatefulWidget {
  /// The background widget.
  final Widget? background;

  /// The foreground widget.
  final Widget? foreground;

  /// The list of children widgets.
  final List<dynamic> children;

  /// A callback function that is called when the draggable widget is released.
  final void Function(DraggableDetails, DraggableChildren)? onDragEnd;

  /// A callback function that is called when the draggable widget is being dragged.
  final void Function(DragUpdateDetails, DraggableChildren)? onDragUpdate;

  /// Creates a [FloatingArea] widget.
  ///
  /// The [children] parameter is a list of draggable children.
  /// The [background] parameter is an optional widget that appears behind the draggable children.
  /// The [onDragEnd] parameter is a callback function that is called when a draggable child is released.
  /// The [onDragUpdate] parameter is a callback function that is called when a draggable child is being dragged.
  /// The [foreground] parameter is an optional widget that appears in front of the draggable children.
  const FloatingArea({
    Key? key,
    required this.children,
    this.background,
    this.onDragEnd,
    this.onDragUpdate,
    this.foreground,
  }) : super(key: key);

  @override
  createState() => _FloatingAreaState();
}

class _FloatingAreaState extends State<FloatingArea> {
  final List<DraggableChildren> _children = [];

  @override
  void initState() {
    super.initState();
    for (var w in widget.children) {
      if (w == null) {
        continue;
      }
      if (w is DraggableChildren) {
        _children.add(w);
      } else {
        _children.add(DraggableChildren(x: 0, y: 0, child: (w as Object?).forceWidget()!));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) => Stack(
        children: [
          if (widget.background != null) widget.background!,
          for (var w in _children)
            Positioned(
              left: w.x,
              top: w.y,
              child: Draggable(
                feedback: Opacity(
                  opacity: .5,
                  child: w.child,
                ),
                childWhenDragging: Container(),
                onDragUpdate: (details) {
                  setState(() {
                    if (widget.onDragUpdate != null) widget.onDragUpdate!(details, w);
                  });
                },
                onDragEnd: (details) {
                  setState(() {
                    // Calculates local coordinates.
                    // Local coordinates are relative, not absolute.
                    var renderBox = context.findRenderObject() as RenderBox;
                    final offsetLocalRelative = renderBox.globalToLocal(details.offset);

                    double x = offsetLocalRelative.dx;
                    double y = offsetLocalRelative.dy;

                    if (offsetLocalRelative.dx > c.maxWidth) {
                      x = c.maxWidth - 100;
                    }
                    if (offsetLocalRelative.dy > c.maxHeight) {
                      y = c.maxHeight - 100;
                    }

                    // Update the position of the widget in the children list
                    var t = _children[_children.indexOf(w)];
                    t.x = x;
                    t.y = y;

                    // Call the onDragEnd callback
                    if (widget.onDragEnd != null) {
                      widget.onDragEnd!(DraggableDetails(velocity: details.velocity, offset: Offset(x, y)), w);
                    }
                  });
                },
                child: w.child,
              ),
            ),
          if (widget.foreground != null) widget.foreground!,
        ],
      ),
    );
  }
}

/// A draggable child widget for [FloatingArea].
class DraggableChildren {
  /// The child widget to be displayed in the [FloatingArea].
  Widget child;

  /// The x-coordinate of the child.
  double x;

  /// The y-coordinate of the child.
  double y;

  /// Additional data associated with this widget.
  JsonMap data;

  /// Creates a [DraggableChildren] widget.
  ///
  /// The [child] parameter is the widget that can be dragged.
  /// The [x] parameter is the initial x-coordinate of the draggable child.
  /// The [y] parameter is the initial y-coordinate of the draggable child.
  DraggableChildren({
    required this.child,
    required this.x,
    required this.y,
    this.data = const {},
  });
}
