import 'package:flutter/material.dart';

import '../aplication/home_page/home_bloc.dart';
import '../aplication/home_page/home_event.dart';

class CartPage extends StatelessWidget {
  const CartPage(
      {Key? key,
      required this.img,
      required this.title,
      required this.price,
      required this.productsModel,
      required this.index})
      : super(key: key);
  final String img, title;
  final double price;
  final ProductsBloc productsModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                    image: NetworkImage(img), fit: BoxFit.cover)),
          ),
          Expanded(child: Text("$title/n$price")),
          InkWell(
            onTap: () {
              productsModel.add(RemoveCart(prudact: productsModel.cartLists[index]));
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: const Icon(
                Icons.close,
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
    );

  }
}
