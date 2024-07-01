// ignore_for_file: avoid_unnecessary_containers

import 'package:astrology/utils/custom_appbar.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppbar(
        title: "Login",
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        height: mediaQuery.height,
        width: mediaQuery.width,
        color: const Color(0XFFEDF9F6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(height: 300),
            const Text("Welcome Back"),
            TextFormField()
          ],
        ),
      ),
    );
  }
}
