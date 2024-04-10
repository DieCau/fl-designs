import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {
  const CuadradoAnimadoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: _CuadradoAnimado()),
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  const _CuadradoAnimado();

  @override
  State<_CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<_CuadradoAnimado> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  // Animaciones
  late Animation<double> moveRightAnimation;
  late Animation<double> moveUpAnimation;
  late Animation<double> moveLeftAnimation;
  late Animation<double> moveBottomAnimation;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 4500));

    moveRightAnimation = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller, curve: const Interval(0.0, 0.25, curve: Curves.bounceOut)));

    moveUpAnimation = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: controller, curve: const Interval(0.25, 0.50, curve: Curves.bounceOut)));

    moveLeftAnimation = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: controller, curve: const Interval(0.50, 0.75, curve: Curves.bounceOut)));

    moveBottomAnimation = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller, curve: const Interval(0.75, 1.0, curve: Curves.bounceOut)));

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed ) {
        controller.reset();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();

    return AnimatedBuilder(
        animation: controller,
        child: _Rectangulo(),
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
            offset: Offset(moveRightAnimation.value + moveLeftAnimation.value,
                moveUpAnimation.value + moveBottomAnimation.value),
            child: child,
          );
        });
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(color: Colors.blue),
    );
  }
}
