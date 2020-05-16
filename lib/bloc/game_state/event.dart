part of 'bloc.dart';

abstract class GameStateEvent extends Equatable {
  const GameStateEvent();

  @override
  List<Object> get props => [];
}

class GameStateLoadState extends GameStateEvent {
  const GameStateLoadState();
}

class GameStateEventAddQuest extends GameStateEvent {
  const GameStateEventAddQuest(this.quest);

  final Quest quest;

  @override
  List<Object> get props => [quest];
}

class GameStateEventUpdateQuest extends GameStateEvent {
  const GameStateEventUpdateQuest(this.meta);

  final dynamic meta;

  @override
  List<Object> get props => [meta];
}
