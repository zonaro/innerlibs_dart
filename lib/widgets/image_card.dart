import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
    required this.image,
    this.title,
    this.textScaleFactor = 1,
    this.accentColor = Colors.black,
    this.textColor = Colors.white,
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
    this.mainAxisAlignment = MainAxisAlignment.end,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final String? title;
  final ImageProvider image;
  final Color accentColor;
  final Color textColor;
  final String? description;
  final double? elevation;
  final double textScaleFactor;

  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

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

  /// the tooltip message
  final string? tooltip;

  TextAlign get textAlign =>
      {
        CrossAxisAlignment.start: TextAlign.start,
        CrossAxisAlignment.center: TextAlign.center,
        CrossAxisAlignment.end: TextAlign.end,
        CrossAxisAlignment.stretch: TextAlign.justify,
      }[crossAxisAlignment] ??
      TextAlign.start;

  Alignment get begin =>
      {
        (MainAxisAlignment.start, CrossAxisAlignment.start): Alignment.topLeft,
        (MainAxisAlignment.start, CrossAxisAlignment.center): Alignment.topCenter,
        (MainAxisAlignment.start, CrossAxisAlignment.end): Alignment.topRight,
        (MainAxisAlignment.center, CrossAxisAlignment.start): Alignment.centerLeft,
        (MainAxisAlignment.center, CrossAxisAlignment.center): Alignment.center,
        (MainAxisAlignment.center, CrossAxisAlignment.end): Alignment.centerRight,
        (MainAxisAlignment.end, CrossAxisAlignment.start): Alignment.bottomLeft,
        (MainAxisAlignment.end, CrossAxisAlignment.center): Alignment.bottomCenter,
        (MainAxisAlignment.end, CrossAxisAlignment.end): Alignment.bottomRight,
      }[(mainAxisAlignment, crossAxisAlignment)] ??
      Alignment.bottomLeft;

  Alignment get end =>
      {
        (MainAxisAlignment.start, CrossAxisAlignment.start): Alignment.bottomRight,
        (MainAxisAlignment.start, CrossAxisAlignment.center): Alignment.bottomCenter,
        (MainAxisAlignment.start, CrossAxisAlignment.end): Alignment.bottomRight,
        (MainAxisAlignment.center, CrossAxisAlignment.start): Alignment.centerRight,
        (MainAxisAlignment.center, CrossAxisAlignment.center): Alignment.center,
        (MainAxisAlignment.center, CrossAxisAlignment.end): Alignment.centerLeft,
        (MainAxisAlignment.end, CrossAxisAlignment.start): Alignment.topRight,
        (MainAxisAlignment.end, CrossAxisAlignment.center): Alignment.topCenter,
        (MainAxisAlignment.end, CrossAxisAlignment.end): Alignment.topLeft,
      }[(mainAxisAlignment, crossAxisAlignment)] ??
      Alignment.topRight;

  @override
  Widget build(BuildContext context) => Tooltip(
        message: (tooltip ?? ""),
        child: InkWell(
          splashColor: accentColor,
          autofocus: autofocus,
          canRequestFocus: canRequestFocus,
          focusColor: accentColor.withOpacity(.7),
          enableFeedback: enableFeedback,
          hoverColor: accentColor.withOpacity(.7),
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
            decoration: BoxDecoration(
              image: DecorationImage(
                image: image,
                fit: title.isValid() || description.isValid() ? BoxFit.cover : BoxFit.contain,
              ),
            ),
            child: Container(
              padding: 15.allAround,
              decoration: BoxDecoration(
                gradient: title.isValid() || description.isValid()
                    ? LinearGradient(
                        colors: [accentColor, (accentColor).withOpacity(.3), Colors.transparent],
                        begin: begin,
                        end: end,
                      )
                    : null,
              ),
              child: Column(
                mainAxisAlignment: mainAxisAlignment,
                crossAxisAlignment: crossAxisAlignment,
                children: [
                  if (title.isValid())
                    Text(
                      title!,
                      style: context.headlineSmall,
                      textAlign: textAlign,
                    ).textColor(textColor),
                  if (description.isValid())
                    Text(
                      description!,
                      style: context.bodyLarge,
                      textAlign: textAlign,
                    ).textColor(Colors.white),
                ],
              ),
            ),
          ).wrapIf(
            elevation != null,
            (wrappedChild) => Card(
              elevation: elevation,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: wrappedChild,
            ),
          ),
        ),
      );
}
