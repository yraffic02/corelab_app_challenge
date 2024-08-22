import 'package:corelab_app_challenge/model/history_model.dart';

abstract class HistoryState {
  final List<HistoryModel> historys;

  HistoryState({required this.historys});
}

class HistoryInitialState extends HistoryState {
  HistoryInitialState() : super(historys: []);
}

class HistoryLoadingState extends HistoryState {
  HistoryLoadingState() : super(historys: []);
}

class HistoryLoadedState extends HistoryState {
  HistoryLoadedState({required List<HistoryModel> historys})
      : super(historys: historys);
}
