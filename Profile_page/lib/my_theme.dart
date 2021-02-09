import 'package:flutter/material.dart';

class MyAppThemes {
  static ThemeData appThemeLight() {
    return ThemeData(
      // Define the default brightness and colors for the overall app.
      brightness: Brightness.light,
      //appBar theme
      appBarTheme: AppBarTheme(
        //ApBar's color
        color: Colors.white,

        //Theme for AppBar's icons
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      //Theme for app's icons
      iconTheme: IconThemeData(
        color: Colors.blue,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        //White background
        backgroundColor: Colors.white,
        
        //Black plus (+) sign for FAB  
        foregroundColor: Colors.black,
      ),
    );
  }

  static ThemeData appThemeDark() {
    return ThemeData(
      // Define the default brightness and colors for the overall app.
      brightness: Brightness.dark,

      //Theme for app bar
      appBarTheme: AppBarTheme(
        //AppBar's background color is dark this time
        color: Colors.black,

        //Light color for the app bar's icons
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),

      //App's icons are colored in orange color
      iconTheme: IconThemeData(
        color: Colors.orange,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        //dark background for FAB
        backgroundColor: Colors.black,

        //White plus (+) sign for FAB  
        foregroundColor: Colors.white,
      ),
    );
  }
}
