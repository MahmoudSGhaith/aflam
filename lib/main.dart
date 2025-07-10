import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'aflam.dart';
import 'authentication/app_services/network_services.dart';
import 'authentication/app_services/storage_service.dart';
import 'core/di/di.dart';
import 'mainLayout/data/data_source/movie_remote_data_source_impl/movie_remote_data_source_impl.dart';
import 'mainLayout/data/data_repositories/movie_repositories/movie_repositories.dart';
import 'mainLayout/data/data_repositories/movie_repositories_impl/movie_repositories_impl.dart';
import 'mainLayout/presentation/manger/movie_cubit/movies_cubit.dart';
import 'mainLayout/presentation/manger/movie_cubit/movies_details_cubit.dart';
import 'provider/language_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? token = await StorageService.getToken();
  configureDependencies();

  final movieRepository = getIt<MovieRepositories>();

  runApp(
    RepositoryProvider<MovieRepositories>(
      create: (_) => movieRepository,
      child: ChangeNotifierProvider<LanguageProvider>(
        create: (_) => LanguageProvider(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<MoviesCubit>(
              create: (_) => MoviesCubit(movieRepository),
            ),
            BlocProvider<MovieDetailsCubit>(
              create: (_) => MovieDetailsCubit(movieRepository),
            ),
          ],
          child: Aflam(token: token),
        ),
      ),
    ),
  );
}
