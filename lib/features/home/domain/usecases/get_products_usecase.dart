import 'package:elevate_c7/config/base_response/base_response.dart';
import 'package:elevate_c7/features/home/domain/entities/product_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:elevate_c7/features/home/domain/repositories/home_repository.dart';

@lazySingleton
class GetProductsUseCase {
  GetProductsUseCase(this.homeRepo);

  final HomeRepo homeRepo;

  Future<BaseResponse<List<ProductEntity>>> call() async {
    return await homeRepo.getProducts();
  }
}
