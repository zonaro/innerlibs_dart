import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

class IconCard extends StatelessWidget {
  final String title;

  final IconData icon;
  final Color? accentColor;
  final String? description;
  final double? elevation;
  final double textScaleFactor;

  /// Called when the user taps this part of the material.
  final GestureTapCallback? onTap;

  /// Called when the user taps down this part of the material.
  final GestureTapDownCallback? onTapDown;

  /// Called when the user releases a tap that was started on this part of the
  /// material. [onTap] is called immediately after.
  final GestureTapUpCallback? onTapUp;

  /// Called when the user cancels a tap that was started on this part of the
  /// material.
  final GestureTapCallback? onTapCancel;

  /// Called when the user double taps this part of the material.
  final GestureTapCallback? onDoubleTap;

  /// Called when the user long-presses on this part of the material.
  final GestureLongPressCallback? onLongPress;

  /// Called when the user taps this part of the material with a secondary button.
  final GestureTapCallback? onSecondaryTap;

  /// Called when the user taps down on this part of the material with a
  /// secondary button.
  final GestureTapDownCallback? onSecondaryTapDown;

  /// Called when the user releases a secondary button tap that was started on
  /// this part of the material. [onSecondaryTap] is called immediately after.
  final GestureTapUpCallback? onSecondaryTapUp;

  /// Called when the user cancels a secondary button tap that was started on
  /// this part of the material.
  final GestureTapCallback? onSecondaryTapCancel;

  /// Called when this part of the material either becomes highlighted or stops
  /// being highlighted.
  ///
  /// The value passed to the callback is true if this part of the material has
  /// become highlighted and false if this part of the material has stopped
  /// being highlighted.
  ///
  /// If all of [onTap], [onDoubleTap], and [onLongPress] become null while a
  /// gesture is ongoing, then [onTapCancel] will be fired and
  /// [onHighlightChanged] will be fired with the value false _during the
  /// build_. This means, for instance, that in that scenario [State.setState]
  /// cannot be called.
  final ValueChanged<bool>? onHighlightChanged;

  /// Called when a pointer enters or exits the ink response area.
  ///
  /// The value passed to the callback is true if a pointer has entered this
  /// part of the material and false if a pointer has exited this part of the
  /// material.
  final ValueChanged<bool>? onHover;

  /// The cursor for a mouse pointer when it enters or is hovering over the
  /// widget.
  ///
  /// If [mouseCursor] is a [MaterialStateProperty<MouseCursor>],
  /// [WidgetStateProperty.resolve] is used for the following [WidgetState]s:
  ///
  ///  * [WidgetState.hovered].
  ///  * [WidgetState.focused].
  ///  * [WidgetState.disabled].
  ///
  /// If this property is null, [WidgetStateMouseCursor.clickable] will be used.
  final MouseCursor? mouseCursor;

  /// Whether detected gestures should provide acoustic and/or haptic feedback.
  ///
  /// For example, on Android a tap will produce a clicking sound and a
  /// long-press will produce a short vibration, when feedback is enabled.
  ///
  /// See also:
  ///
  ///  * [Feedback] for providing platform-specific feedback to certain actions.
  final bool enableFeedback;

  /// {@template flutter.material.inkwell.onFocusChange}
  /// Handler called when the focus changes.
  ///
  /// Called with true if this widget's node gains focus, and false if it loses
  /// focus.
  /// {@endtemplate}
  final ValueChanged<bool>? onFocusChange;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.canRequestFocus}
  final bool canRequestFocus;

  /// {@template flutter.material.inkwell.statesController}
  /// Represents the interactive "state" of this widget in terms of
  /// a set of [WidgetState]s, like [WidgetState.pressed] and
  /// [WidgetState.focused].
  ///
  /// Classes based on this one can provide their own
  /// [WidgetStatesController] to which they've added listeners.
  /// They can also update the controller's [WidgetStatesController.value]
  /// however, this may only be done when it's safe to call
  /// [State.setState], like in an event handler.
  /// {@endtemplate}
  final WidgetStatesController? statesController;

  /// The duration of the animation that animates the hover effect.
  ///
  /// The default is 50ms.
  final Duration? hoverDuration;

  final double height;

  final string? tooltip;

  final double radius;

  const IconCard({
    super.key,
    required this.title,
    required this.icon,
    this.height = 100,
    this.textScaleFactor = 1,
    this.accentColor,
    this.description,
    this.onTap,
    this.elevation,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onDoubleTap,
    this.onLongPress,
    this.onSecondaryTap,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onHighlightChanged,
    this.onHover,
    this.mouseCursor,
    this.enableFeedback = true,
    this.onFocusChange,
    this.autofocus = false,
    this.focusNode,
    this.canRequestFocus = true,
    this.statesController,
    this.hoverDuration,
    this.tooltip,
    this.radius = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip.blankCoalesce([description, title]),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius),
            bottomLeft: Radius.circular(radius),
          ),
        ),
        elevation: elevation,
        child: ClipPath(
          clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(radius),
                bottomRight: Radius.circular(radius),
              ),
            ),
          ),
          child: LayoutBuilder(builder: (context, cs) {
            return InkWell(
              borderRadius: BorderRadius.circular(radius),
              splashColor: accentColor?.withValues(alpha: .7),
              autofocus: autofocus,
              canRequestFocus: canRequestFocus,
              focusColor: accentColor?.withValues(alpha: .3),
              enableFeedback: enableFeedback,
              hoverColor: accentColor?.withValues(alpha: .3),
              mouseCursor: mouseCursor,
              focusNode: focusNode,
              hoverDuration: hoverDuration,
              highlightColor: accentColor,
              onTap: onTap,
              onDoubleTap: onDoubleTap,
              onLongPress: onLongPress,
              onSecondaryTap: onSecondaryTap,
              onFocusChange: onFocusChange,
              onHighlightChanged: onHighlightChanged,
              onHover: onHover,
              onSecondaryTapCancel: onSecondaryTapCancel,
              onSecondaryTapDown: onSecondaryTapDown,
              onSecondaryTapUp: onSecondaryTapUp,
              onTapCancel: onTapCancel,
              onTapDown: onTapDown,
              onTapUp: onTapUp,
              statesController: statesController,
              child: Container(
                height: height,
                decoration: accentColor != null
                    ? BoxDecoration(
                        color: accentColor?.withValues(alpha: .1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(radius),
                          bottomLeft: Radius.circular(radius),
                        ),
                        border: Border(
                          right: BorderSide(color: accentColor!, width: 8),
                        ),
                      )
                    : null,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Icon(
                        icon,
                        size: 50,
                        color: accentColor?.withValues(alpha: 1),
                      ).setOpacity(opacity: .4).positionTop(top: 0),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: SizedBox(
                          width: cs.maxWidth * .6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                title,
                                maxLines: 2,
                                textAlign: TextAlign.right,
                                style: context.headlineSmall,
                                overflow: TextOverflow.fade,
                                textScaler: TextScaler.linear(textScaleFactor),
                              ).bold(),
                              if (description.isNotBlank)
                                Text(
                                  description!,
                                  maxLines: 2,
                                  textAlign: TextAlign.right,
                                  style: context.titleMedium,
                                  overflow: TextOverflow.ellipsis,
                                  textScaler: TextScaler.linear(textScaleFactor),
                                ).italic(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
