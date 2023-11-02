
import 'package:calibre_carte/common/routes/names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pages/home/homepage.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: PageRoutes.INITIAL,
          page:  MyHomePage(),
      )
    ];
  }

  // static List<dynamic> allBlocProviders(BuildContext context) {
  //   List<dynamic> blocProviders = <dynamic>[];
  //   for (var bloc in routes()) {
  //     blocProviders.add(bloc.bloc);
  //   }
  //   return blocProviders;
  // }

  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
    }
    return MaterialPageRoute(
        builder: (_) =>  MyHomePage(), settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  // dynamic bloc;
  PageEntity({required this.route, required this.page});
}
