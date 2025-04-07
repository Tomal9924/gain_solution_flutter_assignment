import '../../../../core/shared/shared.dart';
import '../../contacts.dart';

part 'find_event.dart';
part 'find_state.dart';

class FindContactsBloc extends Bloc<FindContactsEvent, FindContactsState> {
  final FindContactsUseCase useCase;
  FindContactsBloc({required this.useCase})
      : super(const FindContactsInitial()) {
    on<FindContacts>((event, emit) async {
      emit(const FindContactsLoading());
      final result = await useCase();
      result.fold(
        (failure) => emit(FindContactsError(failure: failure)),
        (contacts) => emit(FindContactsDone()),
      );
    });
  }
}
