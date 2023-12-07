import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes/randomquotes/domain/entities/quotes.dart';

class QuoteCategory extends StatelessWidget {
  final Quotes quotes;

  const QuoteCategory({super.key, required this.quotes});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
              color: Colors.white54, width: 0.5)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          quotes.category,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
