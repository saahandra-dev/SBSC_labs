import 'package:flutter/material.dart';

class SubHeader extends StatelessWidget {
  final String subtitle;
  const SubHeader({
    Key? key, required this.subtitle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(subtitle,
        style: TextStyle(
            color: Color(0xff9d9ab4),
            fontSize: 13.0,
            fontWeight: FontWeight.w500
        )
    );
  }
}