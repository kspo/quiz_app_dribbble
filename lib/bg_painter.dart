import 'dart:math';

import 'package:flutter/material.dart';

class BgPainter extends CustomPainter {
  double animationValue;
  BgPainter({required this.animationValue});
  @override
  void paint(Canvas canvas, Size size) {
    print("${size.width} ${size.height}");
    Paint paintFillbg = Paint()
      ..shader = RadialGradient(colors: const [
        Color.fromARGB(255, 29, 203, 234),
        Colors.white,
      ], stops: [
        animationValue,
        animationValue,
      ]).createShader(Rect.fromCircle(
        center: Offset(size.width + 50, size.height / 1.8),
        radius: size.width * 2.3256,
      ))
      ..blendMode = BlendMode.src
      ..style = PaintingStyle.fill;

    Path pathBg = Path();
    pathBg.moveTo(0, 0);
    pathBg.lineTo(0, size.height);
    pathBg.lineTo(size.width, size.height);
    pathBg.lineTo(size.width, 0);
    pathBg.close();

    canvas.drawPath(pathBg, paintFillbg);

    /////

    var paint = Paint()
      ..shader = RadialGradient(colors: const [
        Color.fromARGB(255, 0, 0, 232),
        Colors.white,
      ], stops: [
        animationValue,
        animationValue,
      ]).createShader(Rect.fromCircle(
        center: Offset(size.width * 2, -size.height / 2),
        radius: size.width * 3.4884,
      ))
      ..style = PaintingStyle.fill;

    Path path_1t = Path();
    path_1t.moveTo(size.width * -0.3133927, size.height * -0.0919836);
    path_1t.cubicTo(
        size.width * 1.5313656,
        size.height * -0.2676174,
        size.width * 1.0060814,
        size.height * 0.0961385,
        size.width * 1.0090925,
        size.height * 0.4948318);
    path_1t.cubicTo(
        size.width * 0.2258185,
        size.height * 0.6078091,
        size.width * -0.3569126,
        size.height * 0.3494405,
        size.width * -0.3133927,
        size.height * -0.0919836);
    path_1t.close();

    canvas.drawPath(path_1t, paint);

    // canvas.drawCircle(
    //     Offset(size.width / 1.5, size.height / 10), size.width * 0.9302, paint);

    // var paint_0 = Paint()
    //   ..shader = RadialGradient(colors: const [
    //     Color.fromARGB(255, 8, 19, 216),
    //     Colors.white,
    //   ], stops: [
    //     animationValue,
    //     animationValue,
    //   ]).createShader(Rect.fromCircle(
    //     center: const Offset(0, 0),
    //     radius: size.width * 11.6279,
    //   ))
    //   ..blendMode = BlendMode.overlay
    //   ..style = PaintingStyle.fill;

    // canvas.drawCircle(
    //     Offset(-size.width / 8, size.height / 2), size.width * 1.1628, paint_0);

    var paint_1 = Paint()
      ..color = const Color.fromARGB(255, 230, 119, 16)
      ..shader = RadialGradient(colors: const [
        Color.fromARGB(255, 230, 119, 16),
        Colors.white,
      ], stops: [
        animationValue,
        animationValue,
      ]).createShader(Rect.fromCircle(
        center: Offset(0, size.height),
        radius: size.width * 2.093,
      ))
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
        Offset(size.width, size.height), size.width * 0.8139, paint_1);

    var paint_2 = Paint()
      ..shader = RadialGradient(colors: const [
        Color.fromARGB(255, 230, 119, 16),
        Color.fromARGB(255, 215, 76, 21),
        Colors.white,
      ], stops: [
        animationValue - 0.3,
        animationValue,
        animationValue,
      ]).createShader(Rect.fromCircle(
        center: Offset(size.width - 10, size.height + 50),
        radius: size.width * 0.5814,
      ))
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(size.width - 10, size.height + 50),
        size.width * 0.5814, paint_2);

    Paint paintFill0 = Paint()
      ..shader = RadialGradient(colors: const [
        Color.fromARGB(180, 55, 0, 255),
        Colors.white,
      ], stops: [
        animationValue,
        animationValue,
      ]).createShader(Rect.fromCircle(
        center: Offset(-size.width, size.height),
        radius: size.width * 2.3256,
      ))
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.colorBurn;

    Path path_0 = Path();
    path_0.moveTo(0, size.height - (size.height / 5));
    path_0.lineTo(0, size.height);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width, size.height - (size.height / 15));
    path_0.arcTo(
        Rect.fromCircle(
            center: Offset(size.width / 1.4, size.height / 2),
            radius: size.width),
        0,
        500,
        false);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);

    Paint paintStroke1x = Paint()
      ..shader = RadialGradient(colors: const [
        Color.fromARGB(255, 8, 68, 232),
        Colors.white,
      ], stops: [
        animationValue,
        animationValue,
      ]).createShader(Rect.fromCircle(
        center: Offset(size.width * -0.3133927, size.height * -0.0919836),
        radius: size.width * 2.9256,
      ))
      ..style = PaintingStyle.fill;

    Path path_1x = Path();
    path_1x.moveTo(size.width * -0.3133927, size.height * -0.0919836);
    path_1x.cubicTo(
        size.width * 0.1749025,
        size.height * -0.0960329,
        size.width * 1.0060814,
        size.height * 0.0961385,
        size.width * 1.0090925,
        size.height * 0.4948318);
    path_1x.cubicTo(
        size.width * 0.2258185,
        size.height * 0.6078091,
        size.width * -0.3569126,
        size.height * 0.3494405,
        size.width * -0.3133927,
        size.height * -0.0919836);
    path_1x.close();

    canvas.drawPath(path_1x, paintStroke1x);

    var paint_4 = Paint()
      ..color = const Color.fromARGB(45, 255, 255, 255)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(const Offset(-40, 0), size.width * 1.1628, paint_4);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
