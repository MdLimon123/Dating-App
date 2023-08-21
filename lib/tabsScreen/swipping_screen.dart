import 'package:flutter/material.dart';

class SwippingScreen extends StatefulWidget {

  const SwippingScreen({super.key});

  @override
  State<SwippingScreen> createState() => _SwippingScreenState();
}

class _SwippingScreenState extends State<SwippingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Swipping Screen'),
      ),
    );
  }
}
