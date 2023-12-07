import 'dart:convert';

import 'package:quotes/randomquotes/data/models/quote_model.dart';
import '../../../../core/error/exceptions.dart';
import 'package:http/http.dart' as http;

import '../../../../core/utiles/utiles.dart';

abstract class RandomQuotesRemoteDataSource {

  RandomQuotesRemoteDataSource();
  Future<List<QuoteModel>> getRandomQuote();
}

class RandomQuotesRemoteDataSourceImpl extends RandomQuotesRemoteDataSource {
final http.Client client;

  RandomQuotesRemoteDataSourceImpl({required this.client});

  @override
  Future<List<QuoteModel>> getRandomQuote() async {
    final response = await client.get(Uri.parse("$BASE_URL/quotes/"),
        headers: {
      "Content-Type": "application/json",
       "X-Api-Key"  : "JaxEVG9MEDEUYtVPU850fg==44VCXVB7jmoFKtFB"
    });

    if (response.statusCode == 200) {
      final List decodeJson = jsonDecode(response.body);
      List<QuoteModel> quoteModel =
          decodeJson.map<QuoteModel>((e) => QuoteModel.fromJson(e)).toList();
      return quoteModel;
    } else {
      throw ServerException();
    }
  }
}
