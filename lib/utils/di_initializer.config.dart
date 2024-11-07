// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../add_order/data/local_data_source/add_order_local_data_source.dart'
    as _i880;
import '../add_order/data/local_data_source/dio_client.dart' as _i339;
import '../add_order/data/remote_data_source/add_order_remote_data_source.dart'
    as _i689;
import '../add_order/domain/repository/add_order_repository.dart' as _i690;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i880.AddOrderLocalDataSource>(
        () => _i880.AddOrderLocalDataSource());
    gh.lazySingleton<_i339.DioClient>(() => _i339.DioClient());
    gh.lazySingleton<_i689.AddOrderRemoteDataSource>(
        () => _i689.AddOrderRemoteDataSource(dioClient: gh<_i339.DioClient>()));
    gh.lazySingleton<_i690.AddOrderRepository>(() => _i690.AddOrderRepository(
          gh<_i689.AddOrderRemoteDataSource>(),
          gh<_i880.AddOrderLocalDataSource>(),
        ));
    return this;
  }
}
