import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';

class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute({
    WidgetBuilder builder,
    RouteSettings settings,
  }) : super(
    builder: builder,
    settings: settings,
  );

  @override
  Widget buildTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    final auth = Provider.of<Auth>(context,listen: false);
    if (settings.name == (auth.isAuth ?'/auth':'/overview_screen')) {
      return child;
    }
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}

class CustomPageTransitionBuilder extends PageTransitionsBuilder{
  @override
  Widget buildTransitions<T>(
      PageRoute<T>route,
      BuildContext context,
      Animation<double> animation ,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {

    final auth = Provider.of<Auth>(context,listen: false);
    if (route.settings.name == (auth.isAuth ?'/auth':'/overview_screen')) {
      return child;
    }
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}