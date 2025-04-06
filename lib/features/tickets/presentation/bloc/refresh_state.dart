part of 'refresh_bloc.dart';

abstract class RefreshTicketsState extends Equatable {
  const RefreshTicketsState();

  @override
  List<Object> get props => [];
}

class RefreshTicketsInitial extends RefreshTicketsState {
  const RefreshTicketsInitial();
}

class RefreshTicketsLoading extends RefreshTicketsState {
  const RefreshTicketsLoading();
}

class RefreshTicketsError extends RefreshTicketsState {
  final Failure failure;

  const RefreshTicketsError({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}

class RefreshTicketsDone extends RefreshTicketsState {
  const RefreshTicketsDone();

  @override
  List<Object> get props => [];
}
