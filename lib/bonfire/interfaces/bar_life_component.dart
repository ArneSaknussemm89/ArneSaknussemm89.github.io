import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

import 'package:thegreycouncil/bonfire/characters/evlana.dart';

class BarLifeComponent extends InterfaceComponent {
  double padding = 20;
  double widthBar = 90;
  double strokeWidth = 12;

  double maxLife = 0;
  double life = 0;

  double chi = 0;
  double maxChi = 0;

  BarLifeComponent()
      : super(
          id: 1,
          position: Position(20, 20),
          sprite: Sprite('health_ui.png'),
          width: 120,
          height: 40,
        );

  @override
  void update(double t) {
    if (this.gameRef.player != null) {
      life = this.gameRef.player.life;
      maxLife = this.gameRef.player.maxLife;
      if (this.gameRef.player is Evlana) {
        chi = (this.gameRef.player as Evlana).chi;
        maxChi = (this.gameRef.player as Evlana).maxChi;
      }
    }
    super.update(t);
  }

  @override
  void render(Canvas c) {
    try {
      _drawLife(c);
      _drawChi(c);
      //_drawStamina(c);
    } catch (e) {}
    super.render(c);
  }

  void _drawLife(Canvas canvas) {
    double xBar = 48;
    double yBar = 31.5;
    canvas.drawLine(
        Offset(xBar, yBar),
        Offset(xBar + widthBar, yBar),
        Paint()
          ..color = Colors.blueGrey[800]
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.fill);

    double currentBarLife = (life * widthBar) / maxLife;

    canvas.drawLine(
        Offset(xBar, yBar),
        Offset(xBar + currentBarLife, yBar),
        Paint()
          ..color = _getColorLife(currentBarLife)
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.fill);
  }

  void _drawChi(Canvas canvas) {
    double r = 6;

    for (var i = 0; i < maxChi; i++) {
      /// Draw each orb.
      var x = 56 + (r * 2 * i);
      if (i <= chi) {
        canvas.drawCircle(Offset(x, 47), r, Paint()..color = Colors.yellow);
      } else {
        canvas.drawCircle(Offset(x, 47), r, Paint()..color = Colors.grey);
      }
    }
  }

  Color _getColorLife(double currentBarLife) {
    if (currentBarLife > widthBar - (widthBar / 3)) {
      return Colors.green;
    }
    if (currentBarLife > (widthBar / 3)) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }
}
