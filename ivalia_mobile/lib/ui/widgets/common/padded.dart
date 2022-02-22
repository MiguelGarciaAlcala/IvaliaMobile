import 'package:flutter/material.dart';

class PaddedWidget {
  static Padding all({required Widget child, required double padding}) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: child,
    );
  }

  static Padding horizontal({required Widget child, required double padding}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: child,
    );
  }

  static Padding vertical({required Widget child, required double padding}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: child,
    );
  }

  static Padding only({required Widget child, double right = 0, double left = 0, double top = 0, double bottom = 0}) {
    return Padding(
      padding: EdgeInsets.only(right: right, left: left, top: top, bottom: bottom),
      child: child,
    );
  }
}