
import 'package:flutter/material.dart';

import '../../../constants/themes/light_color.dart';
import 'package:recipe_cook_book/ui/views/home/widgets/extentions.dart';

class AppBarCustomIcon extends StatelessWidget {
  const AppBarCustomIcon({
    Key key,
    @required this.icon,
    @required this.color,
    @required this.size,
    @required this.padding,
    @required this.isOutLine,
    @required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final Color color;
  final double size;
  final double padding;
  final bool isOutLine;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      padding: EdgeInsets.all(padding),
      // margin: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        border: Border.all(
            color: LightColor.iconColor,
            style: isOutLine ? BorderStyle.solid : BorderStyle.none),
        borderRadius: BorderRadius.all(Radius.circular(13)),
        color:
            Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Color(0xffe8e8e8),
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(5, 0)),
        ],
      ),
      child: Icon(icon, color: color, size: size),
    ).ripple(() {
      if (onPressed != null) {
        onPressed();
      }
    }, borderRadius: BorderRadius.all(Radius.circular(13)));
  }
}
