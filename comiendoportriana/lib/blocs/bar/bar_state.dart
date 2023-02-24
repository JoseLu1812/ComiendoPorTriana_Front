part of 'bar_bloc.dart';


enum BarStatus {initial, success, failure}

class BarState extends Equatable {
  const BarState({
    this.status = BarStatus.initial,
    this.bar = const <BarContent>[],
    this.hasReachedMax = false,
  });

  final BarStatus status;
  final List<BarContent>? bar;
  final bool hasReachedMax;

    BarState copyWith({
    BarStatus? status,
    List<BarContent>? bar,
    bool? hasReachedMax,
  }) {
    return BarState(
      status: status ?? this.status,
      bar: bar ?? this.bar,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''BarState { status: $status, hasReachedMax: $hasReachedMax }''';
  }

  @override
  List<Object> get props => [status, bar!, hasReachedMax];

}
