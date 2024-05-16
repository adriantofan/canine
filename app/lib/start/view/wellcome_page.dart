import 'package:flutter/material.dart';

class WellcomePage extends StatelessWidget {
  const WellcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wellcome')),
      body: const Center(
        child: Text('Don\'t have an account? Call your doctor to invite you.'),
      ),
    );
  }
}
