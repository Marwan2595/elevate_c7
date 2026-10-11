import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:elevate_c7/features/home/domain/repositories/home_repository.dart';

@lazySingleton
class GetProductsUseCase {
  GetProductsUseCase(this.homeRepo);

  final HomeRepo homeRepo;

  void call() {
    log("GetProductsUseCase called", name: "GetProductsUseCase");
    homeRepo.getProducts();
  }
}
