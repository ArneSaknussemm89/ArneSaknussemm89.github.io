import 'dart:async';
import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:flame/animation.dart' as FlameAnimation;

class Evlana extends SimplePlayer {
  final Position initPosition;
  double level;
  double experience;
  double attack = 20;
  double chi = 5;
  double maxChi = 5;
  double initSpeed = 150;
  double _lastTimeDamaged = 0;
  double _outOfCombatThreshold = 5;
  Timer _chiTimer;
  bool showObserveEnemy = false;
  bool showTalk = false;
  bool inCombat = false;
  Paint red = Paint()..color = const Color(0xFFFF0000);

  static FlameAnimation.Animation idleLeft = FlameAnimation.Animation.sequenced(
    'characters/evlana/evlana_sprites_v1.png',
    1,
    textureX: 0,
    textureY: 48,
    textureWidth: 32,
    textureHeight: 48,
  );

  static FlameAnimation.Animation idleRight = FlameAnimation.Animation.sequenced(
    'characters/evlana/evlana_sprites_v1.png',
    1,
    textureX: 0,
    textureY: 96,
    textureWidth: 32,
    textureHeight: 48,
  );

  static FlameAnimation.Animation idleTop = FlameAnimation.Animation.sequenced(
    'characters/evlana/evlana_sprites_v1.png',
    1,
    textureX: 0,
    textureY: 144,
    textureWidth: 32,
    textureHeight: 48,
  );

  static FlameAnimation.Animation idleBottom = FlameAnimation.Animation.sequenced(
    'characters/evlana/evlana_sprites_v1.png',
    1,
    textureX: 0,
    textureY: 0,
    textureWidth: 32,
    textureHeight: 48,
  );

  static FlameAnimation.Animation runRight = FlameAnimation.Animation.sequenced(
    'characters/evlana/evlana_sprites_v1.png',
    4,
    textureX: 0,
    textureY: 96,
    textureWidth: 32,
    textureHeight: 48,
  );

  static FlameAnimation.Animation runLeft = FlameAnimation.Animation.sequenced(
    'characters/evlana/evlana_sprites_v1.png',
    4,
    textureX: 0,
    textureY: 48,
    textureWidth: 32,
    textureHeight: 48,
  );

  static FlameAnimation.Animation runTop = FlameAnimation.Animation.sequenced(
    'characters/evlana/evlana_sprites_v1.png',
    4,
    textureX: 0,
    textureY: 144,
    textureWidth: 32,
    textureHeight: 48,
  );

  static FlameAnimation.Animation runBottom = FlameAnimation.Animation.sequenced(
    'characters/evlana/evlana_sprites_v1.png',
    4,
    textureX: 0,
    textureY: 0,
    textureWidth: 32,
    textureHeight: 48,
  );

  Evlana({
    this.initPosition,
    double currentLevel,
  }) : super(
          animIdleLeft: idleLeft,
          animIdleRight: idleRight,
          animIdleTop: idleTop,
          animIdleBottom: idleBottom,
          animRunRight: runRight,
          animRunLeft: runLeft,
          animRunTop: runTop,
          animRunBottom: runBottom,
          width: 32,
          height: 32,
          initPosition: initPosition,
          life: 200,
          speed: 150,
          collision: Collision(height: 16, width: 16),
        ) {
    level = currentLevel ?? 1;
  }

  @override
  void joystickChangeDirectional(JoystickDirectionalEvent event) {
    this.speed = initSpeed * event.intensity;
    super.joystickChangeDirectional(event);
  }

  @override
  void joystickAction(int action) {
    if (isDead) return;

    if (action == 0) {
      actionAttack();
    }

    if (action == 1) {
      actionAttackRange();
    }

    super.joystickAction(action);
  }

  @override
  void die() {
    remove();
    gameRef.addDecoration(
      GameDecoration(
        initPosition: Position(
          positionInWorld.left,
          positionInWorld.top,
        ),
        height: 30,
        width: 30,
        sprite: Sprite('characters/crypt.png'),
      ),
    );
    super.die();
  }

