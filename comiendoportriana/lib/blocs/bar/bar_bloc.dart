import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:comiendoportriana/models/bar.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:comiendoportriana/repositories/bar_repository.dart';
import 'dart:async';

part 'bar_event.dart';
part 'bar_state.dart';

const throttleDuration = Duration(milliseconds: 100);
var page = 0;

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class BarBloc extends Bloc<BarEvent, BarState> {
  final BarRepository _repo;

  BarBloc(BarRepository barRepository)
      : assert(barRepository != null),
        _repo = barRepository,
        super(BarState()) {
    on<BarFetched>(_onBarFetched);
  }

  Future<void> _onBarFetched(
    BarFetched event,
    Emitter<BarState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == BarStatus.initial) {
        //final posts = await _fetchPosts();
        final bar = await _repo.fetchBares();
        final List<BarContent> bares = bar.content!;
        return emit(
          state.copyWith(
            status: BarStatus.success,
            bar: bares,
            hasReachedMax: false,
          ),
        );
      }
    } catch (_) {
      emit(state.copyWith(status: BarStatus.failure));
    }
  }
}
