import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(CronometroApp());

class CronometroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: CronometroHomePage(),
    );
  }
}

class CronometroHomePage extends StatefulWidget {
  @override
  _CronometroHomePageState createState() => _CronometroHomePageState();
}

class _CronometroHomePageState extends State<CronometroHomePage> {
  late Stopwatch _stopwatch;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    _timer = Timer.periodic(Duration(seconds: 1), _onTick);
  }

  void _onTick(Timer timer) {
    if (_stopwatch.isRunning) {
      setState(() {});
    }
  }

  void _startStopwatch() {
    setState(() {
      _stopwatch.start();
    });
  }

  void _stopStopwatch() {
    setState(() {
      _stopwatch.stop();
    });
  }

  void _resetStopwatch() {
    setState(() {
      _stopwatch.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    final hours = _stopwatch.elapsed.inHours.toString().padLeft(2, '0');
    final minutes = (_stopwatch.elapsed.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true, 
        title: Text('Cronómetro'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$hours:$minutes:$seconds',
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(height: 2),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 5.0, 
              runSpacing: 2.0, 
              children: <Widget>[
                ElevatedButton(
                  onPressed: _startStopwatch,
                  child: Text('Start'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton(
                  onPressed: _stopStopwatch,
                  child: Text('Stop'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton(
                  onPressed: _resetStopwatch,
                  child: Text('Reset'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
