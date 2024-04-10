import 'package:flutter/material.dart';
import 'dart:math' as my_math;

class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    super.key,
  });

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotationAnimation;

  late Animation<double> opacityAnimation;
  late Animation<double> opacityOutAnimation;
  
  late Animation<double> moveRightAnimation;
  late Animation<double> scalarAnimation;

  // 2 Estados de un STFW
  @override
  void initState() {
    // Inicializar el controller
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 4000));

    rotationAnimation = Tween(begin: 0.0, end: 2 * my_math.pi)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    opacityAnimation = Tween(begin: 0.1, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0, 0.25, curve: Curves.easeOut)));
   
    opacityOutAnimation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0.75, 1.0, curve: Curves.easeOut)));

    moveRightAnimation = Tween(begin: 0.0, end: 200.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    scalarAnimation = Tween(begin: 0.0, end: 2.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        // controller.reverse();
        // controller.repeat();
        controller.reset();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose(); // Limpiar el estado
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Reproducir | Play
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget? childRectangulo) {
        
        // print('Opacidad: ${opacityAnimation.value}'); // Para tener informacion adicional de los Estados
        
        return Transform.translate(
          offset: Offset(moveRightAnimation.value, 0),
          child: Transform.rotate(
              angle: rotationAnimation.value,
              child: Opacity(
                opacity: opacityAnimation.value - opacityOutAnimation.value,
                child: Transform.scale(scale: scalarAnimation.value, child: childRectangulo),
              )),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(color: Colors.red),
    );
  }
}
