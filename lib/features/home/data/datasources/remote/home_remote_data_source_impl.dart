import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:elevate_c7/features/home/data/datasources/remote/home_remote_data_source.dart';

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  //ApiClient
  @override
  void getProducts() {
    log(
      "getProducts in HomeRemoteDataSourceImpl called",
      name: "HomeRemoteDataSourceImpl",
    );
  }

  @override
  void getCategories() {
    log(
      "getCategories in HomeRemoteDataSourceImpl called",
      name: "HomeRemoteDataSourceImpl",
    );
  }
}
