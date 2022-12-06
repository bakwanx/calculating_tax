import 'package:flutter/cupertino.dart';

import '../models/nominal_model.dart';
import '../models/ppn_model.dart';

@immutable
abstract class CounterState{}
class CounterInitial extends CounterState {}
class CounterLoading extends CounterState {}
class CounterSuccess extends CounterState {
  final NominalModel? nominalModel;
  final PpnModel? ppnModel;
  CounterSuccess({this.nominalModel, this.ppnModel});

  @override
  // TODO: implement props
  List<Object?> get props => [nominalModel];
}
