import 'package:elevate_c7/config/base_response/base_response.dart';
import 'package:elevate_c7/features/home/data/models/responses/categories_response.dart';
import 'package:elevate_c7/features/home/data/models/responses/products_response.dart';

abstract class HomeRemoteDataSource {
  Future<BaseResponse<ProductsResponse>> getProducts();
  Future<CategoryResponse> getCategories();
}
