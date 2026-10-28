import 'package:flutter/material.dart';

import '../main.dart';
import '../widgets/bottom_button.dart';

const Color _kCardColor = Color(0xFF1D1E33);
const Color _kInactiveCardColor = Color(0xFF111328);
const Color _kSecondaryTextColor = Color(0xFFB0BEC5);

class ResultScreen extends StatelessWidget {
  final double litres;
  final int weight;
  final int age;
  final double activityHours;

  const ResultScreen({
    super.key,
    required this.litres,
    this.weight = 70,
    this.age = 20,
    this.activityHours = 2.0,
  });

  String _getGuidanceText(double amount) {
    if (amount < 2.0) {
      return 'Low intake estimate. Spread your drinking over the day.';
    } else if (amount <= 3.0) {
      return 'Spread your drinking over the day. Needs vary.';
    } else {
      return 'Higher intake estimate due to high activity or weight.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Your Daily Water Intake',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 12.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 28,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: _kCardColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.water_drop,
                          size: 55,
                          color: kWaterColor,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          '${litres.toStringAsFixed(2)} L / Day',
                          style: const TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.0,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Estimated value\n(educational formula)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: _kSecondaryTextColor,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: _kCardColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Educational estimate only —\nnot medical advice',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: _kSecondaryTextColor,
                        height: 1.3,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: _kCardColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      _getGuidanceText(litres),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        height: 1.3,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: _kInactiveCardColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Weight: $weight kg',
                              style: const TextStyle(
                                fontSize: 14,
                                color: _kSecondaryTextColor,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Age: $age years',
                              style: const TextStyle(
                                fontSize: 14,
                                color: _kSecondaryTextColor,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Activity: ${activityHours.toStringAsFixed(activityHours.truncateToDouble() == activityHours ? 0 : 1)} h',
                          style: const TextStyle(
                            fontSize: 14,
                            color: _kSecondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            title: 'Re-calculate',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
