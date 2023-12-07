import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/config/themes/app_colors.dart';
import 'package:quotes/randomquotes/presentation/cubit/random_quote_cubit.dart';
import '../../../core/utiles/aler_dialoge.dart';
import '../../../core/utiles/loading_widget.dart';
import '../widgets/random_quote/auther_name.dart';
import '../widgets/random_quote/quot_text.dart';
import '../widgets/random_quote/quote_category.dart';
import '../widgets/random_quote/random_button.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {

  int index = 0;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.randomColors[index % AppColors.randomColors.length],
        appBar: _buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  child: BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
                    builder: (context, state) {
                      if (state is RandomQuoteLoadingState) {
                        return const LoadingWidget();
                      } else if (state is RandomQuoteErrorState) {
                        return showErrorDialog(
                            msg: state.message, context: context);
                      } else if (state is RandomQuoteLoadedState) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            QuoteText(quotes: state.quotes[0]),
                            AuthorName(quotes: state.quotes[0]),
                            QuoteCategory(quotes: state.quotes[0])
                          ],
                        );
                      }
                      return const LoadingWidget();
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / 10),
                child: InkWell(
                    onTap: () {
                      BlocProvider.of<RandomQuoteCubit>(context)
                          .getRandomQuote();
                      setState(() {
                        index++;
                      });
                    },
                    child: RandomButton()),
              ),
            ],
          ),
        ));
  }

  AppBar _buildAppBar() => AppBar(
      backgroundColor: Colors.transparent,
      leading: Icon(
        CupertinoIcons.location_north_line_fill,
        color: Colors.black87,
      ),
      title: Text('Quotes App', style: Theme.of(context).textTheme.bodySmall));
}
