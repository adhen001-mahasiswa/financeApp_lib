import 'package:flutter/material.dart';
import '../widgets/atm_card.dart';
import '../widgets/transaction_item.dart';
import '../models/transaction.dart';
import '../widgets/grid_menu_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      TransactionModel('Coffee Shop', '-Rp35.000', 'Food'),
      TransactionModel('Grab Ride', '-Rp25.000', 'Travel'),
      TransactionModel('Gym Membership', '-Rp150.000', 'Health'),
      TransactionModel('Movie Ticket', '-Rp60.000', 'Event'),
      TransactionModel('Salary', '+Rp5.000.000', 'Income'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Finance Mate',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF0F2027), // Navy gelap
                Color(0xFF203A43), // Biru keabu
                Color(0xFF2C5364), // Cyan lembut
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1C2E35), // Latar navy gelap
              Color(0xFF203A43),
              Color(0xFF2C5364),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== Title =====
              const Text(
                'My Cards',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),

              // ===== Banner Cards =====
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    AtmCard(
                      bankName: 'Bank A',
                      cardNumber: '**** 2345',
                      balance: 'Rp12.500.000',
                      color1: Color(0xFF283E51), // Indigo gelap
                      color2: Color(0xFF00B4DB), // Cyan terang
                    ),
                    AtmCard(
                      bankName: 'Bank B',
                      cardNumber: '**** 8765',
                      balance: 'Rp5.350.000',
                      color1: Color(0xFF134E5E), // Teal tua
                      color2: Color(0xFF71B280), // Hijau muda lembut
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ===== Grid Menu =====
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  GridMenuItem(
                    imagePath: 'assets/images/health.png',
                    label: 'Health',
                  ),
                  GridMenuItem(
                    imagePath: 'assets/images/travel.png',
                    label: 'Travel',
                  ),
                  GridMenuItem(
                    imagePath: 'assets/images/food.png',
                    label: 'Food',
                  ),
                  GridMenuItem(
                    imagePath: 'assets/images/event.png',
                    label: 'Event',
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // ===== Transaction List =====
              const Text(
                'Recent Transactions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return TransactionItem(transaction: transactions[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
