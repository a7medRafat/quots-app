import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetWorkInfo{
Future<bool> get isConnected;
}


class NetWorkInfoImp implements NetWorkInfo{
  final InternetConnectionChecker internetConnectionChecker;

  NetWorkInfoImp({required this.internetConnectionChecker});
  @override

  Future<bool> get isConnected => internetConnectionChecker.hasConnection;

}