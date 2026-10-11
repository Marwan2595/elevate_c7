import 'package:elevate_c7/core/constant/ui_strings.dart';
import 'package:elevate_c7/features/home/data/datasources/remote/home_remote_data_source_impl.dart';
import 'package:elevate_c7/features/home/data/repositories/home_repository_impl.dart';
import 'package:elevate_c7/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:elevate_c7/features/home/domain/usecases/get_products_usecase.dart';
import 'package:elevate_c7/features/home/presentation/cubit/home_view_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //run time dependency injection
    HomeViewModel viewModel = HomeViewModel(
      GetProductsUseCase(HomeRepoImpl(HomeRemoteDataSourceImpl())),
      GetCategoriesUseCase(HomeRepoImpl(HomeRemoteDataSourceImpl())),
    );

    viewModel.getProducts();

    return const Scaffold(body: Center(child: Text(UiStrings.homeScreenTitle)));
  }
}



//Hard coded strings (ui, errors, endpoints, navigation params, fromJson and toJson keys, local storage keys, )
//Hard coded colors
//Hard coded assets paths
//hard coded font families