import 'package:bonfire/bonfire.dart';
import 'package:equatable/equatable.dart';

abstract class GameMapInterface extends Equatable {
  MapWorld map() => MapWorld([]);
  List<GameDecoration> decorations() => [];
  List<Enemy> enemies() => [];

  @override
  List<Object> get props => [map(), decorations(), enemies()];

  @override
  bool get stringify => true;
}
