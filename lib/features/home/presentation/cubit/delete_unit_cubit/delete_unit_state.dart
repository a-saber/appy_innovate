abstract class DeleteUnitState {}

class DeleteUnitInitialState extends DeleteUnitState {}

class DeleteUnitLoadingState extends DeleteUnitState {}

class DeleteUnitSuccessState extends DeleteUnitState {}

class DeleteUnitErrorState extends DeleteUnitState {
  String error;
  DeleteUnitErrorState({required this.error});
}
