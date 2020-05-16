import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

import 'package:thegreycouncil/bonfire/interfaces/bar_life_component.dart';
import 'package:thegreycouncil/bonfire/interfaces/quest_log_component.dart';

class EvlanaInterface extends GameInterface {
  @override
  void resize(Size size) {
    add(BarLifeComponent());
    add(InterfaceComponent(
      sprite: Sprite('blue_button1.png'),
      spriteSelected: Sprite('blue_button2.png'),
      height: 40,
      width: 40,
      id: 5,
      position: Position(150, 20),
      onTapComponent: () {
        print('Test button');
      },
    ));
    add(QuestLogComponent(
      size,
    ));
    super.resize(size);
  }
}
