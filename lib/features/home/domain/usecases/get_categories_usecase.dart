import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:elevate_c7/features/home/domain/repositories/home_repository.dart';

@singleton
class GetCategoriesUseCase {
  GetCategoriesUseCase(this.homeRepo);

  final HomeRepo homeRepo;

  void call() {
    log("GetCategoriesUseCase called", name: "GetCategoriesUseCase");
    homeRepo.getCategories();
  }
}
