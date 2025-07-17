import 'package:get_it/get_it.dart';
import 'package:lilac_assessment_flutter/data/data_source/phone_number_repository.dart';
import 'package:lilac_assessment_flutter/data/network/network.dart';

final getIt = GetIt.instance;

class DependencyInjector {

  static setupDependencies() async {
     getIt.registerLazySingleton<NetworkUtil>(
      () => NetworkUtil(),
    );
   
    getIt.registerLazySingleton<PhoneNumberRepository>(
      () => PhoneNumberRepository(networkUtil:getIt<NetworkUtil>()),
    );
  }
}