import '../../../../core/shared/shared.dart';
import '../../contacts.dart';

part 'find_all_event.dart';
part 'find_all_state.dart';

class FindAllContactsBloc
    extends Bloc<FindAllContactsEvent, FindAllContactsState> {
  final FindAllContactsUseCase useCase;
  FindAllContactsBloc({required this.useCase})
      : super(const FindAllContactsInitial()) {
    on<FindAllContacts>((event, emit) async {
      emit(const FindAllContactsLoading());
      final result = await useCase(
        query: event.query,
      );
      result.fold(
        (failure) => emit(FindAllContactsError(failure: failure)),
        (contacts) => emit(FindAllContactsDone(contacts: contacts)),
      );
    });
  }
}
