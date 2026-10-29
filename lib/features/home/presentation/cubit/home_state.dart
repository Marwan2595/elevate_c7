import 'package:elevate_c7/features/home/domain/entities/product_entity.dart';

sealed class HomeState {}

class InitialHomeState extends HomeState {}

class SuccessHomeState extends HomeState {
  List<ProductEntity> productsList;
  SuccessHomeState({required this.productsList});
}

class ErrorHomeState extends HomeState {
  String errMsg;
  ErrorHomeState({required this.errMsg});
}

class LoadingHomeState extends HomeState {}
