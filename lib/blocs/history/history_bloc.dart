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
    List<HistoryModel> historys = [];

    emit(HistoryLoadingState());

    if (event is GetHistory) {
      List<String> historyStrings = prefs.getStringList('search_history') ?? [];

      historys = historyStrings
          .map((history) => HistoryModel(history: history))
          .toList();
    }

    emit(HistoryLoadedState(historys: historys));
  }
}
