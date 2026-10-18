import 'dart:developer';
import 'package:elevate_c7/features/home/api/api_client/home_api_client.dart';
import 'package:elevate_c7/features/home/data/models/products_response.dart';
import 'package:injectable/injectable.dart';
import 'package:elevate_c7/features/home/data/datasources/remote/home_remote_data_source.dart';

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final HomeApiClient apiClient;

  HomeRemoteDataSourceImpl(this.apiClient);
  //ApiClient
  @override
  Future<ProductsResponse> getProducts() async {
    log(
      "getProducts in HomeRemoteDataSourceImpl called",
      name: "HomeRemoteDataSourceImpl",
    );
    return await apiClient.getProducts();
  }

  @override
  void getCategories() {
    log(
      "getCategories in HomeRemoteDataSourceImpl called",
      name: "HomeRemoteDataSourceImpl",
    );
  }
}
