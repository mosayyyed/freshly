import 'package:flutter/material.dart';

class RecipeStartCookingButton extends StatelessWidget {
  const RecipeStartCookingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF01937c),
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(50.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child:
            const Text('Start cooking now', style: TextStyle(fontSize: 18.0)),
      ),
    );
  }
}
