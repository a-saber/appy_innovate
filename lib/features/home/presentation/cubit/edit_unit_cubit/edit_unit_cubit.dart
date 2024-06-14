import 'package:appy_innovate/features/home/data/models/unit_model.dart';
import 'package:appy_innovate/features/home/data/repo/home_repo_imp.dart';
import 'package:appy_innovate/features/home/presentation/cubit/edit_unit_cubit/edit_unit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditUnitCubit extends Cubit<EditUnitState> {
  EditUnitCubit(this.homeRepoImp) : super(EditUnitInitialState());
  final HomeRepoImp homeRepoImp;
  static EditUnitCubit get(context) => BlocProvider.of(context);

  void editUnit({required UnitModel unitModel}) async {
    emit(EditUnitLoadingState());
    var response = await homeRepoImp.editUnit(unitModel: unitModel);
    response.fold((l) => emit(EditUnitErrorState(error: l)),
        (r) => emit(EditUnitSuccessState()));
  }
}
