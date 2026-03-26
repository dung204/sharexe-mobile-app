import 'package:flutter/material.dart';

class GlobalErrorScreen extends StatelessWidget {
  const GlobalErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Not Found')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            const Text('Page not found', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => {
                // TODO: context.go(AppRoutes.home),
              },
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}
