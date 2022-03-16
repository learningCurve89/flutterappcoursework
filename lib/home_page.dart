import 'package:coursework_2/about_page.dart';
import 'package:coursework_2/contacts_page.dart';
import 'package:coursework_2/data/sets.dart';
import 'package:coursework_2/guide_page.dart';
import 'package:coursework_2/set_page.dart';
import 'package:flutter/material.dart';

import 'data/menu_items.dart';
import 'model/menu_item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Surya Namaskar'),
        centerTitle: true,
        backgroundColor: Colors.lightGreen.withOpacity(0.6),
        actions: [
          PopupMenuButton<MenuItem>(
            onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                    ...MenuItems.items.map(buildItem).toList(),
                  ]),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: size.height * .45,
            width: MediaQuery.of(context).size.width,
            child: const FittedBox(
              child: Icon(Icons.self_improvement_outlined),
            ),
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.1, 0.5, 0.9],
                    colors: [
                      Color(0xFFffe9bf),
                      Color(0xFFffd280),
                      Color(0xFFffb020),
                    ],
                    tileMode: TileMode.clamp),
                borderRadius: BorderRadius.circular(13),
                border: Border.all(color: Colors.lightGreen)),
          ),
          SizedBox(height: 10),
          for (final set in exerciseSets)
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          SetPage(exerciseSet: set, appBarTitle: set.name),
                    ));
                  },
                  child: Container(
                    height: size.height * .12,
                    width: size.width * .80,
                    decoration: BoxDecoration(
                        color: set.color,
                        borderRadius: BorderRadius.circular(13),
                        border: Border.all(color: Colors.lightGreen)),
                    child: Row(
                      children: [
                        IconButton(
                          alignment: Alignment.centerLeft,
                          icon: set.imageUrl,
                          padding: const EdgeInsets.all(20),
                          color: Colors.black,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SetPage(
                                  exerciseSet: set, appBarTitle: set.name),
                            ));
                          },
                        ),
                        Text(set.name, style: const TextStyle(fontSize: 25))
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            )
        ],
      ),
    );
  }

  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem<MenuItem>(
    value:item,
          child: Row(
        children: [
          Icon(
            item.icon,
            color: Colors.black,
            size:20
          ),
          const SizedBox(width: 12),
          Text(item.text),
        ],
      ));

  void onSelected(BuildContext context, MenuItem item){
    switch(item){
      case MenuItems.itemAbout:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutPage()));
        break;
      case MenuItems.itemGuide:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => GuidePage()));
        break;
      case MenuItems.itemContacts:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactsPage()));
        break;
    }
  }
}