  void actionAttack() {
    if (chi <= 0) return;

    spendChi();

    this.simpleAttackMelee(
      damage: attack,
      attackEffectBottomAnim: FlameAnimation.Animation.sequenced(
        'characters/evlana/attack_effect_bottom.png',
        6,
        textureWidth: 16,
        textureHeight: 16,
      ),
      attackEffectLeftAnim: FlameAnimation.Animation.sequenced(
        'characters/evlana/attack_effect_left.png',
        6,
        textureWidth: 16,
        textureHeight: 16,
      ),
      attackEffectRightAnim: FlameAnimation.Animation.sequenced(
        'characters/evlana/attack_effect_right.png',
        6,
        textureWidth: 16,
        textureHeight: 16,
      ),
      attackEffectTopAnim: FlameAnimation.Animation.sequenced(
        'characters/evlana/attack_effect_top.png',
        6,
        textureWidth: 16,
        textureHeight: 16,
      ),
    );
  }

  void actionAttackRange() {
    if (chi <= 0) return;

    spendChi();

    this.simpleAttackRange(
      animationRight: FlameAnimation.Animation.sequenced(
        'player/fireball_right.png',
        3,
        textureWidth: 23,
        textureHeight: 23,
      ),
      animationLeft: FlameAnimation.Animation.sequenced(
        'player/fireball_left.png',
        3,
        textureWidth: 23,
        textureHeight: 23,
      ),
      animationTop: FlameAnimation.Animation.sequenced(
        'player/fireball_top.png',
        3,
        textureWidth: 23,
        textureHeight: 23,
      ),
      animationBottom: FlameAnimation.Animation.sequenced(
        'player/fireball_bottom.png',
        3,
        textureWidth: 23,
        textureHeight: 23,
      ),
      animationDestroy: FlameAnimation.Animation.sequenced(
        'player/explosion_fire.png',
        6,
        textureWidth: 32,
        textureHeight: 32,
      ),
      width: 25,
      height: 25,
      damage: 10,
      speed: initSpeed * 1.5,
    );
  }

  @override
  void update(double dt) {
    if (this.isDead) return;

    /// Check if we are "in combat".
    _verifyInCombat();
    _verifyChi();
    this.seeEnemy(
      visionCells: 8,
      notObserved: () {
        showObserveEnemy = false;
      },
      observed: (enemies) {
        if (showObserveEnemy) return;
        showObserveEnemy = true;
        //showEmote();
        if (!showTalk) {
          showTalk = true;
          //_showTalk();
        }
      },
    );
    super.update(dt);
  }

  @override
  void render(Canvas c) {
    if (inCombat) {
      c.drawRect(Rect.fromLTWH(position.left, position.top + height, width, 4), red);
    }
    super.render(c);
  }

  void _verifyInCombat() {
    var diff = gameRef.currentTime() - _lastTimeDamaged;

    /// If the threshold has been passed, we are out of combat.
    if (diff > _outOfCombatThreshold && inCombat) {
      inCombat = false;
    }
  }

  void spendChi() {
    if (chi <= 0) return;
    chi -= 1;
  }

  void _verifyChi() {
    if (_chiTimer == null) {
      _chiTimer = Timer(Duration(seconds: inCombat ? 3 : 1), () {
        _chiTimer = null;
      });
    } else {
      return;
    }

    if (chi < maxChi) {
      chi += 1;
    }
  }

  @override
  void receiveDamage(double damage, int from) {
    this.showDamage(damage);
    super.receiveDamage(damage, from);
    if (!inCombat) {
      _lastTimeDamaged = gameRef.currentTime();
      inCombat = true;
    }
  }

//  void showEmote() {
//    gameRef.add(
//      AnimatedFollowerObject(
//        animation: FlameAnimation.Animation.sequenced(
//          'player/emote_exclamacao.png',
//          8,
//          textureWidth: 32,
//          textureHeight: 32,
//        ),
//        target: this,
//        width: 16,
//        height: 16,
//        positionFromTarget: Position(18, -6),
//      ),
//    );
//  }

//  void _showTalk() {
//    TalkDialog.show(
//      gameRef.context,
//      [
//        Say(
//          "Look at this! It seems that I'm not alone here ...",
//          Flame.util.animationAsWidget(
//            Position(100, 100),
//            animation,
//          ),
//        ),
//      ],
//    );
//  }
}

enum EvlanaAbility {
  SwiftPunch,
  HighPunch,
  HighKick,
  SweepKick,
  RoundhouseKick,
  FlurryOfBlows,
}
