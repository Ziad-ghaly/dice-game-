import 'dart:math';
import 'package:flutter/material.dart';
import 'dice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Play Dice',
      debugShowCheckedModeBanner: false,
      // Bonus: Dark look from the screenshot using Brightness.dark inside ColorScheme.fromSeed
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const DiceScreen(),
    );
  }
}

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int dice1 = 1;
  int dice2 = 1;
  int total = 2;
  String imagePath = 'assets/sad.png';

  void rollDice() {
    setState(() {
      dice1 = Random().nextInt(6) + 1;
      dice2 = Random().nextInt(6) + 1;
      total = dice1 + dice2;

      if (total >= 10) {
        imagePath = 'assets/happy.png';
      } else {
        imagePath = 'assets/sad.png';
      }
    });
  }

  void reset() {
    setState(() {
      dice1 = 1;
      dice2 = 1;
      total = 2;
      imagePath = 'assets/sad.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.casino),
        title: const Text('Play Dice'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade400,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          // Total text styled using Theme.of(context).textTheme (Bonus)
          Text(
            'Total is $total',
            style: Theme.of(context).textTheme.titleMedium,
          ),

          const SizedBox(height: 40),

          // Image that changes depending on the result (happy or sad)
          Image.asset(
            imagePath,
            height: 200,
            width: 300,
            fit: BoxFit.cover,
          ),

          const SizedBox(height: 12),

          // Bonus: Show "You Win" or "You Lose" under the image
          Text(
            total >= 10 ? 'You Win' : 'You Lose',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: total >= 10 ? Colors.greenAccent : Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
          ),

          const Expanded(child: SizedBox()),

          // Row with the two Dice widgets spread evenly
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Dice(value: dice1),
              Dice(value: dice2),
            ],
          ),

          const Expanded(child: SizedBox()),

          // Row at the bottom with two buttons ('roll' and 'reset'), each taking half the width
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: rollDice,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade400,
                      foregroundColor: Colors.yellowAccent,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('roll'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: reset,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade400,
                      foregroundColor: Colors.yellowAccent,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('reset'),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

