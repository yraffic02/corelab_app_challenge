import 'package:bloc/bloc.dart';
import 'package:corelab_app_challenge/blocs/history/history_event.dart';
import 'package:corelab_app_challenge/blocs/history/history_state.dart';
import 'package:corelab_app_challenge/model/history_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryInitialState()) {
    on(_mapEventToState);
  }

  void _mapEventToState(HistoryEvent event, Emitter emit) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> historyStrings = prefs.getStringList('search_history') ?? [];
    List<HistoryModel> historys = [];

    emit(HistoryLoadingState());

    if (event is GetHistory) {
      historys = historyStrings
          .map((history) => HistoryModel(history: history))
          .toList();
    }

    if (event is AddHistory) {
      if (!historyStrings.contains(event.history)) {
        historyStrings.add(event.history);
        await prefs.setStringList('search_history', historyStrings);
      }
    }

    emit(HistoryLoadedState(historys: historys));
  }
}
