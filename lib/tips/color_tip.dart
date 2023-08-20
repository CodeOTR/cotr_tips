import 'package:flutter/material.dart';

class ColorTip extends StatelessWidget {
  const ColorTip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color red = Colors.red;
    Color yellow = Colors.yellow;
    Color blue = Colors.blue;

    bool isLight(Color color) => ThemeData.estimateBrightnessForColor(color) == Brightness.light;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Color Tip'),
        ),
        body: Center(
          child: Column(
            children: [
              ColoredBox(
                color: Colors.red,
                child: Text(
                  'Text on Colors.red',
                  style: TextStyle(
                    color: Colors.red.computeLuminance() > 0.5 ? Colors.black : Colors.white,
                  ),
                ),
              ),
              ColoredBox(
                color: yellow,
                child: Text(
                  'Text on Colors.yellow',
                  style: TextStyle(
                    color: yellow.computeLuminance() > 0.5 ? Colors.black : Colors.white,
                  ),
                ),
              ),
              ColoredBox(
                color: blue,
                child: Text(
                  'Text on Colors.blue',
                  style: TextStyle(
                    color: isLight(Colors.blue) ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}