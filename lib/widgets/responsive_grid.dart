import 'package:flutter/widgets.dart';
import 'package:innerlibs/innerlibs.dart';

/// represent a Screen size tier (from extra small to double extra large)
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
  });
}

class ResponsiveList extends StatelessWidget {
  final double? desiredItemWidth, minSpacing;
  final List<Widget>? children;
  final bool squareCells, scroll;
  final MainAxisAlignment rowMainAxisAlignment;

  const ResponsiveList({super.key, this.desiredItemWidth, this.minSpacing, this.squareCells = false, this.scroll = true, this.children, this.rowMainAxisAlignment = MainAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (children!.isEmpty) return const SizedBox.shrink();

        double width = constraints.maxWidth;

        double N = (width - minSpacing!) / (desiredItemWidth! + minSpacing!);

        int n;
        double? spacing, itemWidth;

        if (N % 1 == 0) {
          n = N.floor();
          spacing = minSpacing;
          itemWidth = desiredItemWidth;
        } else {
          n = N.floor();

          double dw = width - (n * (desiredItemWidth! + minSpacing!) + minSpacing!);

          itemWidth = desiredItemWidth! + (dw / n) * (desiredItemWidth! / (desiredItemWidth! + minSpacing!));

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
  final double? itemHeight;
  final double? itemMaxHeight;
  final double? itemMinHeight;
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
    this.itemHeight,
    this.itemMaxHeight,
    this.itemMinHeight,
    this.direction = Axis.horizontal,
    this.verticalDirection = VerticalDirection.down,
    this.textDirection = TextDirection.ltr,
    this.alignment = WrapAlignment.start,
    this.runAlignment = WrapAlignment.start,
  });

  /// Create a [ResponsiveRow] with a specific number of columns in each [ScreenTier]
  /// and wraps [children] into [ResponsiveColumn]s automatically
  factory ResponsiveRow.withColumns({
    int? xxs = 1,
    int? xs = 2,
    int? sm = 3,
    int? md = 3,
    int? lg = 4,
    int? xl = 6,
    int? xxl = 12,
    double? height,
    List<dynamic> children = const [],
  }) {
    for (var i = 0; i < children.length; i++) {
      if (children[i] is ResponsiveColumn) {
        continue;
      }

      if (children[i] is string) {
        children[i] = Text(children[i]);
      }

      if (children[i] is num) {
        children[i] = Text("${children[i]}");
      }

      if (children[i] is Widget) {
        children[i] = ResponsiveColumn(
          height: height,
          xxs: (12 / (xxs ?? xs ?? sm ?? md ?? lg ?? xl ?? xxl ?? 1)).round(),
          xs: (12 / (xs ?? xxs ?? sm ?? md ?? lg ?? xl ?? xxl ?? 1)).round(),
          sm: (12 / (sm ?? xs ?? xxs ?? md ?? lg ?? xl ?? xxl ?? 1)).round(),
          md: (12 / (md ?? sm ?? xs ?? xxs ?? lg ?? xl ?? xxl ?? 1)).round(),
          lg: (12 / (lg ?? md ?? sm ?? xs ?? xxs ?? xl ?? xxl ?? 1)).round(),
          xl: (12 / (xl ?? lg ?? md ?? sm ?? xs ?? xxs ?? xxl ?? 1)).round(),
          xxl: (12 / (xxl ?? xl ?? lg ?? md ?? sm ?? xs ?? xxs ?? 1)).round(),
          child: children[i],
        );
      }
    }

    return ResponsiveRow(
      children: [for (var child in children.whereType<ResponsiveColumn>()) child],
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final segmentSize = constraints.maxWidth / totalSegments.toDouble();
        return Wrap(
          spacing: horizontalSpacing,
          runSpacing: runSpacing,
          crossAxisAlignment: crossAxisAlignment,
          direction: direction,
          verticalDirection: verticalDirection,
          textDirection: textDirection,
          alignment: alignment,
          runAlignment: runAlignment,
          children: children.map((c) {
            final segments = context.responsiveValue(xxs: c.xxs, xs: c.xs, sm: c.sm, md: c.md, lg: c.lg, xl: c.xl, xxl: c.xxl) ?? 12;

            final width = (segmentSize * segments.toDouble()) - ((children.length - 2).toDouble() * horizontalSpacing);

            return Container(
              constraints: itemMaxHeight == null && itemMinHeight == null ? null : BoxConstraints(maxHeight: itemMaxHeight ?? double.infinity, minHeight: itemMinHeight ?? 0),
              width: width,
              height: c.height ?? itemHeight,
              child: c.child,
            );
          }).toList(),
        );
      },
    );
  }
}
