import 'package:equatable/equatable.dart';

class Quotes extends Equatable{

  final String author;
  final String quote;
  final String category;

   Quotes({required this.author, required this.quote,required this.category});


  @override
  // TODO: implement props
  List<Object?> get props => [author,quote,category];

}