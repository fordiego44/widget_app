import 'package:flutter/material.dart';

class ProgressScren extends StatelessWidget {
  static const name = "progress";

  const ProgressScren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Progress Indicators"),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          SizedBox(height: 30.0),
          Text("Circular progress indicator"),
          SizedBox(height: 10.0),
          CircularProgressIndicator(
              strokeWidth: 2.0, backgroundColor: Colors.black45),
          SizedBox(height: 20.0),
          Text("Circular indicator controlado"),
          SizedBox(height: 10.0),
          _ControlledProgressIndicator()
        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
          return (value * 2) / 100;
        }).takeWhile((value ) => value < 100 ),
        builder: (context, snapshot) {

          final progressValue = snapshot.data ?? 0;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  value: progressValue.toDouble(),
                  strokeWidth: 2,
                  backgroundColor: Colors.black12,
                ),
                const SizedBox(width: 20.0),
                Expanded(
                  child: LinearProgressIndicator(
                    value: progressValue.toDouble(),
                  ),
                )
              ],
            ),
          );
        });
  }
}
