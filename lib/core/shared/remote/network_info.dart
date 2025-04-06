import '../shared.dart';

abstract class NetworkInfo {
  Future<bool> get online;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker internetConnectionChecker;

  NetworkInfoImpl({required this.internetConnectionChecker});

  @override
  Future<bool> get online async =>
      await internetConnectionChecker.hasConnection;

  List<AddressCheckOption> get addresses => internetConnectionChecker.addresses;

  Duration get checkInterval => internetConnectionChecker.checkInterval;

  Duration get checkTimeout => internetConnectionChecker.checkTimeout;

  Future<InternetConnectionStatus> get connectionStatus =>
      internetConnectionChecker.connectionStatus;

  Future<bool> get hasConnection => internetConnectionChecker.hasConnection;

  bool get hasListeners => internetConnectionChecker.hasListeners;

  Future<AddressCheckResult> isHostReachable(AddressCheckOption options) =>
      internetConnectionChecker.isHostReachable(options);

  Stream<InternetConnectionStatus> get onStatusChange =>
      internetConnectionChecker.onStatusChange;
}
