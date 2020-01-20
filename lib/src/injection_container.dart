import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:pinemoji_app/src/core/network/network-info.dart';
import 'package:pinemoji_app/src/data/datasources/number_trivia_local_data_source.dart';
import 'package:pinemoji_app/src/data/datasources/number_trivia_remote_data_source.dart';
import 'package:pinemoji_app/src/data/repositories/number_trivia_repository_impl.dart';
import 'package:pinemoji_app/src/domain/repositories/number_trivia_repository.dart';
import 'package:pinemoji_app/src/presentation/blocs/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'core/util/input_converter.dart';
import 'domain/usecases/get_concrete_number_trivia.dart';
import 'domain/usecases/get_random_number_trivia.dart';

final sl = GetIt.instance;

Future<void> init() async{
  // Features - Number Trivia

  //Bloc
  sl.registerFactory(() =>
      NumberTriviaBloc(
          concrete: sl(),
          inputConverter: sl(),
          random: sl(),
      ),
  );

// Use cases
  sl.registerLazySingleton(() => GetConcreteNumberTrivia(sl()));
  sl.registerLazySingleton(() => GetRandomNumberTrivia(sl()));

  // Core
  sl.registerLazySingleton(() => InputConverter());
  // Repository
  sl.registerLazySingleton<NumberTriviaRepository>(
        () => NumberTriviaRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
// Data sources
  sl.registerLazySingleton<NumberTriviaRemoteDataSource>(
        () => NumberTriviaRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<NumberTriviaLocalDataSource>(
        () => NumberTriviaLocalDataSourceImpl(sharedPreferences: sl()),
  );

//! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
