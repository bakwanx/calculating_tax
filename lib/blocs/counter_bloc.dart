import 'package:calculating_tax/models/calculate_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

    var calculateModel = CalculateModel();
    calculateModel.nominal = nominal;
    calculateModel.dpp = 100/111 * nominal;
    calculateModel.ppn = 11/100 * calculateModel.dpp!.toDouble();
    calculateModel.pph = 2/100 * calculateModel.dpp!.toDouble();
    calculateModel.ppnAndpph =  calculateModel.ppn!.toDouble() + calculateModel.pph!.toDouble();
    calculateModel.transfer = nominal - calculateModel.ppnAndpph!.toDouble();
    emit(CounterSuccess(calculateModel: calculateModel));


  }

  void onUsingPpnValue(double ppn){
    emit(CounterLoading());
    var calculateModel = CalculateModel();
    var nominal = (ppn * (100/11))/(100/111);


    calculateModel.nominal = nominal;
    calculateModel.dpp = ppn * (100/11);
    calculateModel.ppn = 11/100 * calculateModel.dpp!.toDouble();
    calculateModel.pph = 2/100 * calculateModel.dpp!.toDouble();
    calculateModel.ppnAndpph =  ppn + calculateModel.pph!.toDouble();
    calculateModel.transfer = nominal - calculateModel.ppnAndpph!.toDouble();

    emit(CounterSuccess(calculateModel: calculateModel));
  }

  void onUsingTransferValue(double transfer){
    emit(CounterLoading());

    var calculateModel = CalculateModel();
    calculateModel.dpp = transfer/98 * 100;
    calculateModel.nominal = calculateModel.dpp! / (100/111);
    calculateModel.ppn = 11/100 * calculateModel.dpp!.toDouble();
    calculateModel.pph = 2/100 * calculateModel.dpp!.toDouble();
    calculateModel.ppnAndpph =  calculateModel.ppn!.toDouble() + calculateModel.pph!.toDouble();
    calculateModel.transfer =  transfer;
    emit(CounterSuccess(calculateModel: calculateModel));

    print("PPN : ${calculateModel.ppn!.toDouble()}");
    print("PPH : ${calculateModel.pph!.toDouble()}");
    print("PPN & PPH ${calculateModel.ppn!.toDouble() + calculateModel.pph!.toDouble()}");
  }
}

