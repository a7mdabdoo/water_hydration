import 'package:flutter/material.dart';
import 'package:water_hydration/main.dart';

import '../widgets/gender_card.dart';
import '../widgets/counter_card.dart';
import '../widgets/bottom_button.dart';
import '../utils/water_calculator.dart';
import 'result_screen.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  String selectedGender = 'male';
  double activityHours = 2.0;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Icon(Icons.water_drop, color: kWaterColor, size: 28),
        ),
        title: const Text(
          'Water Tracker',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                GenderCard(
                  icon: Icons.male,
                  label: 'MALE',
                  isSelected: selectedGender == 'male',
                  onTap: () {
                    setState(() {
                      selectedGender = 'male';
                    });
                  },
                ),
                const SizedBox(width: 16),
                GenderCard(
                  icon: Icons.female,
                  label: 'FEMALE',
                  isSelected: selectedGender == 'female',
                  onTap: () {
                    setState(() {
                      selectedGender = 'female';
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'ACTIVITY (hours/day)',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                          letterSpacing: 1.2,
                        ),
                      ),
                      Text(
                        '${activityHours.toInt()} h',
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: kWaterColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Slider(
                    value: activityHours,
                    min: 0.0,
                    max: 8.0,
                    divisions: 8,
                    activeColor: kWaterColor,
                    inactiveColor: Colors.white24,
                    onChanged: (newValue) {
                      setState(() {
                        activityHours = newValue;
                      });
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '0',
                          style: TextStyle(color: Colors.white38, fontSize: 14),
                        ),
                        Text(
                          '8',
                          style: TextStyle(color: Colors.white38, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                CounterCard(
                  label: 'WEIGHT (kg)',
                  value: weight,
                  onIncrement: () {
                    if (weight < 200) {
                      setState(() {
                        weight++;
                      });
                    }
                  },
                  onDecrement: () {
                    if (weight > 30) {
                      setState(() {
                        weight--;
                      });
                    }
                  },
                ),
                const SizedBox(width: 16),
                CounterCard(
                  label: 'AGE (years)',
                  value: age,
                  onIncrement: () {
                    if (age < 100) {
                      setState(() {
                        age++;
                      });
                    }
                  },
                  onDecrement: () {
                    if (age > 10) {
                      setState(() {
                        age--;
                      });
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomButton(
        title: 'Calculate Water Intake',
        onTap: () {
          final double litres = calculateWaterLitres(
            weightKg: weight,
            activityHours: activityHours,
          );

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultScreen(
                litres: litres,
                weight: weight,
                age: age,
                activityHours: activityHours,
              ),
            ),
          );
        },
      ),
    );
  }
}
