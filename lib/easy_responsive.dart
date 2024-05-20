library easy_responsive;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// A EasyResponsive class.
class EasyResponsive {
  /// Singleton instance
  static final EasyResponsive _singleton = EasyResponsive._internal();

  /// Width of the screen
  double? _screenWidth;

  /// Height of the screen
  double? _screenHeight;

  /// Width of the design screen
  double? _designScreenWidth;

  /// Height of the design screen
  double? _designScreenHeight;

  /// Singleton instance
  factory EasyResponsive() {
    return _singleton;
  }

  /// Must be called before use any of the methods
  void initialize(
      {required BuildContext context,
      required double designScreenWidth,
      required double designScreenHeight}) {
    // log('Easy responsive initialized');
    _screenWidth = MediaQuery.sizeOf(context).width;
    _screenHeight = MediaQuery.sizeOf(context).height;
    _designScreenWidth = designScreenWidth;
    _designScreenHeight = designScreenHeight;
  }

  /// get the percent of the width of the screen and width of the design screen
  double get eaw {
    assert(
        _screenWidth != null, 'Must call EasyResponsive().initialize() first');
    return _screenWidth! / _designScreenWidth!;
  }

  /// get the percent of the height of the screen and height of the design screen
  double get eah {
    assert(
        _screenHeight != null, 'Must call EasyResponsive().initialize() first');

    return _screenHeight! / _designScreenHeight!;
  }

  /// Width of the screen
  double get screenWidth {
    assert(
        _screenWidth != null, 'Must call EasyResponsive().initialize() first');

    return _screenWidth!;
  }

  /// Height of the screen
  double get screenHeight {
    assert(
        _screenHeight != null, 'Must call EasyResponsive().initialize() first');

    return _screenHeight!;
  }

  /// Width of the design screen
  double get designScreenWidth {
    assert(_designScreenWidth != null,
        'Must call EasyResponsive().initialize() first');
    return _designScreenWidth!;
  }

  /// Height of the design screen
  double get designScreenHeight {
    assert(_designScreenHeight != null,
        'Must call EasyResponsive().initialize() first');
    return _designScreenHeight!;
  }

  EasyResponsive._internal();
}

extension EasyResponsiveExtension on num {
  /// Get width
  double get w => toDouble() * EasyResponsive().eaw;

  /// Get height
  double get h => toDouble() * EasyResponsive().eah;
}
