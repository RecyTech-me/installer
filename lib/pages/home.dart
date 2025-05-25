import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recytech_installer/pages/setup_account.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: SvgPicture.asset("assets/images/recytech-logo.svg"),
              ),
              const SizedBox(height: 30),
              Text(
                'Bienvenue sur votre\nnouvel ordinateur RecyTech !',
                textAlign: TextAlign.center,
                style: textTheme.headlineMedium,
              ),
              const SizedBox(height: 20),
              Text(
                'Nous allons vous guider à travers les étapes\ninitiales pour configurer votre appareil.',
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium,
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SetupAccountPage()),
                  );
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Commencer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
