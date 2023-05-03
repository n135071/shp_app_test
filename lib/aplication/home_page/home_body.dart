import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/component/all_products.dart';

import 'home_bloc.dart';
import 'home_state.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductsBloc productsBloc = context.read<ProductsBloc>();

    return BlocBuilder<ProductsBloc, ProductsState>(
        builder: (BuildContext context, ProductsState state) {
      if (state is ProductsFailed) {
        return Center(
          child: Text(state.errorMessage),
        );
      }
      if (state is ProductsCompleted) {
        if (state.history.isEmpty) {
          return const Text('No Products');
        }
        return ListView.builder(
            itemCount: productsBloc.productLists.length,
            itemBuilder: (BuildContext context, int index) {
              return AllProducts(
                imgUrl: productsBloc.productLists[index].image!,
                title: productsBloc.productLists[index].title!,
                price: productsBloc.productLists[index].price!.toDouble(),
                rating: productsBloc.productLists[index].rating!.rate!,
                index: index,
                productsBloc: productsBloc,
              );
            });
      } else {
        return const CircularProgressIndicator();
      }
    });
  }
}
