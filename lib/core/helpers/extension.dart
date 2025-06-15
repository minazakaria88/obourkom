import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension  Navigation on BuildContext
{
  Future<dynamic> pushNamed(String routeName, {Object? arguments})
  {
    return Navigator.of(this).pushNamed(routeName,arguments: arguments);
  }


  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments})
  {
    return Navigator.of(this).pushReplacementNamed(routeName,arguments: arguments);
  }


  Future<dynamic> pushNamedAndRemoveUntil(String routeName,RoutePredicate newRoute,{Object? arguments})
  {
    return Navigator.of(this).pushNamedAndRemoveUntil(routeName,newRoute,arguments: arguments);
  }

  dynamic pop([dynamic result])
  {
    Navigator.of(this).pop(result);
  }

  void popUntil(String routeName)
  {
    Navigator.of(this).popUntil(ModalRoute.withName(routeName));
  }

}

extension HeightAndWidth on int
{

  SizedBox  get height=> SizedBox(height: toDouble(),);
  SizedBox get width=>SizedBox(width: toDouble(),);
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == '';
}