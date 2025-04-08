part of 'find_all_bloc.dart';

abstract class FindAllFilterState extends Equatable {
  const FindAllFilterState();

  @override
  List<Object> get props => [];
}

class FindAllFilterInitial extends FindAllFilterState {
  const FindAllFilterInitial();
}

class FindAllFilterLoading extends FindAllFilterState {
  const FindAllFilterLoading();
}

class FindAllFilterError extends FindAllFilterState {
  final Failure failure;

  const FindAllFilterError({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}

class FindAllFilterDone extends FindAllFilterState {
  final List<FilterEntity> filters;
  const FindAllFilterDone({
    required this.filters,
  });

  @override
  List<Object> get props => [];
}
