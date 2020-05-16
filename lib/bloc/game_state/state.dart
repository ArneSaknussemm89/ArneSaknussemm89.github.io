part of 'bloc.dart';

abstract class GameState extends Equatable {
  const GameState();

  @override
  List<Object> get props => [];
}

/// When first loading the game, before fetching saved progress.
class InitialGameState extends GameState {
  const InitialGameState();
}

@CopyWith()
class LoadedGameState extends GameState {
  const LoadedGameState({this.quests = const []});

  final List<Quest> quests;

  @override
  List<Object> get props => [quests];
}
