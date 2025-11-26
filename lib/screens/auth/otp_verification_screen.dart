import 'package:flutter/material.dart';
import 'package:ethio_swift/widgets/common/primary_button.dart';
import 'package:ethio_swift/main.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Verify Your Number',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: kPrimaryColor),
            ),
            const SizedBox(height: 8),
            const Text(
              'Enter the 4-digit code sent to\n+251 911 234 567',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: kTextColor),
            ),
            const SizedBox(height: 40),
            // OTP Input Fields placeholder
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) => _buildOtpField()),
            ),
            const SizedBox(height: 32),
            PrimaryButton(
              text: 'VERIFY',
              onPressed: () {
                // TODO: Implement OTP verification and API call
                Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
              },
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                // TODO: Implement resend code logic
              },
              child: const Text('Resend Code in 0:30', style: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpField() {
    return SizedBox(
      width: 60,
      child: TextField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          counterText: "",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
