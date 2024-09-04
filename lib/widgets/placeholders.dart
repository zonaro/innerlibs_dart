import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

class BannerPlaceholder extends StatelessWidget {
  const BannerPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.0,
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: const Color.fromARGB(100, 255, 255, 255),
      ),
    );
  }
}

class ContentPlaceholder extends StatelessWidget {
  final int lines;
  final Color color;

  const ContentPlaceholder({
    Key? key,
    this.lines = -1,
    this.color = const Color.fromARGB(128, 255, 255, 255),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 96.0,
                height: 72.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: color,
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var i = 1; i < (lines >= 1 ? lines : randomInt(1, 4)); i++)
                      Container(
                        width: double.infinity,
                        height: 10.0,
                        color: color,
                        margin: const EdgeInsets.only(bottom: 8.0),
                      ),
                    Container(
                      width: 100.0,
                      height: 10.0,
                      color: color,
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class EmptyScaffold extends StatelessWidget {
  final dynamic body;
  final dynamic title;

  const EmptyScaffold({
    super.key,
    this.body,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: forceWidget(title) ?? const TitleLoading()),
      body: forceWidget(body) ?? const ListLoading(),
    );
  }
}

class ListLoading extends StatelessWidget {
  const ListLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.primaryColor,
      highlightColor: context.surfaceColor,
      enabled: true,
      child: const SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            ContentPlaceholder(),
            ContentPlaceholder(),
            ContentPlaceholder(),
            ContentPlaceholder(),
          ],
        ),
      ),
    );
  }
}

class TitleLoading extends StatelessWidget {
  const TitleLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.primaryColor,
      highlightColor: context.surfaceColor,
      enabled: true,
      child: const TitlePlaceholder(),
    );
  }
}

class TitlePlaceholder extends StatelessWidget {
  final double width;

  const TitlePlaceholder({
    Key? key,
    this.width = 200,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: 12.0,
            color: const Color.fromARGB(100, 255, 255, 255),
          ),
          const SizedBox(height: 8.0),
          Container(
            width: width,
            height: 12.0,
            color: const Color.fromARGB(100, 255, 255, 255),
          ),
        ],
      ),
    );
  }
}
