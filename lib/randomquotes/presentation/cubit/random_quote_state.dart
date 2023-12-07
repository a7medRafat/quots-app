part of 'random_quote_cubit.dart';

abstract class RandomQuoteState extends Equatable {
  const RandomQuoteState();
  @override
  List<Object> get props => [];
}

class RandomQuoteInitial extends RandomQuoteState {

}


class RandomQuoteLoadingState extends RandomQuoteState{}

class RandomQuoteLoadedState extends RandomQuoteState{
  final List<Quotes> quotes;

  const RandomQuoteLoadedState({required this.quotes});
}

class RandomQuoteErrorState extends RandomQuoteState{
  final String message;

  const RandomQuoteErrorState({required this.message});
}
