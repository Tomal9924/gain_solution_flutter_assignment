part of 'find_bloc.dart';

abstract class FindContactsState extends Equatable {
  const FindContactsState();

  @override
  List<Object> get props => [];
}

class FindContactsInitial extends FindContactsState {
  const FindContactsInitial();
}

class FindContactsLoading extends FindContactsState {
  const FindContactsLoading();
}

class FindContactsError extends FindContactsState {
  final Failure failure;

  const FindContactsError({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}

class FindContactsDone extends FindContactsState {
  const FindContactsDone();

  @override
  List<Object> get props => [];
}
