import 'package:flutter/material.dart';

const double kFigmaDesignWidth = 390;
const double kFigmaDesignHeight = 844;

enum DeviceType { mobile, tablet, desktop }

typedef ResponsiveBuild = Widget Function(
  BuildContext context,
  Orientation orientation,
  DeviceType deviceType,
);

extension ResponsiveExtension on num {
  double get w => SizeUtils.width == 0
      ? toDouble()
      : (this * SizeUtils.width) / kFigmaDesignWidth;

  double get h => SizeUtils.height == 0
      ? toDouble()
      : (this * SizeUtils.height) / kFigmaDesignHeight;

  double get sp => SizeUtils.width == 0
      ? toDouble()
      : (this * SizeUtils.width) / kFigmaDesignWidth;

  double get r {
    final shortestSide =
        SizeUtils.width < SizeUtils.height ? SizeUtils.width : SizeUtils.height;
    return (this * shortestSide) / kFigmaDesignWidth;
  }
}

class Sizer extends StatelessWidget {
  const Sizer({super.key, required this.builder});

  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeUtils.setScreenSize(constraints, orientation, context);
            return builder(
              context,
              orientation,
              SizeUtils.deviceType,
            );
          },
        );
      },
    );
  }
}

class SizeUtils {
  static late BoxConstraints boxConstraints;
  static late Orientation orientation;
  static late DeviceType deviceType;
  static late double width;
  static late double height;
  static late EdgeInsets safeAreaPadding;

  static void setScreenSize(
    BoxConstraints constraints,
    Orientation currentOrientation,
    BuildContext context,
  ) {
    boxConstraints = constraints;
    orientation = currentOrientation;
    safeAreaPadding = MediaQuery.of(context).padding;

    if (orientation == Orientation.portrait) {
      width = boxConstraints.maxWidth.nonZero(defaultValue: kFigmaDesignWidth);
      height = boxConstraints.maxHeight.nonZero();
    } else {
      width = boxConstraints.maxWidth.nonZero(defaultValue: kFigmaDesignWidth);
      height = boxConstraints.maxHeight.nonZero();
    }
    
    if (width >= 1200) {
      deviceType = DeviceType.desktop;
    } else if (width >= 600) {
      deviceType = DeviceType.tablet;
    } else {
      deviceType = DeviceType.mobile;
    }
  }

  static bool get isPortrait => orientation == Orientation.portrait;
  static bool get isLandscape => orientation == Orientation.landscape;
}

extension FormatExtension on double {
  double nonZero({double defaultValue = 0.0}) => this > 0 ? this : defaultValue;
}
