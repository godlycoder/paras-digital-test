import 'package:flutter/cupertino.dart';

class UiKitText extends StatelessWidget {
  final String text;
  final UiKitTextType? type;
  final bool isEllipsized;
  const UiKitText(this.text, {super.key, this.type, this.isEllipsized = true});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      overflow: isEllipsized ? TextOverflow.ellipsis : null,
      style: TextStyle(
        fontSize: type?.size,
        fontWeight: type?.weight,
      ),
    );
  }

}

enum UiKitTextType {
  header1(34, FontWeight.w700),
  header2(24, FontWeight.w700),
  header3(16, FontWeight.w700),
  header4(16, FontWeight.w700),
  body1(16, FontWeight.w400),
  body2(14, FontWeight.w400),
  title1(18, FontWeight.w600),
  title2(16, FontWeight.w600),
  title3(14, FontWeight.w600),
  title4(12, FontWeight.w600),
  subtitle1(14, FontWeight.w400),
  subtitle2(12, FontWeight.w400),
  subtitle3(10, FontWeight.w400),
  caption1(14, FontWeight.w300),
  caption2(12, FontWeight.w300),
  caption3(10, FontWeight.w300);

  const UiKitTextType(this.size, this.weight);
  final double size;
  final FontWeight weight;
}