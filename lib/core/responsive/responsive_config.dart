import 'package:final_project/core/const_data/const_data.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';


class ResponsiveConfig{
  static Widget setupResponsiveWrapper({required Widget child}){
    return ResponsiveBreakpoints.builder(
      child: child,
   breakpoints: ConstData.points,
    );
  }
}