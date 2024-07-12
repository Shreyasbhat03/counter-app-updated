import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_bloc.dart';
class CounterText extends StatefulWidget {
  @override
  _CounterTextState createState() => _CounterTextState();
}
class _CounterTextState extends State<CounterText> {
  final CounterTextBloc bloc = CounterTextBloc();
  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 150.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: Colors.yellow.withOpacity(0.6),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.8), // Inner shadow
              offset: Offset(-3, -3),
              blurRadius: 3.0,
            ),
            BoxShadow(
              color:Colors.black.withOpacity(0.7), // Outer shadow
              offset: Offset(20, 20),
              blurRadius: 12.0,
            ),
          ],
        ),
        child: Center(
          child: StreamBuilder<int>(
            stream: bloc.counterStream,
            initialData: 0,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  'Counter: ${snapshot.data}',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                  ),
                );
              } else {
                return Text(
                  'Loading...',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}