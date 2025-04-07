part of 'failure.dart';

class ContactsModelParseFailure extends Failure {
  ContactsModelParseFailure({
    required super.message,
    required super.stackTrace,
  });
}

class ContactsNotFoundInLocalCacheFailure extends Failure {
  ContactsNotFoundInLocalCacheFailure()
      : super(
          message: 'Contacts not found in local cache.',
        );
}
