import 'package:flutter/widgets.dart';
import 'package:innerlibs/innerlibs.dart';

/// Represent a Screen size tier (from extra small to double extra large)
/// The tier is computed by comparing the current screen width to a set of pre-defined screen sizes using hte function [responsiveValueBy]
enum ScreenTier {
  /// Double-Extra small screen
  xxs,

  /// Extra small screen
  xs,

  /// Small screen
  sm,

  /// Medium screen
  md,

  /// Large screen
  lg,

  /// Extra Large screen
  xl,

  /// Double Extra Large screen
  xxl,
}

extension ScreenTierExtensions on ScreenTier {
  operator <(ScreenTier tier) => toInt < tier.toInt;
  operator <=(ScreenTier tier) => toInt <= tier.toInt;
  operator >(ScreenTier tier) => toInt > tier.toInt;
  operator >=(ScreenTier tier) => toInt >= tier.toInt;

  int get toInt => ScreenTier.values.indexOf(this);
}

class ResponsiveColumn {
  final int xxs;
  final int? xs;
  final int? sm;
  final int? md;
  final int? lg;
  final int? xl;
  final int? xxl;
  final Widget child;
  final double? height;
  final Decoration? decoration;
  final Decoration? foregroundDecoration;

  final Alignment? alignment;

  final EdgeInsets? padding;

  final EdgeInsets? margin;

  /// Responsive Column thats have breakpoints for each [ScreenTier]. If a tier is not specified, its fall down to the next smaller screen tier
  const ResponsiveColumn({
    this.xxs = 12,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
    this.height,
    this.child = const SizedBox.shrink(),
    this.decoration,
    this.foregroundDecoration,
    this.alignment,
    this.padding,
    this.margin,
  });

  /// Responsive Column thats have breakpoints for each [ScreenTier]. Each tier has a default value
  const ResponsiveColumn.auto({
    this.xxs = 12,
    this.xs = 6,
    this.sm = 4,
    this.md = 3,
    this.lg = 3,
    this.xl = 2,
    this.xxl = 1,
    this.height,
    this.child = const SizedBox.shrink(),
    this.decoration,
    this.foregroundDecoration,
    this.alignment,
    this.padding,
    this.margin,
  });

  /// Responsive Column thats have breakpoints for each [ScreenTier]. Each tier has a default value
  factory ResponsiveColumn.all({
    required int value,
    double? height,
    Widget child = const SizedBox.shrink(),
    Decoration? decoration,
    Decoration? foregroundDecoration,
    Alignment? alignment,
    EdgeInsets? padding,
    EdgeInsets? margin,
  }) =>
      ResponsiveColumn(
        xxs: value,
        xs: value,
        sm: value,
        md: value,
        lg: value,
        xl: value,
        xxl: value,
        height: height,
        child: child,
        decoration: decoration,
        foregroundDecoration: foregroundDecoration,
        alignment: alignment,
        padding: padding,
        margin: margin,
      );
}

class ResponsiveList extends StatelessWidget {
  final double? desiredItemWidth;
  final double minSpacing;
  final List<Widget>? children;
  final bool squareCells, scroll;
  final MainAxisAlignment rowMainAxisAlignment;

  const ResponsiveList({super.key, this.desiredItemWidth, this.minSpacing = 0, this.squareCells = false, this.scroll = true, this.children, this.rowMainAxisAlignment = MainAxisAlignment.start});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          if (children?.isEmpty ?? true) return const SizedBox.shrink();

          double width = constraints.maxWidth;
          var diw = desiredItemWidth ?? width;

          double N = (width - minSpacing) / (diw + minSpacing);

          int n;
          double? spacing, itemWidth;

          if (N % 1 == 0) {
            n = N.floor();
            spacing = minSpacing;
            itemWidth = diw;
          } else {
            n = N.floor();

            double dw = width - (n * (diw + minSpacing) + minSpacing);

            itemWidth = diw + (dw / n) * (diw / (diw + minSpacing));

            spacing = (width - itemWidth * n) / (n + 1);
          }

