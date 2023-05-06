
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:general_expense_app/pages/Dashboard/home_screen.dart';
import 'package:general_expense_app/pages/Dashboard/expense_screen.dart';
import 'package:general_expense_app/pages/Dashboard/profile_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'inventory_screen.dart';



class BottomBar extends StatefulWidget {
  static String routeName = "TabletDashBoardPageScreen";
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> with WidgetsBindingObserver {

  PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  String _currentPage = "Page1";
  List<String> pageKeys = ["Page1", "Page2","Page3","Page4","Page5"];
  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "Page1": GlobalKey<NavigatorState>(),
    "Page2": GlobalKey<NavigatorState>(),
    "Page3": GlobalKey<NavigatorState>(),
    "Page4": GlobalKey<NavigatorState>(),
    "Page5": GlobalKey<NavigatorState>(),
  };
  int _selectedIndex = 0;

  void _selectTab(String tabItem, int index) {
    if(tabItem == _currentPage){
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
        _selectedIndex = index;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ));
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.resumed) {
      print("Resumed app");
    }
    else if(state == AppLifecycleState.inactive) {
      print("App is inactivate");
    }
    else if(state == AppLifecycleState.detached) {
      print("app is in detache mode");
      return;
    }
    else if(state == AppLifecycleState.paused) {
      print("App is Paused");
    }
  }

  @override
  Widget build(BuildContext context) {

    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;


    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.blue,
      statusBarIconBrightness: Brightness.light,
    ));
              // print(" bottombar ${IsBottom}");
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab = !await _navigatorKeys[_currentPage]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentPage != "Page1") {
            _selectTab("Page1", 1);
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: SafeArea(

        child: Scaffold(
          body: Stack(
            children: [
              _buildOffstageNavigator("Page1"),
              _buildOffstageNavigator("Page2"),
              _buildOffstageNavigator("Page3"),
              _buildOffstageNavigator("Page4"),
              _buildOffstageNavigator("Page5"),
            ],
          ),
          bottomNavigationBar : BottomNavigation(context),
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
          navigatorKey: _navigatorKeys[tabItem]!,
          tabItem: tabItem,
          tabManualCallback: (item, index) {
            _selectTab(item, index);
          }
      ),
    );
  }



  Widget BottomNavigation(BuildContext context) {
    // double main_Height = MediaQuery.of(context).size.height;
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;


    return PersistentTabView(
      context,
      controller: _controller,
      navBarStyle: NavBarStyle.style3,
      resizeToAvoidBottomInset: true,
      // navBarHeight: main_Height /14,

      items: [

        PersistentBottomNavBarItem(
          icon: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                SvgPicture.asset("assets/images/Home.svg",
                  // width:  22,
                  width:  main_Height * 0.026,
                  height: main_Height * 0.026,
                ),
                Text("Home",
                  style: TextStyle(
                      fontSize: main_Height * 0.0118,
                      color: Colors.red
                  ),)
              ],
            ),
          ),
          // icon: Icon(CupertinoIcons.house_fill),
          inactiveIcon: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset("assets/images/Home1.svg",
                  width:  main_Height * 0.026,
                  height: main_Height * 0.026,
                ),
                Text("Home",
                  style: TextStyle(
                      fontSize: main_Height * 0.0118,
                      color: Color(0xFFADADAD)
                  ),)
              ],
            ),
          ),
          activeColorPrimary: Colors.red,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),


        PersistentBottomNavBarItem(
          // icon: SvgPicture.asset("assets/icons/home.svg"),
          icon: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset("assets/images/save12.svg",
                  width:  main_Height * 0.026,
                  height: main_Height * 0.026,
                  fit: BoxFit.none,
                ),
                Text("Saved",
                  style: TextStyle(
                      fontSize: main_Height * 0.0118,
                      color: Colors.red
                  ),)
              ],
            ),
          ),
          inactiveIcon: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                SvgPicture.asset("assets/images/bad1.svg",
                  width:  main_Height * 0.026,
                  height: main_Height * 0.026,
                  fit: BoxFit.none,
                ),
                Text("Saved",
                  style: TextStyle(
                      fontSize: main_Height * 0.0118,
                      color: Color(0xFFADADAD)
                  ),)
              ],
            ),
          ),
          // title: ("SAVED"),
          // activeColorPrimary: Color.fromARGB(255, 17, 93, 152),
          // activeColorPrimary: Color.fromARGB(255, 105, 26, 71),
          activeColorPrimary: Colors.red,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),



        PersistentBottomNavBarItem(
          // icon: SvgPicture.asset("assets/icons/home.svg"),
          icon: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset("assets/images/Course.svg",
                  width:  main_Height * 0.026,
                  height: main_Height * 0.026,
                  fit: BoxFit.none,
                ),
                Text("Course",
                  style: TextStyle(
                      fontSize: main_Height * 0.0118,
                      color: Colors.red
                  ),)
              ],
            ),
          ),
          inactiveIcon: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset("assets/images/course1.svg",
                  width:  main_Height * 0.026,
                  height: main_Height * 0.026,
                  fit: BoxFit.none,
                ),
                Text("Course",
                  style: TextStyle(
                      fontSize: main_Height * 0.0118,
                      color: Color(0xFFADADAD)
                  ),)
              ],
            ),
          ),
          // title: ("COURSES"),
          // activeColorPrimary: Color.fromARGB(255, 17, 93, 152),
          // activeColorPrimary: Color.fromARGB(255, 105, 26, 71),
          activeColorPrimary: Colors.red,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),



        PersistentBottomNavBarItem(
          // icon: SvgPicture.asset("assets/icons/home.svg"),
          icon: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                SvgPicture.asset("assets/images/profile.svg",
                  width:  main_Height * 0.026,
                  height: main_Height * 0.026,
                  // fit: BoxFit.none,
                ),
                Text("Profile",
                  style: TextStyle(
                      fontSize: main_Height * 0.0118,
                      color: Colors.red
                  ),)
              ],
            ),
          ),
          inactiveIcon:SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset("assets/images/profile1.svg",
                  width:  main_Height * 0.026,
                  height: main_Height * 0.026,
                ),
                Text("Profile",
                  style: TextStyle(
                      fontSize: main_Height * 0.0118,
                      color: Color(0xFFADADAD)
                  ),)
              ],
            ),
          ),
          // title: ("PROFILE"),
          // activeColorPrimary: Color.fromARGB(255, 17, 93, 152),
          // activeColorPrimary: Color.fromARGB(255, 105, 26, 71),
          activeColorPrimary: Colors.red,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),


      ],

      screens: [
        HomeScreen(),
        ExpenseScreen(),
        InventoryScreen(),
        ProfileScreen()
      ],
    );
  }
}


class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;
  final Function(String tabItem, int index) tabManualCallback;
  TabNavigator({required this.navigatorKey,required this.tabItem, required this.tabManualCallback});

  @override
  Widget build(BuildContext context) {
    Widget? child;

    if(tabItem == "Page1")
      child = HomeScreen();
    else if(tabItem == "Page2")
      child = ExpenseScreen();
    else if(tabItem == "Page3")
      child = InventoryScreen();
    else if(tabItem == "Page4")
      child = ProfileScreen();




    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child!
        );
      },
    );
  }
}

