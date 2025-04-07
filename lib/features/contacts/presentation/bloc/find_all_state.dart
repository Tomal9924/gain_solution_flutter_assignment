part of 'find_all_bloc.dart';

abstract class FindAllContactsState extends Equatable {
  const FindAllContactsState();

  @override
  List<Object> get props => [];
}

class FindAllContactsInitial extends FindAllContactsState {
  const FindAllContactsInitial();
}

class FindAllContactsLoading extends FindAllContactsState {
  const FindAllContactsLoading();
}

class FindAllContactsError extends FindAllContactsState {
  final Failure failure;

  const FindAllContactsError({required this.failure});

  @override
  List<Object> get props => [failure];
}

class FindAllContactsDone extends FindAllContactsState {
  final List<ContactsEntity> contacts;
  const FindAllContactsDone({required this.contacts});

  @override
  List<Object> get props => [];
}
