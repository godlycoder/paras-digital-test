import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paras_test/app/ui/component/text.dart';

class UiKitItemMenu extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function() onClick;

  const UiKitItemMenu({super.key, required this.icon, required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Icon(icon),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: UiKitText(text, type: UiKitTextType.body1),
                )
              ],
            ),
          ),
          Container(
            width: double.maxFinite,
            height: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

}