import 'dart:developer';

import 'package:elevate_c7/config/di/di.dart';
import 'package:elevate_c7/features/home/presentation/cubit/home_state.dart';
import 'package:elevate_c7/features/home/presentation/cubit/home_view_model.dart';
import 'package:elevate_c7/features/home/presentation/widgets/products_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeViewModel>(
      create: (context) => getIt<HomeViewModel>()..getProducts(),
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 16),
            children: [
              // BlocBuilder<HomeViewModel, HomeState>(
              //   builder: (context, state) {
              //     switch (state) {
              //       case InitialHomeState():
              //       case LoadingHomeState():
              //         return Center(child: CircularProgressIndicator());

              //       case SuccessHomeState():
              //         return ProductsList(
              //           title: "Home Appliance",
              //           products: state.productsList,
              //         );
              //       case ErrorHomeState():
              //         return Center(child: Text(state.errMsg));
              //     }
              //   },
              // buildWhen: (previous, current) => previous is LoadingHomeState,
              // ),

              // BlocListener<HomeViewModel, HomeState>(
              //   listener: (context, state) {
              //     if (state is ErrorHomeState) {
              //       ScaffoldMessenger.of(
              //         context,
              //       ).showSnackBar(SnackBar(content: Text(state.errMsg)));
              //     }
              //   },
              //   child: Container(),
              // listenWhen: (previous, current) => current is ErrorHomeState,
              // ),
              BlocConsumer<HomeViewModel, HomeState>(
                builder: (context, state) {
                  log(">>>>>>>>>>>>>>>>>>>builder Rebuild UI");
                  switch (state) {
                    case InitialHomeState():
                    case LoadingHomeState():
                      return const Center(child: CircularProgressIndicator());

                    case SuccessHomeState():
                      return ProductsList(
                        title: "Home Appliance",
                        products: state.productsList,
                      );
                    case ErrorHomeState():
                      return Center(child: Text(state.errMsg));
                  }
                },
                listener: (context, state) {
                  log(">>>>>>>>>>>>>>>>>>>listener ");
                  if (state is ErrorHomeState) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.errMsg)));
                  }
                },
                // buildWhen: (previous, current) => previous is LoadingHomeState,
                // listenWhen: (previous, current) => current is ErrorHomeState,
              ),
              const SizedBox(height: 50),
              Text("Ay Haga"),
              BlocConsumer<HomeViewModel, HomeState>(
                builder: (context, state) {
                  log(">>>>>>>>>>>>>>>>>>>builder Rebuild UI");
                  switch (state) {
                    case InitialHomeState():
                    case LoadingHomeState():
                      return const Center(child: CircularProgressIndicator());

                    case SuccessHomeState():
                      return ProductsList(
                        title: "Home Appliance",
                        products: state.productsList,
                      );
                    case ErrorHomeState():
                      return Center(child: Text(state.errMsg));
                  }
                },
                listener: (context, state) {
                  log(">>>>>>>>>>>>>>>>>>>listener ");
                  if (state is ErrorHomeState) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.errMsg)));
                  }
                },
                // buildWhen: (previous, current) => previous is LoadingHomeState,
                // listenWhen: (previous, current) => current is ErrorHomeState,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// BlocProvider

// BlocBuilder. --> update ui when state changes
// BlocListener.--> trigger action depend on state changes
// BlocConsumer --> BlocBuilder + BlocListener

// BlocSelector
// BlocObserver

// View linked to a ViewModel. --> BlocProvider
// Call getProducts Function. -->. ..getProducts()
// Rebuild UI depend on state changes (UI Listens to state Changes)

//Hard coded strings (ui, errors, endpoints, navigation params, fromJson and toJson keys, local storage keys, )
//Hard coded colors
//Hard coded assets paths
//hard coded font families
