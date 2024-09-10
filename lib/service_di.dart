

import 'package:get_it/get_it.dart';
import 'package:temp_project/dev_cycle_util.dart';

GetIt? serviceLocator;
setupServiceLocator(){
  try{
    serviceLocator = GetIt.instance;
  }catch(e){
    serviceLocator = GetIt.instance;
  }
}

setupServiceDependencies(){
  setupServiceLocator();

  serviceLocator?.registerLazySingleton(() => DevCycleUtil());
}

IDevCycleUtils getDevCycle(){
  return serviceLocator!.get<DevCycleUtil>();
}