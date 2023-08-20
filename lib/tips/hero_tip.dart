import 'package:flutter/material.dart';

ValueNotifier<bool> showAnimations = ValueNotifier(false);

void setShowAnimations(bool val) {
  showAnimations.value = val;
}

class HeroTip extends StatelessWidget {
  const HeroTip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: showAnimations,
        builder: (context, animate, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text('HeroMode: $animate'),
              actions: [
                const Text('Animations'),
                Switch(
                  value: animate,
                  onChanged: (value) {
                    setShowAnimations(value);
                  },
                ),
              ],
            ),
            body: const Center(child: Text('Screen 1')),
            floatingActionButton: HeroMode(
              enabled: animate,
              child: FloatingActionButton(
                child: const Icon(Icons.arrow_forward),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Screen2()),
                  );
                },
              ),
            ),
          );
        });
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: showAnimations,
        builder: (context, animate, _) {
          return Scaffold(
              appBar: AppBar(
                title:  Text('HeroMode: $animate'),
              ),
              body: const Center(child: Text('Screen 2'),),
              floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
              floatingActionButton:  HeroMode(
                enabled: showAnimations.value,
                child: FloatingActionButton(
                  child: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )
          );
        }
    );
  }
}