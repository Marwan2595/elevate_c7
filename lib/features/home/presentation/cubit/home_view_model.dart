import 'dart:developer';
import 'package:injectable/injectable.dart';

import 'package:elevate_c7/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:elevate_c7/features/home/domain/usecases/get_products_usecase.dart';

//Cubit
@injectable
class HomeViewModel {
  GetProductsUseCase getProductsUseCase;
  GetCategoriesUseCase getCategoriesUseCase;

  HomeViewModel(this.getProductsUseCase, this.getCategoriesUseCase);

  void getProducts() {
    log("getProducts called", name: "HomeViewModel");
    getProductsUseCase();
  }
}


//Dependency injection types
// Field injection
// Function injection
// Constructor injection