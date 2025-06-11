
import 'package:fruits_app/Features/Home/domain/repos/home_service.dart';
import 'package:fruits_app/Features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_app/core/services/api_service.dart';
import 'package:get_it/get_it.dart';

import '../../Features/Home/data/repos/home_service_imp.dart';
import '../../Features/auth/data/repos/auth_repo_imp.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerSingleton<HomeService>(HomeServiceImp(apiService: ApiService()));
  getIt.registerSingleton<AuthRepo>(AuthRepoImp(apiService: ApiService()));
}
