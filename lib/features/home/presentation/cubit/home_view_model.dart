import 'package:elevate_c7/config/base_response/base_response.dart';
import 'package:elevate_c7/features/home/domain/entities/product_entity.dart';
import 'package:elevate_c7/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:elevate_c7/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:elevate_c7/features/home/domain/usecases/get_products_usecase.dart';

//Cubit
@injectable
class HomeViewModel extends Cubit<HomeState> {
  GetProductsUseCase getProductsUseCase;
  GetCategoriesUseCase getCategoriesUseCase;
  //State. --> object
  //Stream.--> changes of state
  HomeViewModel(this.getProductsUseCase, this.getCategoriesUseCase)
    : super(InitialHomeState());

  void getProducts() async {
    emit(LoadingHomeState());
    final BaseResponse<List<ProductEntity>> apiResult =
        await getProductsUseCase();

    switch (apiResult) {
      case SuccessBaseResponse<List<ProductEntity>>():
        emit(SuccessHomeState(productsList: apiResult.data));
      case ErrorBaseResponse<List<ProductEntity>>():
        emit(ErrorHomeState(errMsg: apiResult.errMessage));
    }
  }
}
