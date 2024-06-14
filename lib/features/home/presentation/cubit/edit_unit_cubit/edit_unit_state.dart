abstract class EditUnitState {}

class EditUnitInitialState extends EditUnitState {}

class EditUnitLoadingState extends EditUnitState {}

class EditUnitSuccessState extends EditUnitState {}

class EditUnitErrorState extends EditUnitState {
  String error;
  EditUnitErrorState({required this.error});
}
