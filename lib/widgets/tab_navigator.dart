import 'package:firebase_auth_world/model/Kwizn.dart';
import 'package:firebase_auth_world/routes/color_detail_page.dart';
import 'package:firebase_auth_world/routes/favorites.dart';
import 'package:firebase_auth_world/routes/kwiznyListPage.dart';
import 'package:firebase_auth_world/routes/profile_page.dart';
import 'package:firebase_auth_world/widgets/bottom_navigation.dart';
import 'package:firebase_auth_world/widgets/colors_list_page.dart';
import 'package:flutter/material.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem, this.data});
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;
  final List<Kwizn> data;

  void _push(BuildContext context, {int materialIndex: 500}) {
    var routeBuilders = _routeBuilders(context, materialIndex: materialIndex);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => routeBuilders[TabNavigatorRoutes.detail](context),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {int materialIndex: 500}) {
    if (tabItem == TabItem.home) {
      return {
        TabNavigatorRoutes.root: (context) => KwiznyListPage(
              data: data,
              onPush: (materialIndex) => _push(context, materialIndex: materialIndex),
            ),
        TabNavigatorRoutes.detail: (context) => ColorDetailPage(
              color: TabHelper.color(tabItem),
              title: TabHelper.description(tabItem),
              materialIndex: materialIndex,
            ),
      };
    } else if (tabItem == TabItem.favorites) {
      return {
        TabNavigatorRoutes.root: (context) => Favorites(),
      };
    } else if (tabItem == TabItem.profile) {
      return {TabNavigatorRoutes.root: (context) => ProfilePage()};
    }

    return {};
  }
  // Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
  //     {int materialIndex: 500}) {
  //   return {

  //     TabNavigatorRoutes.root: (context) => ColorsListPage(
  //           color: TabHelper.color(tabItem),
  //           data: data,
  //           title: TabHelper.description(tabItem),
  //           onPush: (materialIndex) =>
  //               _push(context, materialIndex: materialIndex),
  //         ),
  //     TabNavigatorRoutes.detail: (context) => ColorDetailPage(
  //           color: TabHelper.color(tabItem),
  //           title: TabHelper.description(tabItem),
  //           materialIndex: materialIndex,
  //         ),
  //   };
  // }

  @override
  Widget build(BuildContext context) {
    var routeBuilders = _routeBuilders(context);

    return Navigator(
        key: navigatorKey,
        initialRoute: TabNavigatorRoutes.root,
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name](context),
          );
        });
  }
}
