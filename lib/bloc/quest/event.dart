part of 'bloc.dart';

abstract class QuestEvent extends Equatable {
  const QuestEvent();

  @override
  List<Object> get props => [];
}

class SetQuestEvent extends QuestEvent {
  const SetQuestEvent(this.quest);

  final Quest quest;

  @override
  List<Object> get props => [quest];
}

class NextPartQuestEvent extends QuestEvent {
  const NextPartQuestEvent();
}
