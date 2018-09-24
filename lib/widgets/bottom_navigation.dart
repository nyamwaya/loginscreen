
import 'package:flutter/material.dart';

enum TabItem { home, favorites, profile }

class TabHelper {
  static TabItem item({int index}) {
    switch (index) {
      case 0:
        return TabItem.home;
      case 1:
        return TabItem.favorites;
      case 2:
        return TabItem.profile;
    }
    return TabItem.home;
  }

  static String description(TabItem tabItem) {
    switch (tabItem) {
      case TabItem.home:
        return 'red';
      case TabItem.favorites:
        return 'green';
      case TabItem.profile:
        return 'blue';
    }
    return '';
  }
  static IconData icon(TabItem tabItem) {
     switch (tabItem) {
      case TabItem.home:
        return Icons.home;
      case TabItem.favorites:
        return Icons.favorite;
      case TabItem.profile:
        return Icons.person;
    }
     return Icons.home;
  }

  static MaterialColor color(TabItem tabItem) {
    switch (tabItem) {
      case TabItem.home:
        return Colors.red;
      case TabItem.favorites:
        return Colors.red;
      case TabItem.profile:
        return Colors.red;
    }
    return Colors.grey;
  }
}

class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(tabItem: TabItem.home),
        _buildItem(tabItem: TabItem.favorites),
        _buildItem(tabItem: TabItem.profile),
      ],
      onTap: (index) => onSelectTab(
        TabHelper.item(index: index),
      ),
    );
  }

  BottomNavigationBarItem _buildItem({TabItem tabItem}) {

    String text = TabHelper.description(tabItem);
    IconData icon = TabHelper.icon(tabItem);
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _colorTabMatching(item: tabItem),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: _colorTabMatching(item: tabItem),
        ),
      ),
    );
  }

  Color _colorTabMatching({TabItem item}) {
    return currentTab == item ? TabHelper.color(item) : Colors.grey;
  }
}