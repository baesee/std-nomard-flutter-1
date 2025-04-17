import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';

class Player {
  String name;

  Player({required this.name});
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Hey, Selena',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          color: Colors.white.withAlpha(150),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Row(children: [Text('Hello'), Text('World')]),
              const SizedBox(height: 120),
              Text(
                'Total Balance',
                style: TextStyle(
                  color: Colors.white.withAlpha(80),
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '\$5,194,482',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button(
                    text: 'Transfer',
                    bgColor: Colors.amber,
                    textColor: Colors.black,
                  ),
                  Button(
                    text: 'Request',
                    bgColor: Color(0xFF1F2123),
                    textColor: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 100),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Wallet',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Veiw All',
                    style: TextStyle(
                      color: Colors.white.withAlpha(80),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1F2123),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Euro',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Text(
                                '55,662',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'EUR',
                                style: TextStyle(
                                  color: Colors.white.withAlpha(100),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Transform.scale(
                        scale: 2.2,
                        child: Transform.translate(
                          offset: const Offset(5, 20),
                          child: const Icon(
                            Icons.euro_rounded,
                            color: Colors.white,
                            size: 88,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
      ),
      home: const MyHomePage(title: 'Flutter 스터디 홈'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _redScore = 0;
  int _blueScore = 0;

  void _incrementRedScore() {
    setState(() {
      _redScore++;
    });
  }

  void _incrementBlueScore() {
    setState(() {
      _blueScore++;
    });
  }

  bool _isInRedArea(Offset position, Size size) {
    final path =
        Path()
          ..moveTo(0, 0)
          ..lineTo(size.width, 0)
          ..lineTo(0, size.height)
          ..close();
    return path.contains(position);
  }

  bool _isInBlueArea(Offset position, Size size) {
    final path =
        Path()
          ..moveTo(size.width, 0)
          ..lineTo(size.width, size.height)
          ..lineTo(0, size.height)
          ..close();
    return path.contains(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: DiagonalPainter(
                color: Colors.red.withOpacity(0.3),
                isTop: true,
              ),
            ),
          ),
          Positioned.fill(
            child: CustomPaint(
              painter: DiagonalPainter(
                color: Colors.blue.withOpacity(0.3),
                isTop: false,
              ),
            ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTapDown: (details) {
                final size = MediaQuery.of(context).size;
                if (_isInRedArea(details.localPosition, size)) {
                  _incrementRedScore();
                } else if (_isInBlueArea(details.localPosition, size)) {
                  _incrementBlueScore();
                }
              },
              child: Container(color: Colors.transparent),
            ),
          ),
          Positioned(
            left: 20,
            top: 20,
            child: Text(
              '$_redScore',
              style: const TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: Text(
              '$_blueScore',
              style: const TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DiagonalPainter extends CustomPainter {
  final Color color;
  final bool isTop;

  DiagonalPainter({required this.color, required this.isTop});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.fill;

    final path = Path();
    if (isTop) {
      path.moveTo(0, 0);
      path.lineTo(size.width, 0);
      path.lineTo(0, size.height);
      path.close();
    } else {
      path.moveTo(size.width, 0);
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.close();
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
*/
