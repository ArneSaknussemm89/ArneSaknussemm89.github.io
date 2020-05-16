import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import 'package:thegreycouncil/bonfire/custom/quests/quest.dart';

part 'event.dart';
part 'state.dart';
part 'bloc.g.dart';

class QuestBloc extends Bloc<QuestEvent, QuestState> {
  @override
  QuestState get initialState => InitialQuestState();

  @override
  Stream<QuestState> mapEventToState(QuestEvent event) async* {
    if (event is SetQuestEvent) {
      yield LoadedQuestState(quest: event.quest);
    }

    if (state is LoadedQuestState) {
      var current = state as LoadedQuestState;

      if (event is NextPartQuestEvent) {
        /// Make sure we are not at the last index before moving forward.
        var nextText = current.textsIndex < (current.quest.texts.length - 1)
            ? current.textsIndex + 1
            : current.quest.texts.length - 1;
        var nextOption = current.optionsIndex < (current.quest.options.length - 1)
            ? current.optionsIndex + 1
            : current.quest.options.length - 1;

        yield current.copyWith(textsIndex: nextText, optionsIndex: nextOption);
      }
    }
  }
}
