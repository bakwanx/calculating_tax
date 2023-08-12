import 'package:calculating_tax/models/calculate_model.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class CounterState{}
class CounterInitial extends CounterState {}
class CounterLoading extends CounterState {}
class CounterSuccess extends CounterState {
  final CalculateModel? calculateModel;
  CounterSuccess({this.calculateModel});

  @override
  // TODO: implement props
  List<Object?> get props => [calculateModel];
}
