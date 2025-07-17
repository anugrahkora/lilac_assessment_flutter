import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lilac_assessment_flutter/core/dependency_injection/dependency_injection.dart';
import 'package:lilac_assessment_flutter/core/route/app_routes.dart';
import 'package:lilac_assessment_flutter/core/themes/app_themes.dart';
import 'package:lilac_assessment_flutter/data/data_source/phone_number_repository.dart';
import 'package:lilac_assessment_flutter/presentation/bloc/phone_number_bloc/phone_number_bloc.dart';
import 'package:lilac_assessment_flutter/presentation/bloc/phone_number_bloc/phone_number_state.dart';

final getIt = GetIt.instance;
void main() {
    DependencyInjector.setupDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

    
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
        BlocProvider<PhoneNumberBloc>(
          create: (_) => PhoneNumberBloc(
            PhoneNumberInitialState(),
            phoneNumberRepository: getIt<PhoneNumberRepository>(),
            
          ),
        ),],
      
      child: MaterialApp.router(routerConfig: appRouter, theme: appTheme));
  }
}
