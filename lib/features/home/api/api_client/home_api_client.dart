import 'package:dio/dio.dart';
import 'package:elevate_c7/core/constant/app_endpoints.dart';
import 'package:elevate_c7/features/home/data/models/responses/categories_response.dart';
import 'package:elevate_c7/features/home/data/models/responses/products_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
part 'home_api_client.g.dart';

@lazySingleton
@RestApi()
abstract class HomeApiClient {
  @factoryMethod
  factory HomeApiClient(Dio dio) = _HomeApiClient;

  @GET(AppEndpoints.products)
  Future<ProductsResponse> getProducts();

  @GET(AppEndpoints.categories)
  Future<CategoryResponse> getCategories();
}
