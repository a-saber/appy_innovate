import 'package:appy_innovate/features/home/data/repo/home_repo_imp.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupSingletone() {
  getIt.registerSingleton<HomeRepoImp>(HomeRepoImp());
}
