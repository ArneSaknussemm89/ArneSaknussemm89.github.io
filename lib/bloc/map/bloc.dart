import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bonfire/bonfire.dart';
import 'package:equatable/equatable.dart';
import 'package:thegreycouncil/bonfire/maps/game_map_interface.dart';

part 'event.dart';
part 'state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  @override
  MapState get initialState => MapStateInitial();

  @override
  Stream<MapState> mapEventToState(MapEvent event) async* {
    if (event is MapEventLoadMap) {
      yield MapStateLoaded(map: event.map);
    }
  }
}
