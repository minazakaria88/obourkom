import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class DottedWidget extends StatelessWidget {
  const DottedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      width: 15,
      child: Align(
        alignment: Alignment.center,
        child: DottedLine(alignment: WrapAlignment.center),
      ),
    );
  }
}