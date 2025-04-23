import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;
  List<int> numbers = [];

  void onClicked(String type) {
    setState(() {
      if (type == 'plus') {
        counter = counter + 1;
        numbers.add(numbers.length);
      } else if (type == 'minus') {
        counter = counter - 1;
        numbers.removeLast();
      }
      print('넘버스 : $numbers');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Click Count',
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
              // Text(
              //   '$counter',
              //   style: const TextStyle(color: Colors.black, fontSize: 20),
              // ),
              for (var n in numbers) Text('$n'),
              IconButton(
                onPressed: () => onClicked('plus'),
                iconSize: 40,
                icon: const Icon(Icons.add_box_rounded),
              ),
              IconButton(
                onPressed: () => onClicked('minus'),
                iconSize: 40,
                icon: const Icon(Icons.remove_circle_rounded),
              ),
              IconButton(
                onPressed: () => onClicked('stop'),
                iconSize: 40,
                icon: const Icon(Icons.stop_circle_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
