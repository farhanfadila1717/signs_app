import 'package:flutter/material.dart';

class TypeChip extends StatelessWidget {
  const TypeChip({
    super.key,
    required this.type,
  });

  final String type;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: type.color,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Text(
            type.displayedType,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: type.foregoundColor,
            ),
          ),
        ),
      ),
    );
  }
}

extension on String {
  Color get color {
    switch (this) {
      case 'WARNING':
        return const Color(0xFFFFC635);
      case 'FORBIDDEN':
        return Colors.red;
    }
    return Colors.blue;
  }

  Color get foregoundColor {
    switch (this) {
      case 'FORBIDDEN':
        return Colors.white;
    }
    return Colors.black;
  }

  String get displayedType {
    switch (this) {
      case 'WARNING':
        return 'Peringatan';
      case 'FORBIDDEN':
        return 'Larangan';
    }

    return toLowerCase();
  }
}
