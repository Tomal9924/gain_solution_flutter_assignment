part of 'failure.dart';

class TicketsModelParseFailure extends Failure {
  TicketsModelParseFailure({
    required super.message,
    required super.stackTrace,
  });
}

class TicketsNotFoundInLocalCacheFailure extends Failure {
  TicketsNotFoundInLocalCacheFailure()
      : super(
          message: 'Tickets not found in local cache.',
        );
}
