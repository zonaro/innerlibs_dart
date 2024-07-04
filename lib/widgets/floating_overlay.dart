import 'package:flutter/material.dart';

class FloatingOverlayWidget extends StatefulWidget {
  final Widget? background;
  final List<DraggableChildren> children;

  const FloatingOverlayWidget({Key? key, required this.children, this.background}) : super(key: key);

  @override
  createState() => _FloatingOverlayWidgetState();
}

class _FloatingOverlayWidgetState extends State<FloatingOverlayWidget> {
  List<DraggableChildren> children = [];

  @override
  void initState() {
    super.initState();
    children.addAll(widget.children);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo,
      width: 400,
      height: 400,
      child: Stack(
        children: [
          if (widget.background != null) widget.background!,
          for (var w in widget.children)
            Positioned(
              left: w.x,
              top: w.y,
              child: Draggable(
                feedback: Opacity(
                  opacity: .5,
                  child: w.child,
                ),
                childWhenDragging: Container(),
                onDragEnd: (details) {
                  setState(() {
                    // Set the new position of the dragged widget
                    final newPosition = details.offset;
                    // Update the position of the widget in the children list
                    var t = children[widget.children.indexOf(w)];
                    t.x = newPosition.dx;
                    t.y = newPosition.dy;
                  });
                },
                child: w.child,
              ),
            ),
        ],
      ),
    );
  }
}

class DraggableChildren {
  final Widget child;
  double x;
  double y;

  DraggableChildren({required this.child, required this.x, required this.y});
}
