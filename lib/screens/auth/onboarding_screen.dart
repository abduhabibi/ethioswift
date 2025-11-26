import 'package:flutter/material.dart';
import 'package:ethio_swift/widgets/common/primary_button.dart';
import 'package:ethio_swift/main.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  _buildOnboardingPage(
                    context,
                    'EthioSwift',
                    'Track Your Bus in Real-Time. Arrive Safely.',
                    'https://placehold.co/400x300/e0f7fa/007A33?text=Bus+Tracking+Illustration',
                  ),
                  _buildOnboardingPage(
                    context,
                    'Digital Tickets',
                    'Buy and validate tickets instantly from your phone.',
                    'https://placehold.co/400x300/e0f7fa/007A33?text=QR+Ticket+Illustration',
                  ),
                  _buildOnboardingPage(
                    context,
                    'Smart Wallet',
                    'Manage your travel budget with ease and transparency.',
                    'https://placehold.co/400x300/e0f7fa/007A33?text=Wallet+Illustration',
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) => _buildDot(index)),
            ),
            const SizedBox(height: 32),
            PrimaryButton(
              text: 'GET STARTED',
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildOnboardingPage(BuildContext context, String title, String subtitle, String imageUrl) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          imageUrl,
          height: 250,
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.directions_bus, size: 150, color: kPrimaryColor),
        ),
        const SizedBox(height: 40),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 34, color: kPrimaryColor),
        ),
        const SizedBox(height: 12),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: _currentPage == index ? 24.0 : 8.0,
      decoration: BoxDecoration(
        color: _currentPage == index ? kPrimaryColor : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}
