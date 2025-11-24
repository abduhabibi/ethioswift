import 'package:flutter/material.dart';
import 'package:ethio_swift/widgets/common/app_drawer.dart';
import 'package:ethio_swift/main.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wallet')),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TODO: Balance should be fetched using a FutureBuilder
            _buildBalanceCard(context, balance: '540.50'), 
            const SizedBox(height: 24),
            const Text('Quick Actions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kTextColor)),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActionButton(context, Icons.account_balance_wallet, 'Top Up'),
                _buildActionButton(context, Icons.history, 'History'),
                _buildActionButton(context, Icons.receipt_long, 'Statements'),
              ],
            ),
            const SizedBox(height: 32),
            const Text('Recent Transactions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kTextColor)),
            const SizedBox(height: 12),
            // TODO: Transactions should be fetched using a FutureBuilder
            _buildTransactionItem('Bus Fare - Bole', '-ETB 10.00', '23 Nov, 10:30 AM', Icons.directions_bus, Colors.red.shade400),
            _buildTransactionItem('Wallet Top Up', '+ETB 500.00', '23 Nov, 10:00 AM', Icons.add_circle, kPrimaryColor),
            _buildTransactionItem('Bus Fare - Piazza', '-ETB 12.00', '22 Nov, 05:45 PM', Icons.directions_bus, Colors.red.shade400),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceCard(BuildContext context, {required String balance}) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: kPrimaryColor.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Current Balance', style: TextStyle(color: Colors.white70, fontSize: 16)),
          const SizedBox(height: 8),
          Text(
            'ETB $balance',
            style: const TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          TextButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Manage payment methods...')));
            },
            icon: const Icon(Icons.payment, color: Colors.white),
            label: const Text('Manage Payment Methods', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, IconData icon, String label) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$label clicked')));
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: kLightGrey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: kPrimaryColor, size: 30),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 14, color: kTextColor)),
      ],
    );
  }

  Widget _buildTransactionItem(String title, String amount, String date, IconData icon, Color iconBg) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: iconBg.withOpacity(0.1),
            child: Icon(icon, color: iconBg, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w600, color: kTextColor)),
                Text(date, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
              ],
            ),
          ),
          Text(amount, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: amount.startsWith('+') ? kPrimaryColor : Colors.red)),
        ],
      ),
    );
  }
}
