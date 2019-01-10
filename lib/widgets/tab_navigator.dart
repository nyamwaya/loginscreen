import 'package:firebase_auth_world/model/Kwizn.dart';
import 'package:firebase_auth_world/model/auth.dart';
import 'package:firebase_auth_world/routes/favorites.dart';
import 'package:firebase_auth_world/routes/kwizn_detail_page.dart';
import 'package:firebase_auth_world/routes/kwiznyListPage.dart';
import 'package:firebase_auth_world/routes/profile_page.dart';
import 'package:firebase_auth_world/widgets/bottom_navigation.dart';
import 'package:firebase_auth_world/routes/AddPhotoScreen.dart';

import 'package:flutter/material.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatefulWidget {
  TabNavigator(
      {this.navigatorKey,
      this.tabItem,
      this.data,
      this.onSignedOut,
      this.auth});
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;
  final List<Kwizn> data;
  final VoidCallback onSignedOut;
  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  void _push(
    BuildContext context,
    /*{int materialIndex: 500}enable other routing to work*/
  ) {
    var routeBuilders = _routeBuilders(
      context, /*materialIndex: materialIndex enable other routing to work*/
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => routeBuilders[TabNavigatorRoutes.detail](context),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(
    BuildContext context,
    /* {int materialIndex: 500} enable other routing to work*/
  ) {
    if (widget.tabItem == TabItem.home) {
      return {
        TabNavigatorRoutes.root: (context) => KwiznyListPage(
              data: widget.data,
              onPush: (materialIndex) => _push(
                    context, /* materialIndex: materialIndex enable other routing to work*/
                  ),
            ),
        /*  TabNavigatorRoutes.detail: (context) => KwiznDetailpage(
              color: TabHelper.color(tabItem),
              title: data[materialIndex].name,
              address: data[materialIndex].address,
              cityState: data[materialIndex].city_state,
              pictureUrl: data[materialIndex].picture_url,
              materialIndex: materialIndex,
            ), enable other routing to work*/
      };
    } else if (widget.tabItem == TabItem.photo) {
      return {
        TabNavigatorRoutes.root: (context) => AddPhotoScreen(),
      };
    } else if (widget.tabItem == TabItem.profile) {
      return {
        TabNavigatorRoutes.root: (context) => ProfilePage(
              auth: widget.auth,
              onSignedOut: widget.onSignedOut,
            )
      };
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
        key: widget.navigatorKey,
        initialRoute: TabNavigatorRoutes.root,
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name](context),
          );
        });
  }
}
