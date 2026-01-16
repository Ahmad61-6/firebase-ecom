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
          physics: const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(padding: padding, child: child),
          ),
        );
      },
    );
  }
}
