import 'dart:async';
import 'dart:io';

class SpinnerController {
  bool _running = false;

  bool get isRunning => _running;

  void start() => _running = true;
  void stop() => _running = false;
}

Future<void> spinner(SpinnerController controller) async {
  final frames = ['|', '/', '-', '\\'];
  int i = 0;

  stdout.write('Loading ');
  while (controller.isRunning) {
    stdout.write('\b${frames[i % frames.length]}');
    await Future.delayed(Duration(milliseconds: 100));
    i++;
  }
  stdout.write('\b \b');
}
