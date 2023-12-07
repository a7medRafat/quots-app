import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:quotes/core/dio_helper/dio_helper.dart';
import 'package:quotes/core/error/exceptions.dart';
import 'package:quotes/core/error/failures.dart';
import 'package:quotes/randomquotes/data/models/quote_model.dart';
import 'package:quotes/randomquotes/domain/repositories/random_quotes_repository.dart';
import '../../../core/network/network.dart';
import '../datasources/local/random_quotes_local_data_source.dart';
import '../datasources/remote/random_quotes_remote_data_source.dart';

class RandomQuotesRepositoryImpl extends RandomQuotesRepository {
  final NetWorkInfo netWorkInfo;
  final RandomQuotesRemoteDataSource remoteDataSource;
  final RandomQuotesLocalDataSource localDataSource;

  RandomQuotesRepositoryImpl(
      {required this.netWorkInfo,required this.remoteDataSource,required this.localDataSource});

  @override
  Future<Either<Failure,List<QuoteModel>>> getRandomQuotes() async {
    if (await netWorkInfo.isConnected) {
      try {
        final remoteQuote = await remoteDataSource.getRandomQuote();
        localDataSource.cachesQuote(remoteQuote);
        return right(remoteQuote);
      } on ServerException {
        return left(ServerFailures());
      }
    } else {
      try {
        final localQuot = await localDataSource.getCachedQuote();
        localDataSource.cachesQuote(localQuot);
        return right(localQuot);
      } on EmptyCacheException {
        return left(CacheFailures());
      }
    }
  }
}
