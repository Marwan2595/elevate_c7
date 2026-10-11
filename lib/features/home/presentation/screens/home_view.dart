import 'package:elevate_c7/config/di/di.dart';
import 'package:elevate_c7/core/constant/ui_strings.dart';
import 'package:elevate_c7/features/home/presentation/cubit/home_view_model.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //run time dependency injection
    HomeViewModel viewModel = getIt<HomeViewModel>();

    viewModel.getProducts();

    return const Scaffold(body: Center(child: Text(UiStrings.homeScreenTitle)));
  }
}



//Hard coded strings (ui, errors, endpoints, navigation params, fromJson and toJson keys, local storage keys, )
//Hard coded colors
//Hard coded assets paths
//hard coded font families