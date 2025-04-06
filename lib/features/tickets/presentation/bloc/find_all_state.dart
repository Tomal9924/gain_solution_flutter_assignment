part of 'find_all_bloc.dart';

abstract class FindAllTicketsState extends Equatable {
  const FindAllTicketsState();

  @override
  List<Object> get props => [];
}

class FindAllTicketsInitial extends FindAllTicketsState {
  const FindAllTicketsInitial();
}

class FindAllTicketsLoading extends FindAllTicketsState {
  const FindAllTicketsLoading();
}

class FindAllTicketsError extends FindAllTicketsState {
  final Failure failure;

  const FindAllTicketsError({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}

class FindAllTicketsDone extends FindAllTicketsState {
  const FindAllTicketsDone();

  @override
  List<Object> get props => [];
}
