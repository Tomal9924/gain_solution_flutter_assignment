import '../../../../core/shared/shared.dart';
import '../../filter.dart';

part 'find_all_event.dart';
part 'find_all_state.dart';

class FindAllFilterBloc extends Bloc<FindAllFilterEvent, FindAllFilterState> {
  final FindAllFilterUseCase useCase;
  FindAllFilterBloc({required this.useCase})
      : super(const FindAllFilterInitial()) {
    on<FindAllFilter>((event, emit) async {
      emit(const FindAllFilterLoading());
      final result = await useCase();
      result.fold(
        (failure) => emit(FindAllFilterError(failure: failure)),
        (filter) => emit(FindAllFilterDone()),
      );
    });
  }
}
