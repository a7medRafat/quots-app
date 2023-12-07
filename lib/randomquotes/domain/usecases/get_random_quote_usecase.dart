 import 'package:dartz/dartz.dart';
import 'package:quotes/randomquotes/data/models/quote_model.dart';
import 'package:quotes/randomquotes/domain/repositories/random_quotes_repository.dart';
import '../../../core/error/failures.dart';

class GetRandomQuoteUseCase {
  final RandomQuotesRepository randomQuotesRepository;

  GetRandomQuoteUseCase({required this.randomQuotesRepository});

  Future<Either<Failure,List<QuoteModel>>> call()async{
      return await randomQuotesRepository.getRandomQuotes();
   }

 }