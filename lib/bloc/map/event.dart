part of 'bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();
}

class MapEventLoadMap extends MapEvent {
  const MapEventLoadMap(this.map);

  final GameMapInterface map;

  @override
  List<Object> get props => [map];
}
