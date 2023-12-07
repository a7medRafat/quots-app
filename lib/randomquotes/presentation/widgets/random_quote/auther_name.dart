import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes/randomquotes/domain/entities/quotes.dart';

class AuthorName extends StatelessWidget {
  final Quotes quotes;

  const AuthorName({super.key,required  this.quotes});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        "- ${quotes.author}",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
