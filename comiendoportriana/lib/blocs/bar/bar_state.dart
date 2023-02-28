part of 'bar_bloc.dart';


enum BarStatus {initial, success, failure}

class BarState extends Equatable {
  const BarState({
    this.status = BarStatus.initial,
    this.bar = const <BarContent>[],
    this.hasReachedMax = false,
    this.currentPage = 0
  });

  final BarStatus status;
  final List<BarContent> bar;
  final bool hasReachedMax;
  final int currentPage;

    BarState copyWith({
    BarStatus? status,
    List<BarContent>? bar,
    bool? hasReachedMax,
    int? currentPage
  }) {
    return BarState(
      status: status ?? this.status,
      bar: bar ?? this.bar,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      currentPage: currentPage ?? this.currentPage
    );
  }

  @override
  String toString() {
    return '''BarState { status: $status, hasReachedMax: $hasReachedMax }''';
  }

  @override
  List<Object> get props => [status, bar, hasReachedMax, currentPage];

}
