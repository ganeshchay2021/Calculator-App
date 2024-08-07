// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget portait;
  final Widget landscape;

  const Responsive({
    super.key,
    required this.portait,
    required this.landscape,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return landscape;
        } else {
          return portait;
        }
      },
    );
  }
}
