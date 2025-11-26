import 'package:flutter/material.dart';
import 'package:ethio_swift/screens/auth/login_screen.dart';
import 'package:ethio_swift/screens/auth/otp_verification_screen.dart';
import 'package:ethio_swift/screens/auth/onboarding_screen.dart';
import 'package:ethio_swift/screens/main/home_screen.dart';
import 'package:ethio_swift/screens/main/my_trips_screen.dart';
import 'package:ethio_swift/screens/main/wallet_screen.dart';
import 'package:ethio_swift/screens/main/settings_screen.dart';

// --- 1. THEME AND COLOR PALETTE (Constants) ---
const Color kPrimaryColor = Color(0xFF007A33); 
const Color kAccentColor = Color(0xFFFFA500); 
const Color kTextColor = Color(0xFF333333);
const Color kLightGrey = Color(0xFFF5F5F5);

final ThemeData appTheme = ThemeData(
  primaryColor: kPrimaryColor,
  colorScheme: ColorScheme.light(
    primary: kPrimaryColor,
    secondary: kAccentColor,
    onPrimary: Colors.white,
    surface: Colors.white,
    background: Colors.white,
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: kTextColor,
    elevation: 0,
    centerTitle: false,
    titleTextStyle: TextStyle(
      color: kPrimaryColor,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kPrimaryColor,
      foregroundColor: Colors.white,
      minimumSize: const Size(double.infinity, 56),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: kPrimaryColor, width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  ),
);

// --- 2. MAIN APPLICATION SETUP ---

void main() {
  runApp(const EthioSwiftApp());
}

class EthioSwiftApp extends StatelessWidget {
  const EthioSwiftApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EthioSwift',
      theme: appTheme,
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/otp': (context) => const OtpVerificationScreen(),
        '/home': (context) => const HomeScreen(),
        '/my_trips': (context) => const MyTripsScreen(),
        '/wallet': (context) => const WalletScreen(),
        '/settings': (context) => const SettingsScreen(),
        // Add other detailed screens here (BusDetail, Ticket, etc.)
      },
    );
  }
}
