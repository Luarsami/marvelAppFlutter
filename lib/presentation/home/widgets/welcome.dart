import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Welcome extends StatelessWidget {
  const Welcome({key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Text(
              'Hola, bienvenido',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 100,
              height: 100,
              child: SpinKitWave(
                color: Colors.blue,
                size: 50.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
