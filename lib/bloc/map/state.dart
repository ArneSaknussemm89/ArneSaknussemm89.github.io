part of 'bloc.dart';

abstract class MapState extends Equatable {
  const MapState({this.errorMessage});

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}

class MapStateInitial extends MapState {
  const MapStateInitial({String errorMessage}) : super(errorMessage: errorMessage);
}

class MapStateLoaded extends MapState {
  const MapStateLoaded({String errorMessage, this.map}) : super(errorMessage: errorMessage);

  final GameMapInterface map;

  @override
  List<Object> get props => [errorMessage, map];
}
