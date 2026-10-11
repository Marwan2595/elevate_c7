// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/home/data/datasources/remote/home_remote_data_source.dart'
    as _i261;
import '../../features/home/data/datasources/remote/home_remote_data_source_impl.dart'
    as _i157;
import '../../features/home/data/repositories/home_repository_impl.dart'
    as _i76;
import '../../features/home/domain/repositories/home_repository.dart' as _i0;
import '../../features/home/domain/usecases/get_categories_usecase.dart'
    as _i967;
import '../../features/home/domain/usecases/get_products_usecase.dart' as _i677;
import '../../features/home/presentation/cubit/home_view_model.dart' as _i175;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i261.HomeRemoteDataSource>(
      () => _i157.HomeRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i0.HomeRepo>(
      () => _i76.HomeRepoImpl(gh<_i261.HomeRemoteDataSource>()),
    );
    gh.lazySingleton<_i677.GetProductsUseCase>(
      () => _i677.GetProductsUseCase(gh<_i0.HomeRepo>()),
    );
    gh.singleton<_i967.GetCategoriesUseCase>(
      () => _i967.GetCategoriesUseCase(gh<_i0.HomeRepo>()),
    );
    gh.factory<_i175.HomeViewModel>(
      () => _i175.HomeViewModel(
        gh<_i677.GetProductsUseCase>(),
        gh<_i967.GetCategoriesUseCase>(),
      ),
    );
    return this;
  }
}
