import 'package:flutter/material.dart';

/// The `IdWidget` is a Flutter widget representing a stylized identification card layout.
/// It includes an icon, various lines, and spaces to simulate an ID card design.

class IdWidget extends StatelessWidget {
  /// Constructs an `IdWidget`.
  ///
  /// Parameters:
  /// - `key`: An optional key to uniquely identify this widget.
  const IdWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header section with person icon
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.person_outline,
              size: 140,
              color: Colors.white.withOpacity(0.3),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  // Line representing a name field
                  Container(
                    width: 80,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Line representing another field
                  Container(
                    width: 170,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  // Two lines arranged in a row
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 60,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Line representing another field
                  Container(
                    width: 150,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Spacer(),
        // Bottom section with lines and spaces
        Container(
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        Container(
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
