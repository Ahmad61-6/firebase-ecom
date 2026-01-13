import 'package:flutter/material.dart';

class ScrollableFullHeight extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const ScrollableFullHeight({
    super.key,
    required this.child,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          // Uses 'physics' to ensure it feels natural (bouncing on iOS, etc.)
          physics: const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              // Forces the content to be at least as tall as the screen
              minHeight: constraints.maxHeight,
            ),
            child: Padding(
              padding: padding,
              // IntrinsicHeight is sometimes needed to force the child to stretch,
              // but often just the ConstrainedBox is enough.
              child: child,
            ),
          ),
        );
      },
    );
  }
}
