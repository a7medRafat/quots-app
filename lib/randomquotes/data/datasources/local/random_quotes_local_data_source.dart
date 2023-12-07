import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:quotes/randomquotes/data/models/quote_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';

abstract class RandomQuotesLocalDataSource {
  Future<Unit> cachesQuote(List<QuoteModel> quoteModel);

  Future<List<QuoteModel>> getCachedQuote();
}

class RandomQuotesLocalDataSourceImpl extends RandomQuotesLocalDataSource {
  final SharedPreferences sharedPreferences;

  RandomQuotesLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> cachesQuote(List<QuoteModel> quoteModel) {
    List quoteModelToJson =
        quoteModel.map<Map<String, dynamic>>((e) => e.toJson()).toList();

    sharedPreferences.setString('cachedQuote', json.encode(quoteModelToJson));
    return Future.value(unit);
  }

  @override
  Future<List<QuoteModel>> getCachedQuote() {
    final jsonString = sharedPreferences.getString('cachedQuote');
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<QuoteModel> jsonToQuoteModel = decodeJsonData.map((e) => QuoteModel.fromJson(e)).toList();
      return Future.value(jsonToQuoteModel);
    } else {
      throw EmptyCacheException();
    }
  }
}
