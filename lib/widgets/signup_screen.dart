import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    void _validateAndSignup() {
      final name = nameController.text;
      final email = emailController.text;
      final password = passwordController.text;
      final emailPattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

      if (name.isEmpty || email.isEmpty || password.isEmpty) {
        showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return const AlertDialog(
              title: Text('Error'),
              content: Text("All fields are required"),
            );
          },
        );
      } else if (!emailPattern.hasMatch(email)) {
        showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return const AlertDialog(
              title: Text('Error'),
              content: Text("Please enter a valid email address"),
            );
          },
        );
      } else if (password.length < 7) {
        showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return const AlertDialog(
              title: Text('Error'),
              content: Text("Password must be at least 7 characters long"),
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return const AlertDialog(
              title: Text('Registration'),
              content: Text("Account created successfully!"),
            );
          },
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Create an Account',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Name",
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
              ),
            ),
            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _validateAndSignup,
                    child: const Text("Login"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
