import 'package:flutter/material.dart';

class BottomPage2 extends StatelessWidget {
  const BottomPage2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Belum Ada Riwayat",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}