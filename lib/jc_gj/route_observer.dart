//
// import 'package:flutter/material.dart';
//
// import 'package.dart';
//
// PBRouteObserver globalRouteObserver = PBRouteObserver();
//
// class PBRouteObserver extends RouteObserver<PageRoute<dynamic>> {
//
//   String routeName = "";
//
//   @override
//   void didPush(Route route, Route? previousRoute) {
//     super.didPush(route, previousRoute);
//     routeName = route.settings.name??"";
//
//     print('📌 ==routeName:$routeName ${globalRouteObserver.routeName} didPush: ${route.settings.name} previousRoute:${previousRoute?.settings.name}');
//   }
//
//   @override
//   void didPop(Route route, Route? previousRoute) {
//     super.didPop(route, previousRoute);
//     routeName = previousRoute?.settings.name??"";
//
//     print('📌 ==routeName:$routeName didPop: ${route.settings.name} previousRoute:${previousRoute?.settings.name}');
//   }
//
//   @override
//   void didRemove(Route route, Route? previousRoute) {
//     super.didRemove(route, previousRoute);
//     print('📌 didRemove: ${route.settings.name} previousRoute:${previousRoute?.settings.name}');
//   }
//
//   @override
//   void didReplace({Route? newRoute, Route? oldRoute}) {
//     super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
//     print('📌 didReplace: ${oldRoute?.settings.name} -> ${newRoute?.settings.name}');
//   }
// }
