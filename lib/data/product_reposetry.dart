import 'package:dio/dio.dart';

import '../models/response_model.dart';
import '../models/shop_model.dart';

class ProductRepository {
  Dio dio = Dio();

  Future<ResponseModel<List<Prudact>>> getProduct() async {
    try {
      var response = await dio.get('https://fakestoreapi.com/products');
      List<Prudact> allPrudact = [];
      for (var i in response.data) {
        allPrudact.add(Prudact.fromJson(i));
      }
      return ResponseModel.complete(data: allPrudact);
    }/* on DioError catch (e) {
      String message =
          e.response == null ? e.message : e.response!.data['detail'];
      if (e.type == DioErrorType.values) {
        return ResponseModel.withError(message: message);
      }
      return ResponseModel.withError(message: message);
    }*/ on Exception catch (e) {
      return ResponseModel.withError(message: e.toString());
    }
  }
}
