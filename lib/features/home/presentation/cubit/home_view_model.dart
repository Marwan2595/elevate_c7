import 'package:elevate_c7/config/base_response/base_response.dart';
import 'package:elevate_c7/core/constant/api_costant.dart';
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
    : super(HomeState());

  Future<void> getData() async {
    Future.wait([getProductsMen(), getProductsWomen()]);
  }

  Future<void> getProductsMen() async {
    emit(state.copyWith(isLoadingMen: true, errMsgMen: null));
    final BaseResponse<List<ProductEntity>> apiResult =
        await getProductsUseCase(categoryId: ApiConstant.menCategoryId);

    switch (apiResult) {
      case SuccessBaseResponse<List<ProductEntity>>():
        emit(
          state.copyWith(productsListMen: apiResult.data, isLoadingMen: false),
        );
      case ErrorBaseResponse<List<ProductEntity>>():
        emit(
          state.copyWith(errMsgMen: apiResult.errMessage, isLoadingMen: false),
        );
    }
  }

  Future<void> getProductsWomen() async {
    emit(
      state.copyWith(
        womenState: state.womenState?.copyWith(isLoading: true, errMsg: null),
      ),
    );
    await Future.delayed(const Duration(seconds: 3));
    final BaseResponse<List<ProductEntity>> apiResult =
        await getProductsUseCase(categoryId: ApiConstant.womenCategoryId);

    switch (apiResult) {
      case SuccessBaseResponse<List<ProductEntity>>():
        emit(
          state.copyWith(
            womenState: state.womenState?.copyWith(
              isLoading: false,

              data: apiResult.data,
            ),
          ),
        );
      case ErrorBaseResponse<List<ProductEntity>>():
        emit(
          state.copyWith(
            womenState: state.womenState?.copyWith(
              isLoading: false,
              errMsg: apiResult.errMessage,
            ),
          ),
        );
    }
  }
}
