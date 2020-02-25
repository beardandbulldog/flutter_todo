import 'package:flutter/material.dart';

ThemeData todayTheme(){

  TextTheme _todayTextTheme(TextTheme base){
    return base.copyWith(
        headline1: base.headline1.copyWith(
          fontFamily: 'Recoleta',
          color: Colors.pink,),
        headline2: base.headline2.copyWith(
          fontFamily: 'Recoleta',
          color: Colors.pink,),
        headline3: base.headline3.copyWith(
          fontFamily: 'Recoleta',
          fontWeight: FontWeight.w600,
            color: Color(0xFF25282B),),
        headline4: base.headline4.copyWith(
          fontFamily: 'Recoleta',
          fontWeight: FontWeight.w600,
          color: Color(0xFFC19E40),),
        headline5: base.headline5.copyWith(
          fontFamily: 'Recoleta',
          fontWeight: FontWeight.w900,
          color: Color(0x99000000),),
        headline6: base.headline6.copyWith(
          fontFamily: 'Recoleta',
          fontWeight: FontWeight.w500,
          color: Colors.red,),

        bodyText2: base.bodyText2.copyWith(
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.w400,
          color: Color(0xFF6A6A6A),),

        overline: base.overline.copyWith(
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.w800,
          color: Color(0x99000000),),

        button: base.button.copyWith(
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.w600,
          letterSpacing: 0.75,
        )
    );
  }
  final ThemeData base=ThemeData.light();
  return base.copyWith(
    textTheme: _todayTextTheme(base.textTheme),
    primaryColor: Color(0xFFFBF1EF),
      bottomSheetTheme:
      BottomSheetThemeData(
        backgroundColor: Color(0xFFFBF1EF),
      )
  );
}
