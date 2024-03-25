import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:simup_up/views/components/custom_tab_bar.dart';
import 'package:simup_up/views/components/route_queue.dart';
import 'package:simup_up/views/utils/station-model.dart';

class RouteTabs extends StatefulWidget {
  const RouteTabs({super.key});

  @override
  _RouteTabsState createState() => _RouteTabsState();
}

class _RouteTabsState extends State<RouteTabs> {
  List<Map<String, dynamic>> routeOneStations = [];
  List<Map<String, dynamic>> routeTwoStations = [];
  bool _routeInformationLoaded = true;
  int _selectedTabIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    StationModel.calculateStationIntervals(context);

    routeOneStations = StationModel.routeOneStations;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 24.0, right: 24.0),
          child: CustomTabBar(
            tabs: [AppLocalizations.of(context)!.routeOne, AppLocalizations.of(context)!.routeTwo],
            selectedIndex: _selectedTabIndex,
            onTabTapped: _onTabTapped,
          ),
        ),
        Expanded(
          child: _selectedTabIndex == 0
              ? _buildRouteOne()
              : _buildRouteTwo(),
        ),
      ],
    );
  }

  Widget _buildRouteOne() {
    if (_routeInformationLoaded && routeOneStations.isNotEmpty) {
      return RouteQueue(
          routeList: routeOneStations,
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Text("Rutas no encontradas.", style: TextStyle(color: Theme.of(context).colorScheme.tertiary)),
      );
    }
  }

  Widget _buildRouteTwo() {
    if (_routeInformationLoaded && routeTwoStations.isNotEmpty) {
      return RouteQueue(
          routeList: routeTwoStations,
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Text("Rutas no encontradas.", style: TextStyle(color: Theme.of(context).colorScheme.tertiary),),
      );
    }
  }
}