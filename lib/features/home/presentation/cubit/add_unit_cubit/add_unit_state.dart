abstract class AddUnitState {}

class AddUnitInitialState extends AddUnitState {}

class AddUnitLoadingState extends AddUnitState {}

class AddUnitSuccessState extends AddUnitState {}

class AddUnitErrorState extends AddUnitState {
  String error;
  AddUnitErrorState({required this.error});
}
