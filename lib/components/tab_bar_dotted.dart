import 'package:flutter/material.dart';

class TabBarDotted extends StatelessWidget {
  final String title;

  const TabBarDotted({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
          const SizedBox(height: 5),
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 1.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
