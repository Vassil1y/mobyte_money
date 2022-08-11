import 'package:flutter/material.dart';
import 'package:mobyte_money/static_data/theme.dart';

mixin TextFieldDesignMixin {
  static final style =  AppTheme.lightText.copyWith(color: AppTheme.textColor);
  static final decoration = InputDecoration(
    hintText: "",
    hintStyle: AppTheme.lightText,

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        width: 1.5,
        color: AppTheme.textColor.withOpacity(0.5),
      ),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 1.5,
        color: AppTheme.mainColor,
      ),
    ),

    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 1.5,
        color: AppTheme.errorColor,
      ),
    ),


  );
}