import '../../../../core/shared/shared.dart';
import '../../tickets.dart';

part 'find_all_event.dart';
part 'find_all_state.dart';

class FindAllTicketsBloc
    extends Bloc<FindAllTicketsEvent, FindAllTicketsState> {
  final FindAllTicketsUseCase useCase;
  FindAllTicketsBloc({required this.useCase})
      : super(const FindAllTicketsInitial()) {
    on<FindAllTickets>((event, emit) async {
      emit(const FindAllTicketsLoading());
      final result = await useCase();
      result.fold(
        (failure) => emit(FindAllTicketsError(failure: failure)),
        (tickets) => emit(FindAllTicketsDone()),
      );
    });
  }
}
