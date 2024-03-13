import 'dart:async';

import 'package:cats_app/config/router/app_router.dart';
import 'package:cats_app/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {

  static const String name = 'splash';

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {

    Timer(const Duration(seconds: 2), () {
      context.replaceNamed(HomePage.name);
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/cat.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'CatsApp',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}