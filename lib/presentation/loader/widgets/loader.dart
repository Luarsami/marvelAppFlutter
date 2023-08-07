import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Marvel',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                shadows: [
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 3.0,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            CircularProgressIndicator(color: Colors.red),
          ],
        ),
      ),
    );
  }
}
