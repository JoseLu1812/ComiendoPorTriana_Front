part of 'bar_bloc.dart';


enum BarStatus {initial, success, failure}

class BarState extends Equatable {
  const BarState({
    this.status = BarStatus.initial,
    this.bares = const <BarContent>[],
    this.hasReachedMax = false,
  });

  final BarStatus status;
  final List<BarContent> bares;
  final bool hasReachedMax;

    BarState copyWith({
    BarStatus? status,
    List<BarContent>? bares,
    bool? hasReachedMax,
  }) {
    return BarState(
      status: status ?? this.status,
      bares: bares ?? this.bares,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''BarState { status: $status, hasReachedMax: $hasReachedMax, bares: ${bares.length} }''';
  }

  @override
  List<Object> get props => [status, bares, hasReachedMax];

}
