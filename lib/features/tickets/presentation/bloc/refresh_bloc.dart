import '../../../../core/shared/shared.dart';
import '../../tickets.dart';

part 'refresh_event.dart';
part 'refresh_state.dart';

class RefreshTicketsBloc
    extends Bloc<RefreshTicketsEvent, RefreshTicketsState> {
  final RefreshTicketsUseCase useCase;
  RefreshTicketsBloc({required this.useCase})
      : super(const RefreshTicketsInitial()) {
    on<RefreshTickets>((event, emit) async {
      emit(const RefreshTicketsLoading());
      final result = await useCase();
      result.fold(
        (failure) => emit(RefreshTicketsError(failure: failure)),
        (tickets) => emit(const RefreshTicketsDone()),
      );
    });
  }
}
