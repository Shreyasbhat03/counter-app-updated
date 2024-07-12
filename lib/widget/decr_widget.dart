import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/sub_bloc.dart';

class DecrementButton extends StatelessWidget {
  final DecrementButtonBloc bloc = DecrementButtonBloc();
  @override
  Widget build(BuildContext context) {
    final _isPressed = ValueNotifier<bool>(false); // Internal state

    return GestureDetector(
      onTapDown: (_) => _isPressed.value = true,
      onTapUp: (_) {
        _isPressed.value = false;
        bloc.decrement(); // Call the bloc's increment method
      },
      child: ValueListenableBuilder<bool>(
        valueListenable: _isPressed,
        builder: (context, isPressed, child) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 200),
            width: isPressed ? 105.0 : 150.0,
            height: isPressed ? 35.0 : 50.0, // Change height for animation effect
            decoration: BoxDecoration(
              color: isPressed ? Colors.blue.withOpacity(0.1) : Colors.blue.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: isPressed ? null : [
                BoxShadow(
                  color: Colors.white.withOpacity(0.5), // Inner shadow
                  offset: Offset(-2, -2),
                  blurRadius: 4.0,
                ),
                BoxShadow(
                  color:Colors.black.withOpacity(0.8), // Outer shadow
                  offset: Offset(20, 20),
                  blurRadius: 15.0,
                ),
              ],
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.remove,
                    color: Colors.white60,
                  ),
                  Text("Decrement",style: TextStyle(color: Colors.white60))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}