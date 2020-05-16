import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flame/animation.dart' as FlameAnimation;
import 'package:flame/position.dart';
import 'package:thegreycouncil/bonfire/custom/quests/quest.dart';

import 'package:thegreycouncil/bonfire/decorations/npc/generic.dart';
import 'package:thegreycouncil/bonfire/enemies/goblin.dart';
import 'package:thegreycouncil/bonfire/maps/game_map_interface.dart';

class GreenestMap extends GameMapInterface {
  final Random random = Random();
  final int tileSize = 32;

  @override
  MapWorld map() {
    List<Tile> tileList = List();

    /// First, let's create the "ground" tile.
    tileList.add(Tile(
      'maps/Chapter1/Greenest/T1.png',
      Position(0, 0),
      size: 1600,
    ));

    /// Let's set up the wall around the Inn.
    /// Top and Bottom walls
    for (var i = 0; i < 15; i++) {
      int r = random.nextInt(4).clamp(1, 4);

      /// Top
      tileList.add(Tile(
        'tile/crawl_pack/dc-dngn/wall/brick_brown-vines$r.png',
        Position(i + 8.0, 10),
        collision: true,
      ));

      /// Bottom, leaving gap for path.
      if (i == 6 || i == 7) {
        continue;
      }
      tileList.add(Tile(
        'tile/crawl_pack/dc-dngn/wall/brick_brown-vines$r.png',
        Position(i + 8.0, 22),
        collision: true,
      ));
    }

    /// Left & right wall
    for (var i = 0; i < 12; i++) {
      /// Left
      tileList.add(Tile(
        'tile/crawl_pack/dc-dngn/wall/brick_brown-vines1_left.png',
        Position(8, i + 11.0),
        collision: true,
      ));

      /// Right
      tileList.add(Tile(
        'tile/crawl_pack/dc-dngn/wall/brick_brown-vines1_right.png',
        Position(22, i + 11.0),
        collision: true,
      ));
    }

    return MapWorld(tileList);
  }

  @override
  List<GameDecoration> decorations() {
    List<GameDecoration> decorations = [];

    /// The Innkeeper
    var position = getRelativeTilePosition(16, 16);
    decorations.add(
      GenericNPC(
        position,
        quest: Quest(
          id: 1,
          title: 'Help save Greenest!',
          objectiveText: 'Kill all goblins in the town',
          texts: [
            'Please! Someone help!',
            'The goblins are attacking the town, please help us fight them off before they overrun Greenest!',
          ],
          options: [
            "What's going on?",
            "Stay inside; I'll deal with the goblins!",
          ],
          acceptText: 'Protect the town!',
          declineText: 'Continue being a coward.',
          objective: KillCountQuestObjective(totalKills: 5),
        ),
      ),
    );

    return decorations;
  }

  @override
  List<Enemy> enemies() {
    return [
      Goblin(initPosition: getRelativeTilePosition(14, 6)),
      Goblin(initPosition: getRelativeTilePosition(25, 6)),
    ];
  }

  Position getRelativeTilePosition(int x, int y) {
    return Position(
      (x * tileSize).toDouble(),
      (y * tileSize).toDouble(),
    );
  }

  @override
  List<Object> get props => [map(), decorations(), enemies(), tileSize];
}
