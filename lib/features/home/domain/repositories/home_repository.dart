//interface
import 'package:elevate_c7/config/base_response/base_response.dart';
import 'package:elevate_c7/features/home/domain/entities/category_entity.dart';
import 'package:elevate_c7/features/home/domain/entities/product_entity.dart';

// HomeRepoContract
abstract class HomeRepo {
  Future<BaseResponse<List<ProductEntity>>> getProducts();
  Future<List<CategoryEntity>> getCategories();
}
//init project