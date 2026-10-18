import 'dart:developer';
import 'package:elevate_c7/features/home/data/models/products_response.dart';
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
  Future<List<ProductEntity>> getProducts() async {
    log("getProducts in HomeRepoImpl called", name: "HomeRepoImpl");
    final ProductsResponse result = await homeRemoteDataSource.getProducts();
    for (final product in result.data ?? []) {
      log(
        ">>>>>>>>>Product: ${product.title}, Price: ${product.price}",
        name: "HomeRepoImpl",
      );
    }

    return Future.value([ProductEntity(), ProductEntity(), ProductEntity()]);
  }
}
