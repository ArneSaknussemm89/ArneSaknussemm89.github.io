import 'package:bonfire/bonfire.dart';

Tile tile({Position position}) {
  if (position == null) {
    position = Position.empty();
  }

  return Tile(
    'tile/wall_bottom.png',
    position,
    collision: true,
  );
}
