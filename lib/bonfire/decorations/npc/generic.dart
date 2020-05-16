import 'package:bonfire/bonfire.dart';
import 'package:flame/animation.dart' as FlameAnimation;
import 'package:flame/position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thegreycouncil/bloc/game_state/bloc.dart';

import 'package:thegreycouncil/bonfire/custom/quests/quest.dart';

GameDecoration genericNPC(
  int tileSize,
  Position initPosition,
  Quest quest,
) =>
    GenericNPC(
      initPosition,
      quest: quest,
    );

class GenericNPC extends GameDecoration {
  final Position initPosition;
  final Quest quest;
  bool _observedPlayer = false;
  bool _acceptedQuest = false;

  GenericNPC(this.initPosition, {this.quest})
      : super.animation(
          FlameAnimation.Animation.sequenced(
            'characters/npc/generic.png',
            4,
            textureX: 0,
            textureY: 0,
            textureWidth: 32,
            textureHeight: 48,
            stepTime: 0.3,
          ),
          initPosition: initPosition,
          height: 32,
          width: 32,
          isTouchable: true,
        );

  @override
  void update(double dt) {
    this.seePlayer(
      observed: (player) {
        if (!_observedPlayer) {
          _observedPlayer = true;
          var state = gameRef.context.bloc<GameStateBloc>().state;
          if (state is LoadedGameState) {
            if (!state.quests.contains(quest) || !_acceptedQuest) {
              _showEmote();
            }
          }
        }
      },
      notObserved: () {
        _observedPlayer = false;
      },
      visionCells: 3,
    );

    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override
  void onTap() async {
    if (_observedPlayer) {
      var response = await showDialog<bool>(
        context: gameRef.context,
        builder: (context) => QuestDialog(quest: quest),
      );

      if (response) {
        _acceptedQuest = true;
      }
    }
    super.onTap();
  }

  void _showEmote() {
    gameRef.add(
      AnimatedFollowerObject(
        animation: FlameAnimation.Animation.sequenced(
          'player/emote_exclamation.png',
          8,
          textureWidth: 32,
          textureHeight: 32,
          stepTime: 0.4,
        ),
        target: this,
        width: 16,
        height: 16,
        positionFromTarget: Position(18, -6),
      ),
    );
  }
}
