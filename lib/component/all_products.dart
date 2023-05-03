import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../aplication/home_page/home_bloc.dart';
import '../aplication/home_page/home_event.dart';
import '../aplication/home_page/home_state.dart';

class AllProducts extends StatelessWidget {
  const AllProducts(
      {super.key,
      required this.imgUrl,
      required this.title,
      required this.price,
      required this.rating,
      required this.index,
      required this.productsBloc});

  final String imgUrl, title;
  final double price, rating;

  final ProductsBloc productsBloc;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (BuildContext context,ProductsState state){
      return Container(
          margin: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 200,
                width: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imgUrl),
                      //fit: BoxFit.cover
                    )),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(fontSize: 20),
                      )),
                  Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(16)),
                      child: Text(
                        rating.toString(),
                        style: const TextStyle(fontSize: 14),
                      )),
                ],
              ),
              productsBloc.cartLists.contains(productsBloc.productLists[index])
                  ? ElevatedButton(
                  onPressed: () {
                    context.read<ProductsBloc>().add(
                      RemoveCart(
                          prudact: productsBloc.productLists[index]
                      ),
                    );
                  },
                  child: const Text("Added"))
                  : ElevatedButton(
                  onPressed: () {
                    context.read<ProductsBloc>().add(
                      AddToCart(
                          prudact: productsBloc.productLists[index]
                      ),
                    );
                  },
                  child: const Text("Add to cart"),
              ),
              Row(
                children: [
                  Text(
                    "price: ${price.toString()}",
                    style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.favorite_border))
                ],
              ),
            ],
          ),
        );
      },

    );
  }
}
