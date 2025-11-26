import 'package:flutter/material.dart';
import 'package:ethio_swift/widgets/common/primary_button.dart';
import 'package:ethio_swift/main.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome Back!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: kPrimaryColor),
            ),
            const SizedBox(height: 8),
            const Text(
              'Login with your phone number.',
              style: TextStyle(fontSize: 16, color: kTextColor),
            ),
            const SizedBox(height: 40),
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone number',
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Ethiopian flag icon placeholder
                      Image.network(
                        'https://placehold.co/20x15/fff/007A33?text=ET',
                        height: 15,
                        width: 20,
                        errorBuilder: (context, error, stackTrace) => const Text('🇪🇹', style: TextStyle(fontSize: 18)),
                      ),
                      const SizedBox(width: 8),
                      const Text('+251', style: TextStyle(fontSize: 16)),
                      const SizedBox(width: 8),
                      const VerticalDivider(width: 1),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            PrimaryButton(
              text: 'SEND CODE',
              onPressed: () {
                // TODO: Implement phone number validation and API call
                Navigator.pushNamed(context, '/otp');
              },
            ),
            const Spacer(),
            Center(
              child: TextButton(
                onPressed: () {
                  // TODO: Implement Sign Up logic (e.g., show registration form)
                },
                child: const Text("Don't have an account? Sign Up", style: TextStyle(color: kPrimaryColor)),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
