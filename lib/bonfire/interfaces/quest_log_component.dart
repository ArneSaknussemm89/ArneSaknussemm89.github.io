import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:flame/flame.dart';
import 'package:flame/components/text_box_component.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:thegreycouncil/bloc/game_state/bloc.dart';

import 'package:thegreycouncil/bonfire/custom/quests/quest.dart';

class QuestLogComponent extends InterfaceComponent {
  final TextConfig config = TextConfig(fontSize: 18, color: Colors.white);
  final TextConfig questConfig = TextConfig(fontSize: 14, color: Colors.white);
  List<Quest> quests = [];

  QuestLogComponent(Size size)
      : super(
          id: 2,
          position: Position(size.width - 180, 40),
          width: 150,
          height: 200,
        );

  @override
  void update(double t) {
    if (this.gameRef.player != null) {
      var state = this.gameRef.context.bloc<GameStateBloc>().state;
      if (state is LoadedGameState) {
        quests = state.quests;
      }
    }
    super.update(t);
  }

  @override
  void render(Canvas c) {
    try {
      _drawQuests(c);
    } catch (e) {}
    super.render(c);
  }

  void _drawQuests(Canvas canvas) {
    if (quests.isNotEmpty) {
      var paint = Paint()
        ..color = Colors.yellow[800]
        ..strokeWidth = 2
        ..style = PaintingStyle.fill;

      config.render(canvas, 'Quest Log', Position(position.left, position.top - 25));

      /// Render each quest.
      for (var i = 0; i < quests.length; i++) {
        var titleTop = position.top + 5 + (i * 10);
        questConfig.render(canvas, quests[i].title, Position(position.left + 5, titleTop));
        questConfig.render(canvas, quests[i].progress, Position(position.left + 5, titleTop + 15));
      }

      /// Top line.
      canvas.drawLine(
        Offset(position.left, position.top),
        Offset(position.left + width, position.top),
        paint,
      );

      /// Right line
      canvas.drawLine(
        Offset(position.left + width, position.top),
        Offset(position.left + width, position.top + height),
        paint,
      );

      /// Bottom line
      canvas.drawLine(
        Offset(position.left + width, position.top + height),
        Offset(position.left, position.top + height),
        paint,
      );

      /// Left line
      canvas.drawLine(
        Offset(position.left, position.top + height),
        Offset(position.left, position.top),
        paint,
      );
    }
  }
}