          if (scroll) {
            return ListView.builder(
                itemCount: (children!.length / n).ceil() * 2 - 1,
                itemBuilder: (context, index) {
                  //if (index * n >= children.length) return null;
                  //separator
                  if (index % 2 == 1) {
                    return SizedBox(
                      height: minSpacing,
                    );
                  }
                  //item
                  var rowChildren = List<Widget>.empty(growable: true);
                  index = index ~/ 2;
                  for (int i = index * n; i < (index + 1) * n; i++) {
                    if (i >= children!.length) break;
                    rowChildren.add(children![i]);
                  }
                  return _ResponsiveListItem(
                    mainAxisAlignment: rowMainAxisAlignment,
                    itemWidth: itemWidth,
                    spacing: spacing,
                    squareCells: squareCells,
                    children: rowChildren,
                  );
                });
          } else {
            var rows = List<Widget>.empty(growable: true);
            rows.add(SizedBox(
              height: minSpacing,
            ));
            //
            for (int j = 0; j < (children!.length / n).ceil(); j++) {
              var rowChildren = List<Widget>.empty(growable: true);
              //
              for (int i = j * n; i < (j + 1) * n; i++) {
                if (i >= children!.length) break;
                rowChildren.add(children![i]);
              }
              //
              rows.add(_ResponsiveListItem(
                mainAxisAlignment: rowMainAxisAlignment,
                itemWidth: itemWidth,
                spacing: spacing,
                squareCells: squareCells,
                children: rowChildren,
              ));

              rows.add(SizedBox(
                height: minSpacing,
              ));
            }

            return Column(
              children: rows,
            );
          }
        },
      );
}

class _ResponsiveListItem extends StatelessWidget {
  final double? spacing, itemWidth, itemHeight;
  final List<Widget>? children;
  final bool? squareCells;
  final MainAxisAlignment mainAxisAlignment;

  const _ResponsiveListItem({this.itemWidth, this.spacing, this.squareCells, double? itemHeight, this.children, this.mainAxisAlignment = MainAxisAlignment.start}) : itemHeight = itemHeight ?? itemWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: mainAxisAlignment,
      children: _buildChildren(),
    );
  }

  List<Widget> _buildChildren() {
    var list = List<Widget>.empty(growable: true);

    list.add(SizedBox(
      width: spacing,
    ));

    for (var child in children!) {
      list.add(SizedBox(
        width: itemWidth,
        height: squareCells! ? itemWidth : itemHeight,
        child: child,
      ));
      list.add(SizedBox(
        width: spacing,
      ));
    }

    return list;
  }
}

class ResponsiveRow extends StatelessWidget {
  final List<ResponsiveColumn> children;
  final WrapCrossAlignment crossAxisAlignment;
  final int totalSegments;
  final double horizontalSpacing;
  final double runSpacing;
  final double? columnHeight;
  final double? columnMaxHeight;
  final double? columnMinHeight;
  final Axis direction;
  final VerticalDirection verticalDirection;
  final TextDirection textDirection;
  final WrapAlignment alignment;
  final WrapAlignment runAlignment;

  const ResponsiveRow({
    super.key,
    required this.children,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.totalSegments = 12,
    this.horizontalSpacing = 0,
    this.runSpacing = 0,
    this.columnHeight,
    this.columnMaxHeight,
    this.columnMinHeight,
    this.direction = Axis.horizontal,
    this.verticalDirection = VerticalDirection.down,
    this.textDirection = TextDirection.ltr,
    this.alignment = WrapAlignment.start,
    this.runAlignment = WrapAlignment.start,
  });

  /// Create a [ResponsiveRow] with a specific number of columns in each [ScreenTier]
  /// and wraps [children] into [ResponsiveColumn]s automatically
  factory ResponsiveRow.withAutoColumns({
    int? xxs = 1,
    int? xs = 2,
    int? sm = 3,
    int? md = 3,
    int? lg = 4,
    int? xl = 6,
    int? xxl = 12,
    List<dynamic> children = const [],
    WrapCrossAlignment crossAxisAlignment = WrapCrossAlignment.start,
    int totalSegments = 12,
    double horizontalSpacing = 0,
    double runSpacing = 0,
    double? columnHeight,
    double? columnMaxHeight,
    double? columnMinHeight,
    Axis direction = Axis.horizontal,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextDirection textDirection = TextDirection.ltr,
    WrapAlignment alignment = WrapAlignment.start,
    WrapAlignment runAlignment = WrapAlignment.start,
  }) =>
      ResponsiveRow.withColumns(
        xxs: xxs,
        xs: xs,
        sm: sm,
        md: md,
        lg: lg,
        xl: xl,
        xxl: xxl,
        children: children,
        crossAxisAlignment: crossAxisAlignment,
        totalSegments: totalSegments,
        horizontalSpacing: horizontalSpacing,
        runSpacing: runSpacing,
        columnHeight: columnHeight,
        columnMaxHeight: columnMaxHeight,
        columnMinHeight: columnMinHeight,
        direction: direction,
        verticalDirection: verticalDirection,
        textDirection: textDirection,
        alignment: alignment,
        runAlignment: runAlignment,
      );

