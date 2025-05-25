import 'dart:io';
import 'package:flutter/material.dart';

class InstallSuccessPage extends StatelessWidget {
  const InstallSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 223, 202),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline,
                size: 100,
                color: Color.fromARGB(255, 79, 111, 82),
              ),
              const SizedBox(height: 30),
              const Text(
                'Installation terminée !',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 79, 111, 82),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'Votre ordinateur est prêt à être utilisé.\nAppuyez sur le bouton ci-dessous pour redémarrer.',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 79, 111, 82),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.restart_alt),
                label: const Text('Redémarrer', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 79, 111, 82),
                  foregroundColor: const Color.fromARGB(255, 232, 223, 202),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
