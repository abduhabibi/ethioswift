import 'package:flutter/material.dart';
import 'package:ethio_swift/widgets/common/app_drawer.dart';
import 'package:ethio_swift/widgets/home/bus_list_sheet.dart';
import 'package:ethio_swift/main.dart';
// Note: GoogleMaps integration would use the google_maps_flutter package here

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EthioSwift'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // TODO: Navigate to Profile screen or show profile snippet
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Stack(
        children: [
          // Placeholder for Google Map (Requires integration with google_maps_flutter)
          Container(
            color: Colors.grey.shade300,
            alignment: Alignment.center,
            child: const Text("Map Placeholder (Google Maps Integration)", style: TextStyle(color: kTextColor)),
          ),
          // Search Bar Overlay
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Where to?',
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          // Bus List Bottom Sheet
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BusListSheet(),
          ),
        ],
      ),
    );
  }
}
