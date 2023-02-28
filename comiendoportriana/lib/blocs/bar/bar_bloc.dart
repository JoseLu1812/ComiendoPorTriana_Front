import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:comiendoportriana/config/locator.dart';
import 'package:comiendoportriana/models/bar_list.dart';
import 'package:comiendoportriana/services/bar_service.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:stream_transform/stream_transform.dart';
import 'dart:async';

part 'bar_event.dart';
part 'bar_state.dart';

const throttleDuration = Duration(milliseconds: 100);
const _postLimit = 8;

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class BarBloc extends Bloc<BarEvent, BarState> {
  late final BarService _barService;

  BarBloc() : super(const BarState()) {
    _barService = getIt<BarService>();

    on<BarFetched>(
      _onBarFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onBarFetched(
    BarFetched event,
    Emitter<BarState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == BarStatus.initial) {
        final bares = await _barService.getListaBares(0);
        return emit(
          state.copyWith(
            status: BarStatus.success,
            currentPage: 0,
            bar: bares.content,
            hasReachedMax: bares.number! + 1 >= bares.totalPages!,
          ),
        );
      }
      final bares = await _barService.getListaBares(state.currentPage + 1);
      emit(
        state.copyWith(
          status: BarStatus.success,
          bar: List.of(state.bar)
                  ..addAll(bares.content!),
          hasReachedMax: bares.number! +1 >= bares.totalPages!,
          currentPage: state.currentPage + 1
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: BarStatus.failure));
    }
  }
}
