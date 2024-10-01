import 'package:flutter/material.dart';

void main() {
  runApp(const CachoApp());
}

class CachoApp extends StatelessWidget {
  const CachoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Cacho(),
    );
  }
}

class Cacho extends StatefulWidget {
  const Cacho({super.key});

  @override
  State<Cacho> createState() => _CachoState();
}

class _CachoState extends State<Cacho> {
  int v1 = 0,
      v2 = 0,
      v3 = 0,
      v4 = 0,
      v5 = 0,
      v6 = 0,
      v7 = 0,
      v8 = 0,
      v9 = 0,
      v10 = 0;

  void button1Pressed() {
    setState(() {
      v1 = (v1 + 1) % 6;
    });
  }

  void button2Pressed() {
    setState(() {
      v2 = (v2 + 2) % 12;
    });
  }

  void button3Pressed() {
    setState(() {
      v3 = (v3 + 3) % 18;
    });
  }

  void button4Pressed() {
    setState(() {
      v4 = (v4 + 4) % 24;
    });
  }

  void button5Pressed() {
    setState(() {
      v5 = (v5 + 5) % 30;
    });
  }

  void button6Pressed() {
    setState(() {
      v6 = (v6 + 6) % 36;
    });
  }

  void button7Pressed() {
    setState(() {
      if (v7 == 0) {
        v7 = 50;
      } else {
        v7 = 0;
      }
    });
  }

  void button8Pressed() {
    setState(() {
      if (v8 == 0) {
        v8 = 20;
      } else if (v8 == 20) {
        v8 = 25;
      } else {
        v8 = 0;
      }
    });
  }

  void button9Pressed() {
    setState(() {
      if (v9 == 0) {
        v9 = 30;
      } else if (v9 == 30) {
        v9 = 35;
      } else {
        v9 = 0;
      }
    });
  }

  void button10Pressed() {
    setState(() {
      if (v10 == 0) {
        v10 = 40;
      } else if (v10 == 40) {
        v10 = 45;
      } else {
        v10 = 0;
      }
    });
  }

  void buttonReset() {
    setState(() {
      v1 = 0;
      v2 = 0;
      v3 = 0;
      v4 = 0;
      v5 = 0;
      v6 = 0;
      v7 = 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
    });
  }

  Widget buildButton(String texto, int valor, VoidCallback funcion) {
    return Column(
      children: <Widget>[
        Text(
          texto,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 90,
          height: 90,
          child: ElevatedButton(
            onPressed: funcion,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              '$valor',
              style: const TextStyle(fontSize: 35),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Juego Cacho')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildButton('balas', v1, button1Pressed),
                buildButton('escaleras', v8, button8Pressed),
                buildButton('cuadras', v4, button4Pressed),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildButton('tontos', v2, button2Pressed),
                buildButton('full', v9, button9Pressed),
                buildButton('quinas', v5, button5Pressed),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildButton('tricas', v3, button3Pressed),
                buildButton('poker', v10, button10Pressed),
                buildButton('senas', v6, button6Pressed),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[buildButton('grande', v7, button7Pressed)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ElevatedButton(
                  onPressed: buttonReset,
                  child: const Text('Reset'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
