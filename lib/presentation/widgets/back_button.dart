import 'package:flutter/material.dart';

class BackButtonCustom extends StatelessWidget {
  final void Function()? onPressed;
  const BackButtonCustom({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BackButton(
      onPressed: onPressed ?? () => Navigator.of(context).pop(),
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(10),
        backgroundColor: Colors.white,
        elevation: 10,
        shadowColor: Colors.black.withValues(alpha: 0.2),
      ),
    );
  }
}