  /// Creates a [ResponsiveRow] with a specific number of columns in each [ScreenTier]
  /// and automatically wraps [children] into [ResponsiveColumn] widgets. If a child
  /// is already a [ResponsiveColumn], it remains unchanged. If a child is not a [Widget],
  /// this function converts it to a [Text] widget and then wraps it in a [ResponsiveColumn].
  ///
  /// Example usage:
  /// ```dart
  /// ResponsiveRow.withColumns(
  ///   xxs: 1,
  ///   xs: 2,
  ///   sm: 3,
  ///   md: 4,
  ///   lg: 4,
  ///   xl: 3,
  ///   xxl: 2,
  ///   children: [
  ///     Text('Column 1'),
  ///     Text('Column 2'),
  ///     Text('Column 3'),
  ///   ],
  /// )
  /// ```
  ///
  /// The above example creates a responsive row with 1 column on extra-small screens (xxs),
  /// 2 columns on small screens (xs), 3 columns on medium screens (sm), 4 columns on large
  /// screens (md), 4 columns on extra-large screens (lg), 3 columns on extra-extra-large
  /// screens (xl), and 2 columns on extra-extra-extra-large screens (xxl).
  factory ResponsiveRow.withColumns({
    int? xxs = 1,
    int? xs,
    int? sm,
    int? md,
    int? lg,
    int? xl,
    int? xxl,
    List<dynamic> children = const [],
    WrapCrossAlignment crossAxisAlignment = WrapCrossAlignment.start,
    int totalSegments = 12,
    double horizontalSpacing = 0,
    double runSpacing = 0,
    double? columnHeight,
    double? columnMaxHeight,
    double? columnMinHeight,
    Axis direction = Axis.horizontal,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextDirection textDirection = TextDirection.ltr,
    WrapAlignment alignment = WrapAlignment.start,
    WrapAlignment runAlignment = WrapAlignment.start,
  }) {
    List<ResponsiveColumn> newChildren = [];
    for (var i = 0; i < children.length; i++) {
      if (children[i] is ResponsiveColumn) {
        newChildren.add(children[i]);
        continue;
      }

      if ((children[i] is Widget) == false) {
        children[i] = forceWidget(children[i]);
      }

      if (children[i] is Widget) {
        newChildren.add(
          ResponsiveColumn(
            height: columnHeight,
            xxs: (totalSegments / (xxs ?? xs ?? sm ?? md ?? lg ?? xl ?? xxl ?? 1)).round(),
            xs: (totalSegments / (xs ?? xxs ?? sm ?? md ?? lg ?? xl ?? xxl ?? 1)).round(),
            sm: (totalSegments / (sm ?? xs ?? xxs ?? md ?? lg ?? xl ?? xxl ?? 1)).round(),
            md: (totalSegments / (md ?? sm ?? xs ?? xxs ?? lg ?? xl ?? xxl ?? 1)).round(),
            lg: (totalSegments / (lg ?? md ?? sm ?? xs ?? xxs ?? xl ?? xxl ?? 1)).round(),
            xl: (totalSegments / (xl ?? lg ?? md ?? sm ?? xs ?? xxs ?? xxl ?? 1)).round(),
            xxl: (totalSegments / (xxl ?? xl ?? lg ?? md ?? sm ?? xs ?? xxs ?? 1)).round(),
            child: children[i],
          ),
        );
      }
    }

    return ResponsiveRow(
      children: newChildren,
      crossAxisAlignment: crossAxisAlignment,
      totalSegments: totalSegments,
      horizontalSpacing: horizontalSpacing,
      runSpacing: runSpacing,
      columnHeight: columnHeight,
      columnMaxHeight: columnMaxHeight,
      columnMinHeight: columnMinHeight,
      direction: direction,
      verticalDirection: verticalDirection,
      textDirection: textDirection,
      alignment: alignment,
      runAlignment: runAlignment,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final segmentSize = constraints.maxWidth / totalSegments.toDouble();
        return SingleChildScrollView(
          child: Wrap(
            spacing: horizontalSpacing,
            runSpacing: runSpacing,
            crossAxisAlignment: crossAxisAlignment,
            direction: direction,
            verticalDirection: verticalDirection,
            textDirection: textDirection,
            alignment: alignment,
            runAlignment: runAlignment,
            children: children.map((c) {
              final segments = context.valueByTier(xxs: c.xxs, xs: c.xs, sm: c.sm, md: c.md, lg: c.lg, xl: c.xl, xxl: c.xxl);

              final width = (segmentSize * segments.toDouble()) - ((children.length - 2).toDouble() * horizontalSpacing);

              return Container(
                decoration: c.decoration,
                foregroundDecoration: c.foregroundDecoration,
                alignment: c.alignment,
                padding: c.padding,
                margin: c.margin,
                constraints: columnMaxHeight == null && columnMinHeight == null ? null : BoxConstraints(maxHeight: columnMaxHeight ?? double.infinity, minHeight: columnMinHeight ?? 0),
                width: width,
                height: c.height ?? columnHeight,
                child: c.child,
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
