import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

 class ServerFailures extends Failure {}
 class CacheFailures extends Failure {}
 class OfflineFailures extends Failure {}