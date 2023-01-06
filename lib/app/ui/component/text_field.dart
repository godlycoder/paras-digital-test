import 'package:flutter/material.dart';
import 'package:paras_test/app/ui/component/text.dart';

class UiKitTextField extends StatelessWidget {
  final Function(String) onTextChanged;
  final String hintText;
  final String? labelText;
  final UiKitTextFieldType type;
  final TextEditingController? controller;

  const UiKitTextField({
    super.key,
    required this.onTextChanged,
    required this.hintText,
    this.type = UiKitTextFieldType.text,
    this.controller,
    this.labelText
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: labelText != null,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: UiKitText(labelText ?? ''),
          )
        ),
        TextField(
          controller: controller,
          keyboardType: type == UiKitTextFieldType.number ? TextInputType.number
              : TextInputType.text,
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: hintText
          ),
          onChanged: (text) => onTextChanged(text),
          obscureText: type == UiKitTextFieldType.password,
        )
      ],
    );
  }

}

enum UiKitTextFieldType {
  text,
  password,
  number
}