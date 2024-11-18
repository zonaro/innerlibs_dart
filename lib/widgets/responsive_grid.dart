import 'package:flutter/widgets.dart';
import 'package:innerlibs/innerlibs.dart';

class ResponsiveColumn {
  final double? xxs;
  final double? xs;
  final double? sm;
  final double? md;
  final double? lg;
  final double? xl;
  final double? xxl;
  final Widget child;
  final double? height;
  final Decoration? decoration;
  final Decoration? foregroundDecoration;
  
  /// The alignment of the column.
  final Alignment? alignment;
  
  /// The padding inside the column.
  final EdgeInsets? padding;
  
  /// The margin outside the column.
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
    this.child = nil,
    this.decoration,
    this.foregroundDecoration,
    this.alignment,
    this.padding,
    this.margin,
  });

  /// Responsive Column thats have breakpoints for each [ScreenTier]. Each tier has a default value
  factory ResponsiveColumn.all({
    required double value,
    double? height,
    Widget child = nil,
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
    this.child = nil,
    this.decoration,
    this.foregroundDecoration,
    this.alignment,
    this.padding,
    this.margin,
  });

  /// Creates a copy of the given [ResponsiveColumn] with an optional new child.
  factory ResponsiveColumn.copy(ResponsiveColumn columnSizes, {Widget? child}) {
    return ResponsiveColumn(
      xxs: columnSizes.xxs,
      xs: columnSizes.xs,
      sm: columnSizes.sm,
      md: columnSizes.md,
      lg: columnSizes.lg,
      xl: columnSizes.xl,
      xxl: columnSizes.xxl,
      height: columnSizes.height,
      child: child ?? columnSizes.child,
      decoration: columnSizes.decoration,
      foregroundDecoration: columnSizes.foregroundDecoration,
      alignment: columnSizes.alignment,
      padding: columnSizes.padding,
      margin: columnSizes.margin,
    );
  }

  /// Creates a [ResponsiveColumn] with full width for each screen tier.
  factory ResponsiveColumn.full({
    double? height,
    Widget child = nil,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    Alignment? alignment,
    EdgeInsets? padding,
    EdgeInsets? margin,
  }) =>
      ResponsiveColumn.all(
        value: 12,
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

  /// Creates a [ResponsiveList] with the given parameters.
  const ResponsiveList({super.key, this.desiredItemWidth, this.minSpacing = 0, this.squareCells = false, this.scroll = true, this.children, this.rowMainAxisAlignment = MainAxisAlignment.start});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          if (children?.isEmpty ?? true) nil;

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

class ResponsiveRow extends StatelessWidget {
  final List<ResponsiveColumn> children;
  final WrapCrossAlignment crossAxisAlignment;
  final double totalSegments;
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

  /// Creates a [ResponsiveRow] with the given parameters.
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
    double? xxs = 1,
    double? xs = 2,
    double? sm = 3,
    double? md = 3,
    double? lg = 4,
    double? xl = 6,
    double? xxl = 12,
    dynamic children = const [],
    WrapCrossAlignment crossAxisAlignment = WrapCrossAlignment.start,
    double totalSegments = 12,
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
    double? xxs = 1,
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
    dynamic children = const [],
    WrapCrossAlignment crossAxisAlignment = WrapCrossAlignment.start,
    double totalSegments = 12,
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

    children = forceList(children);

    for (var i = 0; i < children.length; i++) {
      if (children[i] is ResponsiveColumn) {
        newChildren.add(children[i]);
        continue;
      }

      if (children[i] is Nil) {
        continue;
      }

      if ((children[i] is Widget) == false) {
        children[i] = forceWidget(children[i]);
      }

      if (children[i] is Widget) {
        newChildren.add(
          ResponsiveColumn(
            height: columnHeight,
            xxs: getColumnSizeBySegments(totalSegments, [xxs, xs, sm, md, lg, xl, xxl]),
            xs: getColumnSizeBySegments(totalSegments, [xs, xxs, sm, md, lg, xl, xxl]),
            sm: getColumnSizeBySegments(totalSegments, [sm, xs, xxs, md, lg, xl, xxl]),
            md: getColumnSizeBySegments(totalSegments, [md, sm, xs, xxs, lg, xl, xxl]),
            lg: getColumnSizeBySegments(totalSegments, [lg, md, sm, xs, xxs, xl, xxl]),
            xl: getColumnSizeBySegments(totalSegments, [xl, lg, md, sm, xs, xxs, xxl]),
            xxl: getColumnSizeBySegments(totalSegments, [xxl, xl, lg, md, sm, xs, xxs]),
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
            children: children
                .map((c) {
                  final segments = context.valueByTier(xxs: c.xxs, xs: c.xs, sm: c.sm, md: c.md, lg: c.lg, xl: c.xl, xxl: c.xxl);
                  if (segments <= 0) return null;

                  final width = (segmentSize * segments) - ((children.length - 2).toDouble() * horizontalSpacing);

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
                })
                .whereNotNull()
                .toList(),
          ),
        );
      },
    );
  }


  /// Calculates the column size based on the total segments and the provided sizes.
  static double getColumnSizeBySegments(double totalSegments, List<double?> sizes) {
    double size = (sizes.whereNotNull().firstOrNull ?? 1);
    if (size > 0) {
      size = (totalSegments / size);
    }
    return size;
  }
}

