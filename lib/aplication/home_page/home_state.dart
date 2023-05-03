import 'package:equatable/equatable.dart';

import '../../models/shop_model.dart';


class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object?> get props => [];
}

class ProductsInitialState extends ProductsState {
  @override
  List<Object?> get props => [];
}

class ProductsLoading extends ProductsState {}

class ProductsCompleted extends ProductsState {
  final List history;

  const ProductsCompleted({required this.history});
}

class ProductsFailed extends ProductsState {
  final String errorMessage;

  const ProductsFailed({required this.errorMessage});
}

class addCart extends ProductsState {
  final Prudact prudact;

  const addCart(this.prudact);
  @override
  List<Object?> get props => [];
}

class removeCart extends ProductsState {
  final Prudact prudact;

  const removeCart(this.prudact);
  @override
  List<Object?> get props => [];
}
