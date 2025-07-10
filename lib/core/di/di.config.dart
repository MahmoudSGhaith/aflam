// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../mainLayout/data/data_repositories/movie_repositories/movie_repositories.dart'
    as _i315;
import '../../mainLayout/data/data_repositories/movie_repositories_impl/movie_repositories_impl.dart'
    as _i475;
import '../../mainLayout/data/data_source/movie_remote_data_source/movie_remote_data_source.dart'
    as _i839;
import '../../mainLayout/data/data_source/movie_remote_data_source_impl/movie_remote_data_source_impl.dart'
    as _i740;
import '../../mainLayout/presentation/manger/movie_cubit/movies_cubit.dart'
    as _i347;
import 'di_module.dart' as _i211;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
    gh.lazySingleton<_i839.MovieRemoteDataSource>(
      () => _i740.MovieRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i315.MovieRepositories>(
      () => _i475.MovieRepositoriesImpl(gh<_i839.MovieRemoteDataSource>()),
    );
    gh.factory<_i347.MoviesCubit>(
      () => _i347.MoviesCubit(gh<_i315.MovieRepositories>()),
    );
    return this;
  }
}

class _$DioModule extends _i211.DioModule {}
