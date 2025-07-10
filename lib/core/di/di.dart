import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/di/di.config.dart';
import 'di.config.dart';
import 'di_module.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => getIt.init();