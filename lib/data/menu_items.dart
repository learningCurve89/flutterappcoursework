import 'package:flutter/material.dart';
import 'package:coursework_2/model/menu_item.dart';

class MenuItems{
  static const List<MenuItem> items = [
    itemAbout,
    itemGuide
  ];


  static const itemAbout = MenuItem(
    text: 'About',
    icon: Icons.info_outline
  );
  static const itemGuide = MenuItem(
      text: 'Guide',
      icon: Icons.arrow_forward
  );

}