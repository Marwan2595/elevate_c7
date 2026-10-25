import 'package:elevate_c7/config/base_response/base_response.dart';
import 'package:elevate_c7/features/home/data/models/responses/categories_response.dart';
import 'package:elevate_c7/features/home/data/models/responses/products_response.dart';
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
  Future<List<CategoryEntity>> getCategories() async {
    final CategoryResponse result = await homeRemoteDataSource.getCategories();

    return Future.value([CategoryEntity()]);
  }

  @override
  Future<BaseResponse<List<ProductEntity>>> getProducts() async {
    final BaseResponse<ProductsResponse> response = await homeRemoteDataSource
        .getProducts();

    switch (response) {
      case SuccessBaseResponse<ProductsResponse>():
        // convert all models to entities
        List<ProductEntity> productsEntities =
            response.data.productsList
                ?.map((productModel) => productModel.toDomain())
                .toList() ??
            [];
        // return SuccessBaseResponse with the list of entities
        return SuccessBaseResponse<List<ProductEntity>>(data: productsEntities);
      case ErrorBaseResponse<ProductsResponse>():
        return ErrorBaseResponse<List<ProductEntity>>.fromErrorMsg(
          response.errMessage,
        );
    }
  }
}