/// Represents a Screen size tier (from double extra small to double extra large).
/// The tier is computed by comparing the current screen width to a set of pre-defined screen sizes using the function [responsiveValueBy].
enum ScreenTier {
  /// Double-Extra small screen.
  xxs(0),

  /// Extra small screen.
  xs(1),

  /// Small screen.
  sm(2),

  /// Medium screen.
  md(3),

  /// Large screen.
  lg(4),

  /// Extra Large screen.
  xl(5),

  /// Double Extra Large screen.
  xxl(6);

  static ScreenTierMap<double> _bp = {};

  /// The breakpoints for different screen sizes defined by user.
  /// if empty, the [defaultBreakpoints] will be used.
  static ScreenTierMap<double> get breakpoints {
    if (_bp.isEmpty) {
      _bp = defaultBreakpoints;
    }
    return _bp;
  }

  static set breakpoints(ScreenTierMap<double> value) {
    _bp = value;
  }

  /// The default breakpoints for different screen sizes.
  /// The default breakpoints are as follows:
  /// - xxs: 360
  /// - xs: 576
  /// - sm: 768
  /// - md: 992
  /// - lg: 1200
  /// - xl: 1600
  /// - xxl: double.infinity
  static ScreenTierMap<double> get defaultBreakpoints => <double, ScreenTier>{
        360: ScreenTier.xxs,
        576: ScreenTier.xs,
        768: ScreenTier.sm,
        992: ScreenTier.md,
        1200: ScreenTier.lg,
        1600: ScreenTier.xl,
        double.infinity: ScreenTier.xxl,
      };
  final int value;
  const ScreenTier(this.value);

  /// Creates a [ScreenTier] object based on the given [width] and [customBreakPoints].
  ///
  /// The [width] parameter represents the width of the screen.
  /// The [customBreakPoints] parameter is an optional map of custom breakpoints.
  /// If no custom breakpoints are provided, the [breakpoints] will be used.
  ///
  /// Returns a [ScreenTier] object based on the given [width] and [customBreakPoints].
  factory ScreenTier.fromWidth(double width, [ScreenTierMap<double> customBreakPoints = const {}]) {
    if (customBreakPoints.isEmpty) customBreakPoints = breakpoints;
    return getBreakpointValue(width, customBreakPoints);
  }

  /// Gets the maximum width for the current screen tier.
  double get maxWidth => breakpoints.entries.firstWhere((e) => e.value == this).key;

  operator <(ScreenTier tier) => value < tier.value;

  operator <=(ScreenTier tier) => value <= tier.value;

  operator >(ScreenTier tier) => value > tier.value;

  operator >=(ScreenTier tier) => value >= tier.value;
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
