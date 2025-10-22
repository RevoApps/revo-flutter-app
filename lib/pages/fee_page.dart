import 'package:flutter/material.dart';

class FeePage extends StatefulWidget {
  const FeePage({super.key});

  @override
  State<FeePage> createState() => _FeePageState();
}

class _FeePageState extends State<FeePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF8E24AA),
        elevation: 4,
        shadowColor: Colors.black26,
        title: const Text(
          'Fee Management',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Fee Summary Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF27AE60), Color(0xFF2ECC71)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF27AE60).withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.account_balance_wallet,
                    color: Colors.white,
                    size: 40,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Total Fee Due',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'PKR 25,000',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Due Date: March 15, 2024',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Quick Actions
            Row(
              children: [
                Expanded(
                  child: _buildActionCard(
                    icon: Icons.payment,
                    title: 'Pay Now',
                    subtitle: 'Online Payment',
                    color: const Color(0xFF3498DB),
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildActionCard(
                    icon: Icons.receipt,
                    title: 'Fee Receipt',
                    subtitle: 'Download',
                    color: const Color(0xFF9B59B6),
                    onTap: () {},
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Fee Breakdown
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.list_alt,
                        color: Color(0xFF2C3E50),
                        size: 24,
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Fee Breakdown',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2C3E50),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildFeeItem('Tuition Fee', 'PKR 15,000', true),
                  _buildFeeItem('Library Fee', 'PKR 2,000', true),
                  _buildFeeItem('Lab Fee', 'PKR 3,000', true),
                  _buildFeeItem('Sports Fee', 'PKR 1,500', true),
                  _buildFeeItem('Transport Fee', 'PKR 3,500', false),
                  const Divider(height: 30),
                  _buildFeeItem('Total Amount', 'PKR 25,000', true, isTotal: true),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Payment History
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.history,
                        color: Color(0xFF2C3E50),
                        size: 24,
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Payment History',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2C3E50),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildPaymentHistoryItem('January 2024', 'PKR 25,000', 'Paid', true),
                  _buildPaymentHistoryItem('December 2023', 'PKR 25,000', 'Paid', true),
                  _buildPaymentHistoryItem('November 2023', 'PKR 25,000', 'Paid', true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: color,
                size: 28,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C3E50),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF7F8C8D),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeeItem(String title, String amount, bool isPaid, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: isTotal ? 16 : 14,
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
                color: isTotal ? const Color(0xFF2C3E50) : const Color(0xFF34495E),
              ),
            ),
          ),
          Row(
            children: [
              if (isPaid && !isTotal)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFF27AE60).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Paid',
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFF27AE60),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              if (isPaid && !isTotal) const SizedBox(width: 8),
              Text(
                amount,
                style: TextStyle(
                  fontSize: isTotal ? 16 : 14,
                  fontWeight: isTotal ? FontWeight.bold : FontWeight.w600,
                  color: isTotal ? const Color(0xFF2C3E50) : const Color(0xFF34495E),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentHistoryItem(String month, String amount, String status, bool isPaid) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isPaid ? const Color(0xFF27AE60).withOpacity(0.1) : const Color(0xFFE74C3C).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              isPaid ? Icons.check_circle : Icons.pending,
              color: isPaid ? const Color(0xFF27AE60) : const Color(0xFFE74C3C),
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  month,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2C3E50),
                  ),
                ),
                Text(
                  amount,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF7F8C8D),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: isPaid ? const Color(0xFF27AE60).withOpacity(0.1) : const Color(0xFFE74C3C).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              status,
              style: TextStyle(
                fontSize: 10,
                color: isPaid ? const Color(0xFF27AE60) : const Color(0xFFE74C3C),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
