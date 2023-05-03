

import 'package:flutter/material.dart';
import 'package:shop_app/aplication/cart_page/cart_screen.dart';

import '../aplication/home_page/home_screen.dart';

class Bottom extends StatefulWidget {
  final int currentIndex;
  const Bottom({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.grey,
      fixedColor: const Color.fromARGB(255, 36, 14, 6),
      showUnselectedLabels: false,

      elevation: 20.0,
      iconSize: 30.0,
      selectedFontSize: 15.0,
      // ignore: prefer_const_constructors
      selectedLabelStyle:
      // ignore: prefer_const_constructors
      TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),

      currentIndex: widget.currentIndex,
      onTap: (int index) {
        if (index == 0) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomePage() ));
        } else if (index == 1) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) =>const CartScreen()));
        } else {
          return;
        }
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_sharp),
          label: 'offer',
        ),
      ],
    );
  }
}