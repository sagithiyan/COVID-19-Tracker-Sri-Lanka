import 'package:coronaapp/datasource.dart';
import 'package:coronaapp/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  //appbar
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      //appbar

      fontFamily: 'Circular',
      primaryColor:primaryBlack,

    ),
    home: Homepage(),

  ));


}