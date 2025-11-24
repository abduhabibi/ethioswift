import 'package:flutter/material.dart';
import 'package:ethio_swift/main.dart';

// Placeholder for the bottom sheet that shows available buses
class BusListSheet extends StatelessWidget {
  const BusListSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Available Buses', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: kTextColor)),
          const SizedBox(height: 16),
          _buildBusListItem(context, 'Bus 404', '5 min', true),
          _buildBusListItem(context, 'Bus 102', '12 min', false),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildBusListItem(BuildContext context, String busName, String eta, bool isClose) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const Icon(Icons.directions_bus, color: kPrimaryColor),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(busName, style: const TextStyle(fontWeight: FontWeight.w600)),
              Row(
                children: [
                  Text(eta, style: TextStyle(color: isClose ? kAccentColor : Colors.grey.shade600, fontWeight: FontWeight.bold)),
                  const Text(' ETA', style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ],
          ),
          const Spacer(),
          OutlinedButton(
            onPressed: () {
              // TODO: Navigate to Bus Detail screen
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Viewing $busName details...')));
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: kPrimaryColor,
              side: const BorderSide(color: kPrimaryColor),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('View'),
          ),
        ],
      ),
    );
  }
}
