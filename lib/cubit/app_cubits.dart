import 'package:bloc/bloc.dart';
import 'package:flutter_travel/cubit/app_cubit_states.dart';
import 'package:flutter_travel/model/data_model.dart';
import 'package:flutter_travel/pages/detail_page.dart';
import 'package:flutter_travel/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices data;
  late final places;

  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {
      print(e);
    }
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
