import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:elevate_c7/features/home/data/datasources/remote/home_remote_data_source.dart';
import 'package:elevate_c7/features/home/domain/entities/category_entity.dart';
import 'package:elevate_c7/features/home/domain/entities/product_entity.dart';
import 'package:elevate_c7/features/home/domain/repositories/home_repository.dart';

@LazySingleton(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl(this.homeRemoteDataSource);
  HomeRemoteDataSource homeRemoteDataSource;

  @override
  Future<List<CategoryEntity>> getCategories() {
    return Future.value([CategoryEntity()]);
  }

  @override
  Future<List<ProductEntity>> getProducts() {
    log("getProducts in HomeRepoImpl called", name: "HomeRepoImpl");
    homeRemoteDataSource.getProducts();

    return Future.value([ProductEntity(), ProductEntity(), ProductEntity()]);
  }
}
