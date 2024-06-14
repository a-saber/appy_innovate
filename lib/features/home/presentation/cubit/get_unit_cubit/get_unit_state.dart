import 'package:appy_innovate/features/home/data/models/unit_model.dart';

abstract class GetUnitState {}

class GetUnitInitialState extends GetUnitState {}

class GetUnitLoadingState extends GetUnitState {}

class GetUnitSuccessState extends GetUnitState {
  List<UnitModel> units;
  GetUnitSuccessState(this.units);
}

class GetUnitErrorState extends GetUnitState {
  String error;
  GetUnitErrorState({required this.error});
}
