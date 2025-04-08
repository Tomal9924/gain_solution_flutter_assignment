import '../../../../core/shared/shared.dart';
import '../../filter.dart';

part 'find_event.dart';
part 'find_state.dart';

class FindFilterBloc extends Bloc<FindFilterEvent, FindFilterState> {
  final FindFilterUseCase useCase;
  FindFilterBloc({required this.useCase}) : super(const FindFilterInitial()) {
    on<FindFilter>((event, emit) async {
      emit(const FindFilterLoading());
      final result = await useCase();
      result.fold(
        (failure) => emit(FindFilterError(failure: failure)),
        (filter) => emit(const FindFilterDone()),
      );
    });
  }
}
