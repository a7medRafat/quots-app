import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:quotes/randomquotes/domain/entities/quotes.dart';

import '../../../core/error/failures.dart';
import '../../../core/failures_messages/failures_string.dart';
import '../../domain/usecases/get_random_quote_usecase.dart';
part 'random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {

  final GetRandomQuoteUseCase randomQuoteUseCase;

  RandomQuoteCubit({required this.randomQuoteUseCase}) : super(RandomQuoteInitial());

  Future<Unit> getRandomQuote ()async{
    emit(RandomQuoteLoadingState());
    Either<Failure, List<Quotes>> response = await randomQuoteUseCase.call();

    response.fold(
            (failure) => emit(RandomQuoteErrorState(message: _failureMessage(failure))),
            (quote) => emit(RandomQuoteLoadedState(quotes: quote))
    );
    return Future.value(unit);
  }

  String _failureMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailures:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailures:
        return EMPTY_CACHED_FAILURE_MESSAGE;
      case OfflineFailures:
        return OFLINE_FAILURE_MESSAGE;
      default:
        return 'unexpected error';
    }
  }

}
