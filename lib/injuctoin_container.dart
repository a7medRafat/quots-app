import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quotes/core/network/network.dart';
import 'package:quotes/randomquotes/data/datasources/local/random_quotes_local_data_source.dart';
import 'package:quotes/randomquotes/data/datasources/remote/random_quotes_remote_data_source.dart';
import 'package:quotes/randomquotes/data/repositories/random_quotes_repository_impl.dart';
import 'package:quotes/randomquotes/domain/repositories/random_quotes_repository.dart';
import 'package:quotes/randomquotes/domain/usecases/get_random_quote_usecase.dart';
import 'package:quotes/randomquotes/presentation/cubit/random_quote_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

GetIt sl=GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => RandomQuoteCubit(randomQuoteUseCase: sl()));

  sl.registerLazySingleton(
      () => GetRandomQuoteUseCase(randomQuotesRepository: sl()));

  sl.registerLazySingleton<RandomQuotesRepository>(() =>
      RandomQuotesRepositoryImpl(
          netWorkInfo: sl(), remoteDataSource: sl(), localDataSource: sl()));

  sl.registerLazySingleton<RandomQuotesRemoteDataSource>(() => RandomQuotesRemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton<RandomQuotesLocalDataSource>(() =>RandomQuotesLocalDataSourceImpl(sharedPreferences: sl()));


  sl.registerLazySingleton<NetWorkInfo>(() => NetWorkInfoImp(internetConnectionChecker: sl()));
  //External

  sl.registerSingletonAsync<SharedPreferences>(
          () => SharedPreferences.getInstance());
  await sl.isReady<SharedPreferences>();

  sl.registerLazySingleton(() => LogInterceptor(
    request: true,
    requestBody: true,
    requestHeader: true,
    responseBody: true,
    responseHeader: true,
    error: true
  ));


  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());

}

