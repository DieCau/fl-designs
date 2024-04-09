import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xff615AAB),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  const HeaderBordesRedondeados({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
          color: Color(0xff615AAB),
          borderRadius:
              BorderRadius.only(bottomLeft: Radius.circular(70), bottomRight: Radius.circular(70))),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: _HeaderDiagonalPainter(),
        ));
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    // Propiedades
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .stroke = bordes  // .fill = relleno
    lapiz.strokeWidth = 2; // ancho del lapiz
    final path = Path();

    // Dibujar con el path y el lapiz
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    //path.lineTo(0, size.height * 0.5);

    // Dibujar en el canvas
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderTriangular extends StatelessWidget {
  const HeaderTriangular({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: _HeaderTriangularPainter(),
        ));
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    // Propiedades
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .stroke = bordes  // .fill = relleno
    lapiz.strokeWidth = 2; // ancho del lapiz
    final path = Path();

    // Dibujar con el path y el lapiz
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    // Dibujar en el canvas
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPico extends StatelessWidget {
  const HeaderPico({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: _HeaderPicoPainter(),
        ));
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    // Propiedades
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .stroke = bordes  // .fill = relleno
    lapiz.strokeWidth = 20; // ancho del lapiz
    final path = Path();

    // Dibujar con el path y el lapiz
    path.lineTo(0, size.height * 0.20);
    path.lineTo(size.width * 0.5, size.height * 0.28);
    path.lineTo(size.width, size.height * 0.20);
    path.lineTo(size.width, 0);
    // path.lineTo(size.width, size.height);
    // path.lineTo(size.width, 0);

    // Dibujar en el canvas
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: _HeaderCurvoPainter(),
        ));
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    // Propiedades
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .stroke = bordes  // .fill = relleno
    lapiz.strokeWidth = 20; // ancho del lapiz
    final path = Path();

    // Dibujar con el path y el lapiz
    path.lineTo(0, size.height * 0.23);
    path.quadraticBezierTo(size.width * 0.50, size.height * 0.50, size.width, size.height * 0.23);
    path.lineTo(size.width, 0);
    // path.lineTo(size.width, size.height * 0.25);

    // Dibujar en el canvas
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWave extends StatelessWidget {
  const HeaderWave({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: _HeaderWavePainter(),
        ));
  }
}

class _HeaderWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    // Propiedades
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .stroke = bordes  // .fill = relleno
    lapiz.strokeWidth = 10; // ancho del lapiz
    final path = Path();

    // Dibujar con el path y el lapiz
    path.lineTo(0, size.height * 0.30);
    path.quadraticBezierTo(
        size.width * 0.25, size.height * 0.35, size.width * 0.50, size.height * 0.30);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.25, size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    // path.lineTo(size.width, 0);
    // path.lineTo(size.width, size.height * 0.25);

    // Dibujar en el canvas
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWaveGradient extends StatelessWidget {
  const HeaderWaveGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: _HeaderWaveGradientPainter(),
        ));
  }
}

class _HeaderWaveGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    
    final Rect rect = Rect.fromCircle(
      center: const Offset(0.0, 55.0), 
      radius: 180);
    
    const Gradient gradiente = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color(0xff6D05E8),
        Color(0xffc012ff),
        Color(0xff6d05fa),
      ],
      stops: [
        0.2,
        0.5,
        1.0,
      ]

    );

    final lapiz = Paint()..shader = gradiente.createShader(rect);

    // Propiedades
    //lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .stroke = bordes  // .fill = relleno
    lapiz.strokeWidth = 10; // ancho del lapiz
    final path = Path();

    // Dibujar con el path y el lapiz
    path.lineTo(0, size.height * 0.30);
    path.quadraticBezierTo(
        size.width * 0.25, size.height * 0.35, size.width * 0.50, size.height * 0.30);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.25, size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    // path.lineTo(size.width, 0);
    // path.lineTo(size.width, size.height * 0.25);

    // Dibujar en el canvas
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
