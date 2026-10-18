import 'package:elevate_c7/features/home/data/models/products_response.dart';

abstract class HomeRemoteDataSource {
  Future<ProductsResponse> getProducts();
  void getCategories();
}
