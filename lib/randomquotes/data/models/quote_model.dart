import 'package:quotes/randomquotes/domain/entities/quotes.dart';

class QuoteModel extends Quotes {
  QuoteModel(
      {required super.author, required super.quote, required super.category});

  factory QuoteModel.fromJson(Map<String ,dynamic >json){

    return QuoteModel(author: json['author'], quote:json['quote'],category: json['category'] );
  }

  Map<String,dynamic>toJson(){
    return{
      'author' : author,
      'quote' : quote,
      'category': category
    };
}


}
