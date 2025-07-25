import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomTextSignUp extends StatelessWidget {
  const CustomTextSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:12),
      child: Column(
        children: <Widget>[
          Text("Let's Get Started",style: GoogleFonts.montserrat(fontSize: 24,fontWeight: FontWeight.bold)),
          Text('Create an account on MNZL to get all features',style: GoogleFonts.montserrat(fontSize: 14,fontWeight: FontWeight.bold,color:colorScheme.onSurfaceVariant.withValues(alpha: 0.7) )),
        ],
      ),
    );
  }
}
