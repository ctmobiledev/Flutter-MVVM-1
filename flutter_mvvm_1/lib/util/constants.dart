import 'package:flutter/material.dart';

class Constants {
  //
  // NOTE: textCapitalization: TextCapitalization.words NEVER goes in TextStyle, oddly enough.
  // This is a property of TextField itself.
  //
  static TextStyle inputTextStyle = const TextStyle(fontSize: 26.0);
  static TextStyle outputTextStyle =
      const TextStyle(fontSize: 26.0, color: Colors.blue);
}
