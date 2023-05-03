import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/component/bottom_navigation_bar.dart';
import '../cart_page/cart_screen.dart';
import 'home_bloc.dart';
import 'home_body.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Bottom(currentIndex: 0),
      appBar: AppBar(
        leading: Container(),
        title: const Text('HomePage'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartScreen()));
              },
              icon: const Icon(Icons.add_card))
        ],
        centerTitle: true,
      ),
      body: BlocProvider<ProductsBloc>(
          create: (context) =>
              ProductsBloc(ProductsInitialState())..add(LoadProducts()),
          child: const HomeBody()),
    );
  }
}
