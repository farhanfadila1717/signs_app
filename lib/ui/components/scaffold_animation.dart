import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ScaffoldAnimation extends StatelessWidget {
  const ScaffoldAnimation({
    super.key,
    this.appBar,
    this.body,
  });

  final PreferredSizeWidget? appBar;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final viewPadding = MediaQuery.viewPaddingOf(context);
    return Stack(
      children: [
        const Positioned.fill(
          child: ColoredBox(
            color: Colors.white,
          ),
        ),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blueAccent.withOpacity(.3),
                  Colors.white,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: viewPadding.bottom,
          child: Image.asset(
            'assets/images/bg.png',
            width: size.width,
          ),
        ),
        Positioned(
          bottom: 100,
          left: 0,
          child: Image.asset(
            'assets/images/bike.png',
            width: 90,
          )
              .animate(
                delay: const Duration(seconds: 5),
                onComplete: (contoller) => contoller.repeat(),
              )
              .slideX(
                begin: -1,
                duration: const Duration(seconds: 11),
                end: 8,
              ),
        ),
        Positioned(
          bottom: 50,
          left: 0,
          child: Image.asset(
            'assets/images/car_red.png',
            width: 150,
          )
              .animate(
                onComplete: (contoller) => contoller.repeat(),
              )
              .slideX(
                begin: -1,
                duration: const Duration(seconds: 10),
                end: 5,
              ),
        ),
        Scaffold(
          appBar: appBar,
          body: body,
          backgroundColor: Colors.transparent,
        ),
      ],
    );
  }
}
