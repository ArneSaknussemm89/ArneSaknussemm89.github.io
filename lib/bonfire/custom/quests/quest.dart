import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styled_widget/styled_widget.dart';

import 'package:thegreycouncil/bloc/game_state/bloc.dart';
import 'package:thegreycouncil/bloc/quest/bloc.dart';
import 'package:thegreycouncil/bonfire/enemies/goblin.dart';

/// This is a data object that can be added to NPCs that
/// players can pick up.
class Quest {
  const Quest({
    this.id,
    this.title,
    this.objectiveText,
    this.texts,
    this.options,
    this.acceptText = 'Accept',
    this.declineText = 'Decline',
    this.objective,
  });

  final int id;
  final String title;
  final String objectiveText;
  final List<String> texts;
  final List<String> options;
  final String acceptText;
  final String declineText;
  final QuestObjective objective;

  String get progress {
    if (objective is KillCountQuestObjective) {
      var o = objective as KillCountQuestObjective;
      return '${o.currentKills} / ${o.totalKills}';
    }

    return '';
  }

  void updateObjective(dynamic meta) {
    if (objective is KillCountQuestObjective) {
      if (meta is Map) {
        if (meta['kill'] != null) {
          (objective as KillCountQuestObjective).updateProgress(1);
        }
      }
    }
  }
}

abstract class QuestObjective {
  const QuestObjective();

  bool get isComplete;
}

class KillCountQuestObjective extends QuestObjective {
  KillCountQuestObjective({this.totalKills});

  final int totalKills;
  int currentKills = 0;

  void updateProgress(int count) {
    currentKills += count;
  }

  @override
  bool get isComplete => currentKills >= totalKills;
}

class QuestDialog extends StatelessWidget {
  const QuestDialog({this.quest});

  final Quest quest;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestBloc()..add(SetQuestEvent(quest)),
      child: Builder(
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.indigo,
            child: BlocBuilder<QuestBloc, QuestState>(
              builder: (context, state) {
                if (state is LoadedQuestState) {
                  var text = Text(state.quest.texts[state.textsIndex], style: Theme.of(context).textTheme.headline5);
                  var option = state.quest.options[state.optionsIndex];

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: text,
                      ).padding(bottom: 40),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.chat_bubble,
                            color: Colors.white,
                          ),
                          Text(option, style: Theme.of(context).textTheme.headline6).padding(left: 5),
                        ],
                      ).gestures(onTap: () => context.bloc<QuestBloc>().add(NextPartQuestEvent())),
                      if (state.textsIndex == (state.quest.texts.length - 1))
                        ButtonBar(
                          children: <Widget>[
                            RaisedButton.icon(
                              onPressed: () {
                                context.bloc<GameStateBloc>().add(GameStateEventAddQuest(state.quest));
                                Navigator.of(context).pop(true);
                              },
                              icon: Icon(Icons.check, color: Colors.green),
                              label: Text(quest.acceptText),
                            ),
                            FlatButton.icon(
                              onPressed: () => Navigator.of(context).pop(false),
                              icon: Icon(Icons.mood_bad, color: Colors.red),
                              label: Text(quest.declineText),
                            ),
                          ],
                        ),
                    ],
                  ).padding(all: 20);
                }

                return const SizedBox.shrink();
              },
            ),
          );
        },
      ),
    );
  }
}
