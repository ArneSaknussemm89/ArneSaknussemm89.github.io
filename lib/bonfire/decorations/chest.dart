import 'package:bonfire/bonfire.dart';
import 'package:flame/animation.dart' as FlameAnimation;
import 'package:flame/position.dart';
import 'package:flutter/material.dart';

import 'package:thegreycouncil/bonfire/decorations/potion_life.dart';

class Chest extends GameDecoration {
  final Position initPosition;
  bool _observedPlayer = false;

  TextConfig _textConfig;
  Chest(this.initPosition)
      : super.animation(
          FlameAnimation.Animation.sequenced(
            'items/chest_spritesheet.png',
            8,
            textureWidth: 16,
            textureHeight: 16,
          ),
          width: 20,
          height: 20,
          initPosition: initPosition,
          isTouchable: true,
        ) {
    _textConfig = TextConfig(
      color: Colors.white,
      fontSize: 10,
    );
  }

  @override
  void update(double dt) {
    if (!this.isVisibleInMap()) return;
    this.seePlayer(
      observed: (player) {
        if (!_observedPlayer) {
          _observedPlayer = true;
          _showEmote();
        }
      },
      notObserved: () {
        _observedPlayer = false;
      },
      visionCells: 1,
    );

    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    if (_observedPlayer) {
      _textConfig.render(
        canvas,
        'Touch me !!!',
        Position(position.left - 12, position.center.dy - (height + 5)),
      );
    }
  }

  @override
  void onTap() {
    if (_observedPlayer) {
      _addPotions();
      remove();
    }
    super.onTap();
  }

  void _addPotions() {
    gameRef.addDecoration(
      PotionLife(
        Position(
          positionInWorld.translate(width * 2, 0).left,
          positionInWorld.top - height * 2,
        ),
        30,
      ),
    );

    gameRef.addDecoration(
      PotionLife(
        Position(
          positionInWorld.translate(width * 2, 0).left,
          positionInWorld.top + height * 2,
        ),
        30,
      ),
    );

    gameRef.add(
      AnimatedObjectOnce(
        animation: FlameAnimation.Animation.sequenced(
          'smoke_explosion.png',
          6,
          textureWidth: 16,
          textureHeight: 16,
        ),
        position: positionInWorld.translate(width * 2, 0),
      ),
    );

    gameRef.add(
      AnimatedObjectOnce(
        animation: FlameAnimation.Animation.sequenced(
          'smoke_explosion.png',
          6,
          textureWidth: 16,
          textureHeight: 16,
        ),
        position: positionInWorld.translate(width * 2, height * 2),
      ),
    );
  }

  void _showEmote() {
    gameRef.add(
      AnimatedFollowerObject(
        animation: FlameAnimation.Animation.sequenced(
          'player/emote_exclamation.png',
          8,
          textureWidth: 32,
          textureHeight: 32,
        ),
        target: this,
        width: 16,
        height: 16,
        positionFromTarget: Position(18, -6),
      ),
    );
  }
}
