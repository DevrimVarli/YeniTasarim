import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomStarIcon extends StatelessWidget {

  const CustomStarIcon({super.key, required this.mekanPuan});
  final String mekanPuan;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Positioned(
      top: 10,
      right: 10,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: <Widget>[
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 20,
            ),
            const SizedBox(width: 4),
            Text(
              mekanPuan,
              style: GoogleFonts.montserrat(
                fontSize: 16,
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
