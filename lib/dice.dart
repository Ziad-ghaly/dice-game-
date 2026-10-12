import 'package:flutter/material.dart';

/// A [StatelessWidget] that represents an individual die.
///
/// It receives an integer [value] (from 1 to 6) through its constructor
/// and displays it as a Material [Icon].
class Dice extends StatelessWidget {
  /// The current value of the die (1 to 6).
  final int value;

  const Dice({
    super.key,
    required this.value,
  });

  /// Maps the dice number (1 through 6) to its corresponding Material Icon.
  IconData _getDiceIcon(int val) {
    switch (val) {
      case 1:
        return Icons.looks_one;
      case 2:
        return Icons.looks_two;
      case 3:
        return Icons.looks_3;
      case 4:
        return Icons.looks_4;
      case 5:
        return Icons.looks_5;
      case 6:
        return Icons.looks_6;
      default:
        return Icons.looks_one;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      _getDiceIcon(value),
      size: 100,
      color: Colors.deepPurple.shade100,
    );
  }
}
