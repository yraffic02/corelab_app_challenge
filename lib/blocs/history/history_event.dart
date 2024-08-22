abstract class HistoryEvent {}

class GetHistory extends HistoryEvent {}

class AddHistory extends HistoryEvent {
  final String history;

  AddHistory({required this.history});
}
