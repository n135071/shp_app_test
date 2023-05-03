import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/component/bottom_navigation_bar.dart';

import '../home_page/home_bloc.dart';
import '../home_page/home_event.dart';
import '../home_page/home_state.dart';
import 'cart_body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Bottom(currentIndex: 1),
      appBar: AppBar(
        title: const Text('Cart Page'),
        centerTitle: true,
      ),
      body: BlocProvider<ProductsBloc>(
          create: (context) => ProductsBloc(ProductsInitialState()),
          child: const CartBody()),
    );
  }
}
