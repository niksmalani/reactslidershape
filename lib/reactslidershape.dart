library reactslidershape;

import 'package:flutter/material.dart';

class CustomSliderThumbReact extends SliderComponentShape {
  /// Create a slider thumb that draws a circle.
  CustomSliderThumbReact(
      {this.enabledThumbRadius = 10.0, this.disabledThumbRadius});

  /// The preferred radius of the round thumb shape when the slider is enabled.
  ///
  /// If it is not provided, then the material default of 10 is used.
  final double enabledThumbRadius;

  /// The preferred radius of the round thumb shape when the slider is disabled.
  ///
  /// If no disabledRadius is provided, then it is equal to the
  /// [enabledThumbRadius]
  final double disabledThumbRadius;
  double get _disabledThumbRadius => disabledThumbRadius ?? enabledThumbRadius;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(
        isEnabled == true ? enabledThumbRadius : _disabledThumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double> activationAnimation,
    @required Animation<double> enableAnimation,
    bool isDiscrete,
    TextPainter labelPainter,
    RenderBox parentBox,
    @required SliderThemeData sliderTheme,
    TextDirection textDirection,
    double value,
  }) {
    assert(context != null);
    assert(center != null);
    assert(enableAnimation != null);
    assert(sliderTheme != null);
    assert(sliderTheme.disabledThumbColor != null);
    assert(sliderTheme.thumbColor != null);

    final Canvas canvas = context.canvas;
    final Tween<double> radiusTween = Tween<double>(
      begin: _disabledThumbRadius,
      end: enabledThumbRadius,
    );
    final ColorTween colorTween = ColorTween(
      begin: sliderTheme.disabledThumbColor,
      end: sliderTheme.thumbColor,
    );
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromCenter(
              center: center,
              width: radiusTween.evaluate(enableAnimation) + 30,
              height: radiusTween.evaluate(enableAnimation) + 20,
            ),
            Radius.circular(5)),
        Paint()..color = colorTween.evaluate(enableAnimation));

    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromCenter(
              center: center,
              width: radiusTween.evaluate(enableAnimation) + 20,
              height: radiusTween.evaluate(enableAnimation) + 10,
            ),
            Radius.circular(5)),
        Paint()..color = Colors.white.withOpacity(0.5));
  }
}

class SliderOverlayReact extends SliderComponentShape {
  /// Create a slider thumb overlay that draws a circle.
  const SliderOverlayReact({this.overlayRadius = 24.0});

  /// The preferred radius of the round thumb shape when enabled.
  ///
  /// If it is not provided, then half of the track height is used.
  final double overlayRadius;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(overlayRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    @required Animation<double> activationAnimation,
    @required Animation<double> enableAnimation,
    bool isDiscrete = false,
    @required TextPainter labelPainter,
    @required RenderBox parentBox,
    @required SliderThemeData sliderTheme,
    @required TextDirection textDirection,
    @required double value,
  }) {
    assert(context != null);
    assert(center != null);
    assert(activationAnimation != null);
    assert(enableAnimation != null);
    assert(labelPainter != null);
    assert(parentBox != null);
    assert(sliderTheme != null);
    assert(textDirection != null);
    assert(value != null);

    final Canvas canvas = context.canvas;
    final Tween<double> radiusTween = Tween<double>(
      begin: 0.0,
      end: overlayRadius,
    );

    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromCenter(
              center: center,
              width: radiusTween.evaluate(enableAnimation) + 30,
              height: radiusTween.evaluate(enableAnimation) + 20,
            ),
            Radius.circular(5)),
        Paint()..color = sliderTheme.overlayColor);
  }
}
