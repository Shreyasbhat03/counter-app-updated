import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_bus/event_bus.dart';
import 'bloc/add_bloc.dart';
import 'bloc/reset_bloc.dart';
import 'bloc/sub_bloc.dart';
import 'bloc/counter_bloc.dart';
import 'widget/decr_widget.dart';
import 'widget/inc_widget.dart';
import 'widget/reset_widget.dart';
import 'widget/visual_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Event Bus Example'),
        ),
        body: Material(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [Colors.blue,
                  Colors.blue,
                  Colors.black12],
                stops: [0.3, 1.0, 0.0],
              ),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Using MediaQuery to get the screen height and width
                double screenHeight = MediaQuery.of(context).size.height;
                double screenWidth = MediaQuery.of(context).size.width;
                print('Screen height: $screenHeight, Screen width: $screenWidth');

                return Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CounterText(),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                            IncrementButton(),
                            DecrementButton(),
                            ResetButton(),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
