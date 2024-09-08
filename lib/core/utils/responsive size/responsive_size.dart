import 'package:flutter/material.dart';

double getResponsiveSize(BuildContext context,{required double size}){
  double scaleFactor=getScaleFactor( context);
  double responsiveFontSize=size*scaleFactor;
  double lowerLimit=size*.80;
  double upperLimit=size*.9;
  responsiveFontSize.clamp(lowerLimit, upperLimit);
  return responsiveFontSize;
}

double getResponsiveSize2(BuildContext context,{required double size}){
  double scaleFactor=getScaleFactor( context);
  double responsiveFontSize=size*scaleFactor;
  double lowerLimit=size*.4;
  double upperLimit=size*.42;
  responsiveFontSize.clamp(lowerLimit, upperLimit);
  return responsiveFontSize;
}
double getResponsiveSize3(BuildContext context,{required double size}){
  double scaleFactor=getScaleFactor( context);
  double responsiveFontSize=size*scaleFactor;
  double lowerLimit=size*.4;
  double upperLimit=size*.60;
  responsiveFontSize.clamp(lowerLimit, upperLimit);
  return responsiveFontSize;
}
double getScaleFactor(BuildContext context) {

  double width=MediaQuery.sizeOf(context).width;
  if (width< 600) {
    return  width/400;
  }
  if (width < 900) {
    return  width/700;
  } else {
    return  width/1000;
  }





}