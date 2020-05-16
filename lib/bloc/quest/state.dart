part of 'bloc.dart';

abstract class QuestState extends Equatable {
  const QuestState();

  @override
  List<Object> get props => [];
}

class InitialQuestState extends QuestState {
  const InitialQuestState();
}

@CopyWith()
class LoadedQuestState extends QuestState {
  const LoadedQuestState({this.quest, this.textsIndex = 0, this.optionsIndex = 0});

  final Quest quest;
  final int textsIndex;
  final int optionsIndex;

  @override
  List<Object> get props => [quest, textsIndex, optionsIndex];
}
