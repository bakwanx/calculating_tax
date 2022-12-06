import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/nominal_model.dart';
import '../models/ppn_model.dart';
import 'counter_event.dart';
import 'counter_state.dart';


class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(): super(CounterInitial());

  @override
  Future<void> close() {
    return super.close();
  }

  void onUsingNominalValue(double nominal){
    emit(CounterLoading());

    var nominalModel = NominalModel();
    nominalModel.nominal = nominal;
    nominalModel.dpp = 100/111 * nominal;
    nominalModel.ppn = 11/100 * nominalModel.dpp!.toDouble();
    nominalModel.pph = 2/100 * nominalModel.dpp!.toDouble();
    nominalModel.ppnAndpph =  nominalModel.ppn!.toDouble() + nominalModel.pph!.toDouble();
    nominalModel.transfer = nominal - nominalModel.ppnAndpph!.toDouble();
    emit(CounterSuccess(nominalModel: nominalModel));

  }

  void onUsingPpnValue(double ppn){
    emit(CounterLoading());
    var ppnModel = PpnModel();
    var nominal = (ppn * (100/11))/(100/111);


    ppnModel.nominal = nominal;
    ppnModel.dpp = ppn * (100/11);
    ppnModel.ppn = 11/100 * ppnModel.dpp!.toDouble();
    ppnModel.pph = 2/100 * ppnModel.dpp!.toDouble();
    ppnModel.ppnAndpph =  ppn + ppnModel.pph!.toDouble();
    ppnModel.transfer = nominal - ppnModel.ppnAndpph!.toDouble();

    emit(CounterSuccess(ppnModel: ppnModel));
  }

  void onUsingTransferValue(double ppn){

  }
}

