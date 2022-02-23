import 'package:flutter/material.dart';

class RoundBorderText extends StatelessWidget {
  const RoundBorderText(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(500),
          border: Border.all(
            color: Colors.grey[700]!,
          )),
      child: Text(text),
    );
  }
}
