import 'package:elevate_c7/config/base_state/base_state.dart';
import 'package:elevate_c7/features/home/domain/entities/product_entity.dart';

class HomeState {
  //Men State
  bool isLoadingMen = false;
  String? errMsgMen;
  List<ProductEntity> productsListMen = [];

  //Women State
  BaseState<List<ProductEntity>>? womenState;

  HomeState({
    this.isLoadingMen = false,
    this.errMsgMen,
    this.productsListMen = const [],
    this.womenState,
  }) {
    womenState =
        womenState ??
        BaseState<List<ProductEntity>>(
          isLoading: false,
          errMsg: null,
          data: [],
        );
  }

  HomeState copyWith({
    bool? isLoadingMen,
    String? errMsgMen,
    List<ProductEntity>? productsListMen,
    BaseState<List<ProductEntity>>? womenState,
  }) {
    return HomeState(
      isLoadingMen: isLoadingMen ?? this.isLoadingMen,
      errMsgMen: errMsgMen ?? this.errMsgMen,
      productsListMen: productsListMen ?? this.productsListMen,
      womenState: womenState ?? this.womenState,
    );
  }
}

// sealed class HomeState {}

// class InitialHomeState extends HomeState {}

// class SuccessHomeState extends HomeState {
//   List<ProductEntity> productsList;
//   SuccessHomeState({required this.productsList});
// }

// class ErrorHomeState extends HomeState {
//   String errMsg;
//   ErrorHomeState({required this.errMsg});
// }

// class LoadingHomeState extends HomeState {}
