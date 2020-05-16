import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:thegreycouncil/bonfire/custom/quests/quest.dart';

part 'event.dart';
part 'state.dart';
part 'bloc.g.dart';

class GameStateBloc extends Bloc<GameStateEvent, GameState> {
  @override
  GameState get initialState => InitialGameState();

  @override
  Stream<GameState> mapEventToState(GameStateEvent event) async* {
    if (event is GameStateLoadState) {
      yield LoadedGameState();
    }

    if (state is LoadedGameState) {
      var current = state as LoadedGameState;

      if (event is GameStateEventAddQuest) {
        var newQuests = current.quests + [event.quest];
        yield current.copyWith(quests: newQuests);
      }

      if (event is GameStateEventUpdateQuest) {
        if (event.meta is Map) {
          /// Update each quest.
          var updated = current.quests.map((q) {
            if (q.objective is KillCountQuestObjective) {
              q.updateObjective(event.meta);
            }

            return q;
          }).toList();
          yield current.copyWith(quests: updated);
        }
      }
    }
  }
}
