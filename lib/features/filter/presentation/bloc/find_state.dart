part of 'find_bloc.dart';

abstract class FindFilterState extends Equatable {
  const FindFilterState();

  @override
  List<Object> get props => [];
}

class FindFilterInitial extends FindFilterState {
  const FindFilterInitial();
}

class FindFilterLoading extends FindFilterState {
  const FindFilterLoading();
}

class FindFilterError extends FindFilterState {
  final Failure failure;

  const FindFilterError({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}

class FindFilterDone extends FindFilterState {
  const FindFilterDone();

  @override
  List<Object> get props => [];
}
