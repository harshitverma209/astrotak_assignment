import 'package:flutter/material.dart';

class ProcessingDialog extends StatelessWidget {
  const ProcessingDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text(
        'Processing...',
        textAlign: TextAlign.center,
      ),
      content:
          IntrinsicHeight(child: Center(child: CircularProgressIndicator())),
    );
  }
}
