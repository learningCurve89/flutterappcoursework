import 'package:flutter/material.dart';
import 'package:coursework_2/model/menu_item.dart';

class MenuItems{
  static const List<MenuItem> items = [
    itemAbout,
    itemGuide,
    itemContacts
  ];


  static const itemAbout = MenuItem(
    text: 'About',
    icon: Icons.info_outline
  );
  static const itemGuide = MenuItem(
      text: 'Guide',
      icon: Icons.arrow_forward
  );

  static const itemContacts = MenuItem(
      text: 'Contacts',
      icon: Icons.phone
  );

}