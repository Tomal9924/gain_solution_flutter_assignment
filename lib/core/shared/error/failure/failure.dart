//! mason:linking-failures - DO NOT REMOVE THIS COMMENT --------------------------->
part 'filter.dart';
part 'profile.dart';
part 'contacts.dart';
part 'dashboard.dart';
part 'tickets.dart';

abstract class Failure {
  final String message;
  final StackTrace? stackTrace;

  Failure({
    required this.message,
    this.stackTrace,
  });

  @override
  String toString() => message;
}

class NoInternetFailure extends Failure {
  NoInternetFailure()
      : super(
          message: 'No internet connection.',
        );
}

class RemoteFailure extends Failure {
  RemoteFailure({
    required super.message,
  });
}
