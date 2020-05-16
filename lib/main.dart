import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:bonfire/bonfire_widget.dart';
import 'package:flame/flame.dart';
import 'package:flame/animation.dart' as FlameAnimation;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:thegreycouncil/bloc/game_state/bloc.dart';

import 'package:thegreycouncil/bloc/map/bloc.dart';
import 'package:thegreycouncil/bonfire/characters/evlana.dart';
import 'package:thegreycouncil/bonfire/enemies/goblin.dart';
import 'package:thegreycouncil/bonfire/interfaces/evlana_interface.dart';
import 'package:thegreycouncil/bonfire/maps/chapter1/greenest.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    runApp(MyApp(isWeb: true));
  } else {
    await Flame.util.setLandscape();
    await Flame.util.fullScreen();
    runApp(MyApp());
  }
}

class MyApp extends StatelessWidget {
  MyApp({this.isWeb = false});

  final bool isWeb;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MapBloc>(create: (context) => MapBloc()..add(MapEventLoadMap(GreenestMap()))),
        BlocProvider<GameStateBloc>(create: (context) => GameStateBloc()..add(const GameStateLoadState())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.grey,
          accentColor: Colors.indigo,
          textTheme: Typography.whiteHelsinki,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: isWeb
            ? Container(
                child: SizedBox(
                  height: 600,
                  width: 800,
                  child: TheGreyCouncilEntry(),
                ).center(),
              )
            : TheGreyCouncilEntry(),
      ),
    );
  }
}

class TheGreyCouncilEntry extends StatelessWidget implements GameListener {
  static const sizeTile = 32.0;

  final GameController _controller = GameController();

  @override
  void updateGame() {}

  @override
  void changeCountLiveEnemies(int count) {
    if (count < 2) {
      _addEnemyInWorld();
    }
  }

  void _addEnemyInWorld() {
    double x = sizeTile * (2 + Random().nextInt(27));
    double y = sizeTile * (5 + Random().nextInt(3));

    Position position = Position(
      x,
      y,
    );
    _controller.addComponent(
      AnimatedObjectOnce(
        animation: FlameAnimation.Animation.sequenced(
          'smoke_explosion.png',
          6,
          textureWidth: 16,
          textureHeight: 16,
        ),
        position: Rect.fromLTWH(
          position.x,
          position.y,
          sizeTile,
          sizeTile,
        ),
      ),
    );

    _controller.addEnemy(
      Goblin(
        initPosition: position,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('The Grey Council'),
        leading: Builder(
          builder: (context) => Icon(Icons.menu, color: Colors.white).gestures(
            onTap: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          if (state is MapStateInitial) {
            return LoadingJumpingLine.circle().center();
          }

          if (state is MapStateLoaded) {
            return BonfireWidget(
              joystick: Joystick(
                isFixedDirectional: false,
                pathSpriteBackgroundDirectional: 'joystick_background.png',
                pathSpriteKnobDirectional: 'joystick_knob.png',
                sizeDirectional: 100,
                actions: [
                  JoystickAction(
                    actionId: 0,
                    pathSprite: 'joystick_attack.png',
                    size: 80,
                    margin: EdgeInsets.only(bottom: 50, right: 50),
                  ),
                  JoystickAction(
                    actionId: 1,
                    pathSprite: 'joystick_attack_range.png',
                    size: 50,
                    margin: EdgeInsets.only(bottom: 50, right: 160),
                  )
                ],
              ), // required
              map: state.map.map(), // required
              // If player is omitted, the joystick directional will control the map view,
              // being very useful in the process of building maps
              player: Evlana(initPosition: Position(5, 5)),
              interface: EvlanaInterface(),
              decorations: state.map.decorations(),
              enemies: state.map.enemies(),
              background: BackgroundColorGame(Colors.blueGrey[900]),
              constructionMode: false, // If true, activates hot reload to ease the map constructions and draws the grid
              showCollisionArea: false, // If true, show collision area of the elements
              gameController: _controller
                ..setListener(this), // If you want to hear changes to the game to do something.
              constructionModeColor: Colors.deepOrange, // If you wan customize the grid color.
              collisionAreaColor: Colors.white, // If you wan customize the collision area color.
            );
          }

          return const SizedBox.shrink();
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
