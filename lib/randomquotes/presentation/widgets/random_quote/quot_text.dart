import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes/randomquotes/domain/entities/quotes.dart';

import '../../../../config/themes/app_colors.dart';

class QuoteText extends StatelessWidget {
  final Quotes quotes;

  const QuoteText({super.key, required this.quotes});

  @override
  Widget build(BuildContext context) {
    return Text(
      quotes.quote,
      maxLines: 8,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: AppColors.quotesColor
      ),
    );
  }
}
