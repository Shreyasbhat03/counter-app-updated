import 'package:flutter/material.dart';

import '../bloc/add_bloc.dart';

class IncrementButton extends StatelessWidget {
  final IncrementButtonBloc bloc = IncrementButtonBloc();
  @override

  Widget build(BuildContext context) {
    final _isPressed = ValueNotifier<bool>(false); // Internal state

    return GestureDetector(
      onTapDown: (_) => _isPressed.value = true,
      onTapUp: (_) {
        _isPressed.value = false;
        bloc.increment(); // Call the bloc's increment method
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
                  color: isPressed ? Colors.black.withOpacity(1):Colors.black.withOpacity(0.8), // Outer shadow
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
                    Icons.add,
                    color: Colors.white60,
                  ),
                  Text("Increment",style: TextStyle(color: Colors.white60))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}