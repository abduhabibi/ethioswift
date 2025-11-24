import 'package:flutter/material.dart';
import 'package:ethio_swift/widgets/common/app_drawer.dart';
import 'package:ethio_swift/main.dart';

class MyTripsScreen extends StatelessWidget {
  const MyTripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Trips')),
      drawer: const AppDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // TODO: This should be wrapped in a FutureBuilder to fetch data from RouteService
          _buildTripCard(
            context,
            date: 'Today, 23 Nov 2025',
            route: 'Bole to Piazza',
            bus: 'Bus 404',
            cost: 'ETB 10.00',
            icon: Icons.check_circle_outline,
            iconColor: kPrimaryColor,
          ),
          _buildTripCard(
            context,
            date: 'Yesterday, 22 Nov 2025',
            route: 'Mexico Square to Kaliti',
            bus: 'Bus 110',
            cost: 'ETB 8.00',
            icon: Icons.check_circle_outline,
            iconColor: kPrimaryColor,
          ),
          _buildTripCard(
            context,
            date: '20 Nov 2025',
            route: 'Piassa to Kotebe',
            bus: 'Bus 215',
            cost: 'ETB 12.00',
            icon: Icons.check_circle_outline,
            iconColor: kPrimaryColor,
          ),
          _buildTripCard(
            context,
            date: '18 Nov 2025',
            route: 'Ayat to CMC',
            bus: 'Bus 301',
            cost: 'ETB 15.00',
            icon: Icons.cancel_outlined,
            iconColor: Colors.red,
            status: 'Cancelled',
          ),
        ],
      ),
    );
  }

  Widget _buildTripCard(
    BuildContext context, {
    required String date,
    required String route,
    required String bus,
    required String cost,
    required IconData icon,
    required Color iconColor,
    String status = 'Completed',
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Icon(icon, color: iconColor, size: 30),
        title: Text(route, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text('$bus | $date', style: TextStyle(color: Colors.grey.shade600)),
            const SizedBox(height: 4),
            Text(status, style: TextStyle(color: status == 'Cancelled' ? Colors.red : kPrimaryColor, fontWeight: FontWeight.w500)),
          ],
        ),
        trailing: Text(cost, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: kTextColor)),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Viewing trip details for $route')));
        },
      ),
    );
  }
}
