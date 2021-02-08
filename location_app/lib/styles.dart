import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Styles {
  static final _textSizeDefault = 16.0;
  static final _textSizeLarge = 20.0;
  static final _textColorDefault = Colors.grey;
  static final _textColorLarge = Colors.black;
  static final _fontNameTitle = 'Vogue';

  static final headerLarge =
      TextStyle(
        fontSize: _textSizeLarge, 
        color: _textColorLarge);

  static final textDefault =
      TextStyle(
        fontSize: _textSizeDefault, 
        color: _textColorDefault
      );
  
  static final navBarTitle = TextStyle(
        fontFamily: _fontNameTitle,
        fontSize: _textSizeLarge, 
        color: _textColorLarge
      );
}
