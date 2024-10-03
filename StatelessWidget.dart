import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
final int count;
final VoidCallback onIncrement;

const Counter({super.key, required this.count, required this.onIncrement});

@override
Widget build(BuildContext context) {
return Row(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
ElevatedButton(
onPressed: onIncrement,
child: const Text('Increment'),
),
const SizedBox(width: 16),
Text('Count: $count'),
],
);
}
}

class ParentWidget extends StatefulWidget {
const ParentWidget({super.key});

@override
State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
int _counter = 0;

void _incrementCounter() {
setState(() {
_counter++;
});
}

@override
Widget build(BuildContext context) {
return Center(
child: Counter(
count: _counter,
onIncrement: _incrementCounter,
),
);
}
}

void main() {
runApp(
const MaterialApp(
home: Scaffold(
body: ParentWidget(),
),
),
);
}