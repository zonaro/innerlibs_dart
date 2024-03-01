import 'package:flutter/widgets.dart';
import 'package:innerlibs/innerlibs.dart';

enum ScreenTier { xs, sm, md, lg, xl, xxl }

class ResponsiveColumn {
  final int xs;
  final int? sm;
  final int? md;
  final int? lg;
  final int? xl;
  final int? xxl;
  final Widget child;
  final double? height;

  const ResponsiveColumn({
    this.xs = 12,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
    this.height,
    required this.child,
  });

  int _getSegments(ScreenTier tier) {
    switch (tier) {
      case ScreenTier.xs:
        return xs;
      case ScreenTier.sm:
        return sm ?? xs;
      case ScreenTier.md:
        return md ?? sm ?? xs;
      case ScreenTier.lg:
        return lg ?? md ?? sm ?? xs;
      case ScreenTier.xl:
        return xl ?? lg ?? md ?? sm ?? xs;
      case ScreenTier.xxl:
        return xxl ?? xl ?? lg ?? md ?? sm ?? xs;
    }
  }
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
        if (children!.isEmpty) return Container();

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

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final segmentSize = constraints.maxWidth / totalSegments.toDouble();
        final ScreenTier tier = context.screenTier;
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
            final segments = c._getSegments(tier);

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
