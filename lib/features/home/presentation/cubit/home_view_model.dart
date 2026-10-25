import 'dart:developer';
import 'package:elevate_c7/config/base_response/base_response.dart';
import 'package:elevate_c7/features/home/domain/entities/product_entity.dart';
import 'package:injectable/injectable.dart';

import 'package:elevate_c7/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:elevate_c7/features/home/domain/usecases/get_products_usecase.dart';

//Cubit
@injectable
class HomeViewModel {
  GetProductsUseCase getProductsUseCase;
  GetCategoriesUseCase getCategoriesUseCase;

  HomeViewModel(this.getProductsUseCase, this.getCategoriesUseCase);

  void getProducts() async {
    final BaseResponse<List<ProductEntity>> apiResult =
        await getProductsUseCase();

    switch (apiResult) {
      case SuccessBaseResponse<List<ProductEntity>>():
        apiResult.data.forEach((product) {
          log(product.toString(), name: "HomeViewModel");
        });

      case ErrorBaseResponse<List<ProductEntity>>():
        log(apiResult.errMessage ?? "View Model Error");
    }
  }
}


//Dependency injection types
// Field injection
// Function injection
// Constructor injection