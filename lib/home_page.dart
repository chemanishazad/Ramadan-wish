import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: false);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top animation
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Lottie.asset('assets/json/top.json'),
          ),

          Center(
            child: Lottie.asset('assets/json/main.json'),
          ),

          Positioned(
            top: 600,
            left: 0,
            right: 0,
            child: ScaleTransition(
                scale: _animation,
                child: Image.asset('assets/images/logo.png')),
          ),
        ],
      ),
    );
  }
}
