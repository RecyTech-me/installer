import 'package:flutter/material.dart';
import 'package:recytech_installer/pages/success_page.dart';
import 'package:recytech_installer/utils/system.dart';

class SetupAccountPage extends StatefulWidget {
  const SetupAccountPage({super.key});

  @override
  State<SetupAccountPage> createState() => _SetupAccountPageState();
}

class _SetupAccountPageState extends State<SetupAccountPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      final username = _usernameController.text.trim();
      final password = _passwordController.text;

      bool r = await System().userChange(username, password);
      if (r) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const InstallSuccessPage()),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Il y a une erreur.')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Création du compte'),
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Définissez votre nom d\'utilisateur\net mot de passe',
                textAlign: TextAlign.center,
                style: textTheme.headlineMedium,
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Nom d\'utilisateur',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Veuillez entrer un nom d\'utilisateur.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'Le mot de passe doit contenir au moins 6 caractères.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Confirmer le mot de passe',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
                validator: (value) {
                  if (value != _passwordController.text) {
                    return 'Les mots de passe ne correspondent pas.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: _submit,
                icon: const Icon(Icons.check),
                label: const Text('Créer le compte'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
