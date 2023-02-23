part of 'bar_bloc.dart';

abstract class BarEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class BarFetched extends BarEvent {}
