import 'package:dartz/dartz.dart';
import 'package:quotes/randomquotes/data/models/quote_model.dart';

import '../../../core/error/failures.dart';

abstract class RandomQuotesRepository {

  Future<Either<Failure,List<QuoteModel>>> getRandomQuotes();

}
