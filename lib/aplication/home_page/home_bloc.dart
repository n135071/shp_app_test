
import 'package:bloc/bloc.dart';
import 'package:shop_app/models/response_model.dart';
import '../../data/product_reposetry.dart';
import '../../models/shop_model.dart';
import 'home_event.dart';
import 'home_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc(super.initialState) {
    on<LoadProducts>(getAllProduct);
    on<AddToCart>(Add);
    on<RemoveCart>(removesCart);
  }

  List<Prudact> productLists = [];
  List<Prudact> cartLists = [];

  void getAllProduct(LoadProducts event, Emitter<ProductsState> emit) async {
    emit(ProductsLoading());
    ProductRepository productRepository = ProductRepository();
    ResponseModel responseModel = await productRepository.getProduct();
    if (responseModel.hasError) {
      emit(ProductsFailed(errorMessage: responseModel.message));
    } else {
      emit(ProductsCompleted(history: responseModel.data));
      productLists = responseModel.data;
    }
  }

  void Add(AddToCart event, Emitter<ProductsState> emit) {
    cartLists.add(event.prudact);
    emit(addCart(event.prudact));


  }

  void removesCart(RemoveCart event, Emitter<ProductsState> emit) {
    cartLists.remove(event.prudact);
    emit(removeCart(event.prudact));


  }
}
