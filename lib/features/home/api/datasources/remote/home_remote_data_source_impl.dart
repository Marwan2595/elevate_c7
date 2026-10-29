import 'package:elevate_c7/config/base_response/base_response.dart';
import 'package:elevate_c7/features/home/api/api_client/home_api_client.dart';
import 'package:elevate_c7/features/home/data/models/responses/categories_response.dart';
import 'package:elevate_c7/features/home/data/models/responses/products_response.dart';
import 'package:injectable/injectable.dart';
import 'package:elevate_c7/features/home/data/datasources/remote/home_remote_data_source.dart';

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final HomeApiClient apiClient;

  HomeRemoteDataSourceImpl(this.apiClient);
  //ApiClient
  @override
  Future<BaseResponse<ProductsResponse>> getProducts() async {
    try {
      //Success
      final ProductsResponse response = await apiClient.getProducts();
      final successObj = SuccessBaseResponse<ProductsResponse>(data: response);
      return successObj;
    } catch (e) {
      //Error
      //Removed throw
      return ErrorBaseResponse<ProductsResponse>(errorObj: e);
    }
  }

  @override
  Future<CategoryResponse> getCategories() async {
    return await apiClient.getCategories();
  }
}
