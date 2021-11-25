import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class Widgets {
  static Widget textField({double shapeSize, String text, Color color}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: shapeSize,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }

  static Widget smallButton({
    Function onTap,
    String text,
    Color color,
    Size size,
  }) {
    return SizedBox(
      height: size.height * 0.05,
      width: size.width * 0.32,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: color,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          ),
          onPressed: () {
            onTap();
          },
          child: Text(
            text,
          )),
    );
  }
}
