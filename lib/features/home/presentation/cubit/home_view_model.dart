import 'package:bloc/bloc.dart';
import 'package:elevate_c7/config/base_response/base_response.dart';
import 'package:elevate_c7/core/constant/api_costant.dart';
import 'package:elevate_c7/features/home/domain/entities/product_entity.dart';
import 'package:elevate_c7/features/home/presentation/cubit/home_events.dart';
import 'package:elevate_c7/features/home/presentation/cubit/home_state.dart';
import 'package:injectable/injectable.dart';
import 'package:elevate_c7/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:elevate_c7/features/home/domain/usecases/get_products_usecase.dart';

//Cubit
@injectable
class HomeViewModel extends Bloc<HomeEvents, HomeState> {
  GetProductsUseCase _getProductsUseCase;
  GetCategoriesUseCase _getCategoriesUseCase;
  //State. --> object
  //Stream.--> changes of state
  HomeViewModel(this._getProductsUseCase, this._getCategoriesUseCase)
    : super(HomeState()) {
    on<GetMenProductsEvent>(_getProductsMen);
  }

  // Future<void> _getData() async {
  //   Future.wait([_getProductsMen(GetMenProductsEvent(), ), _getProductsWomen()]);
  // }

  Future<void> _getProductsMen(
    HomeEvents event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoadingMen: true, errMsgMen: null));
    final BaseResponse<List<ProductEntity>> apiResult =
        await _getProductsUseCase(categoryId: ApiConstant.menCategoryId);

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

  Future<void> _getProductsWomen() async {
    emit(
      state.copyWith(
        womenState: state.womenState?.copyWith(isLoading: true, errMsg: null),
      ),
    );
    await Future.delayed(const Duration(seconds: 3));
    final BaseResponse<List<ProductEntity>> apiResult =
        await _getProductsUseCase(categoryId: ApiConstant.womenCategoryId);

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
