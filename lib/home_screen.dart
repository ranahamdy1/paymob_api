import 'package:flutter/material.dart';
import 'package:paymob_api/payScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paymob Integration"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async => Navigator.push (
            context,
            MaterialPageRoute(builder: (context) => PaymentPage()),
          ),
          child: const Text("Pay 20 EGP"),
        ),
      ),
    );
  }
}
