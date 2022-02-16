import 'package:flutter/material.dart';
import 'package:planets/add_planet.dart';
import 'dart:ui' as UI;

class Planets extends StatefulWidget {
  const Planets({Key? key}) : super(key: key);

  static List<int> scores = [];

  static List<int> distances = [];

  static List<Color> colors = [];

  static List<double> radii = [];

  static bool onPage = true;
  @override
  _PlanetsState createState() => _PlanetsState();
}

class _PlanetsState extends State<Planets> with TickerProviderStateMixin {
  static List<AnimationController> planets = <AnimationController>[];

  @override
  void initState() {
    super.initState();
    if (Planets.scores.isNotEmpty) {
      planets.add(AnimationController(
        vsync: this,
        duration: Duration(seconds: Planets.scores.last),
      ),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Planets.onPage ? Scaffold(
      backgroundColor: const Color(0xFF6C63FF),
      appBar: AppBar(
        title: const Text('Planets'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: planets.isNotEmpty ? AnimatedBuilder(
          animation: planets.last,
          builder: (context, snapshot) {
            return Center(
              child: CustomPaint(
                painter: AtomPaint(
                    controllers: planets,
                    ),
              ),
            );
          }) : Container(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '0',
            child: const Icon(Icons.play_arrow),
            onPressed: () {
              if (planets.isEmpty) {
                setState(() {
                  Planets.onPage = false;
                });
              } else {
                for (var element in planets) {
                  element.reset();
                }
                for (var element in planets) {
                  element.repeat();
                }
              }
            },
          ),
          FloatingActionButton(
            heroTag: '1',
            child: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                Planets.onPage = false;
              });
            },
          ),],),
    ) : const AddPlanetPage();
  }
}

class AtomPaint extends CustomPainter {
  AtomPaint({required this.controllers});

  final List<AnimationController> controllers;

  final Paint _axisPaint = Paint()
    ..color = const Color(0xFFE6E6E6)
    ..strokeWidth = 0.0
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(const Offset(0, 0), 20.0, Paint()..color = Colors.yellow);
    for (int j = 0; j < controllers.length; j++) {
      drawAxis(
          controllers[j].value,
          canvas,
          Planets.distances[j].toDouble(),
          Paint()..color = Planets.colors[j],
          Planets.radii[j],);
    }
  }

  drawAxis(double value, Canvas canvas, double distance, Paint paint,
      double radius,) {
    var firstAxis = getCirclePath(distance);
    canvas.drawPath(firstAxis, _axisPaint);
    UI.PathMetrics pathMetrics = firstAxis.computeMetrics();
    for (UI.PathMetric pathMetric in pathMetrics) {
      Path extractPath = pathMetric.extractPath(
        0.0,
        pathMetric.length * value,
      );
      try {
        var metric = extractPath.computeMetrics().first;
        final offset = metric.getTangentForOffset(metric.length)!.position;
        canvas.drawCircle(offset, radius, paint);
      } catch (e) {}
    }
  }

  Path getCirclePath(double radius) => Path()
    ..addOval(Rect.fromCenter(
        center: const Offset(0, 0), width: radius * 1.5, height: radius * 1.5));

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
