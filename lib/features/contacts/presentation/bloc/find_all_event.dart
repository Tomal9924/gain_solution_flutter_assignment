part of 'find_all_bloc.dart';

abstract class FindAllContactsEvent extends Equatable {
  const FindAllContactsEvent();

  @override
  List<Object> get props => [];
}

class FindAllContacts extends FindAllContactsEvent {
  final String? query;
  const FindAllContacts({required this.query});
  @override
  List<Object> get props => [];
}
