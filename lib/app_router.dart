import 'package:flutter/material.dart';
import 'package:flutter_application_11/business_logic/cubit/characters_cubit.dart';
import 'package:flutter_application_11/data/repository/characters_repository.dart';
import 'package:flutter_application_11/data/web_services/characters_web_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/strings.dart';
import 'presentation/screens/characters_details.dart';
import 'presentation/screens/characters_screen.dart';

class AppRouter {

late CharactorsRepository charactorsRepository;
late CharactersCubit charactersCubit;

AppRouter(){
  charactorsRepository = CharactorsRepository(CharacterWebService());
  charactersCubit = CharactersCubit(charactorsRepository);
}

  Route? generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case characterScreen:
        return MaterialPageRoute(builder: (_) => BlocProvider(
          create: (BuildContext context) => charactersCubit,
          child: const CharactersScreen(),
        ));
      

      case charactersDetailsScreen:
        return MaterialPageRoute(builder: (_) => const CharactersDetailsScreen());

    }
    return null;

  }
}























// case characterd
      // case '/login':
      //   return MaterialPageRoute(builder: (_) => LoginPage());
      // case '/register':
      //   return MaterialPageRoute(builder: (_) => RegisterPage());
      // case '/home':
      //   return MaterialPageRoute(builder: (_) => HomePage());
      // case '/profile':
      //   return MaterialPageRoute(builder: (_) => ProfilePage());
      // case '/settings':
      //   return MaterialPageRoute(builder: (_) => SettingsPage());
      // default:
      //   return null;
