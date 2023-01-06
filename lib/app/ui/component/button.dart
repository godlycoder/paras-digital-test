import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paras_test/app/ui/component/text.dart';

class UiKitButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const UiKitButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            )
        )
      ),
      onPressed: onPressed,
      child: UiKitText(
        text,
        type: UiKitTextType.title3,
      )
    );
  }

}