import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  void _showComingSoonDialog(BuildContext context, String feature) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Coming Soon'),
        content: Text('$feature feature is currently under development.'),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          'My Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      AssetImage('assets/images/profile_placeholder.png'),
                ),
                SizedBox(height: 20),
                Text(
                  'Zhumakan  Aiauly',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'zhumakanaiauly@gmail.com',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          _buildProfileSection(
            context,
            title: 'My Orders',
            icon: Icons.shopping_bag,
            onTap: () => _showOrdersBottomSheet(context),
          ),
          _buildProfileSection(
            context,
            title: 'Payment Methods',
            icon: Icons.payment,
            onTap: () => _showComingSoonDialog(context, 'Payment Methods'),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.indigo),
      title: Text(title),
      trailing: Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  void _showOrdersBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'My Orders',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            _buildOrderItem('Order #1234', '\$89.99', 'Shipped'),
            _buildOrderItem('Order #5678', '\$59.99', 'Processing'),
            _buildOrderItem('Order #9012', '\$49.99', 'Delivered'),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem(String orderNumber, String total, String status) {
    return ListTile(
      title: Text(orderNumber),
      subtitle: Text(total),
      trailing: Text(
        status,
        style: TextStyle(
          color: status == 'Delivered'
              ? Colors.green
              : status == 'Processing'
                  ? Colors.orange
                  : Colors.blue,
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Logout'),
        content: Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
          ElevatedButton(
            child: Text('Logout'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[400],
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              // TODO: Implement actual logout logic
              Navigator.of(ctx).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Logged out successfully'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
