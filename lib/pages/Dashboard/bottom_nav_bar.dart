import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:general_expense_app/pages/Dashboard/profile_screen.dart';
import 'package:general_expense_app/pages/Dashboard/room_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../Utils/colors.dart';
import 'add_expense_screen.dart';
import 'expense_screen.dart';
import 'home_screen.dart';


class BottomNavBarScreen extends StatefulWidget {
  static String routeName = "/homePageScreen";
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> with WidgetsBindingObserver {

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
      statusBarColor: primaryPurple,
      statusBarIconBrightness: Brightness.light,
    ));
    // print(" BottomNavBarScreen ${IsBottom}");
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
      navBarStyle: NavBarStyle.style15,
      resizeToAvoidBottomInset: true,
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,


      // navBarHeight: main_Height /14,

      items: [

        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            "assets/icons/home_1.svg",
            height: main_Height * 0.06,
            width: main_Height * 0.06,
            fit: BoxFit.none,
          ),
          // icon: Icon(CupertinoIcons.house_fill),
          inactiveIcon: SvgPicture.asset(
            "assets/icons/home.svg",
            height: main_Height * 0.06,
            width: main_Height * 0.06,
            fit: BoxFit.none,
          ),
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),


        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            "assets/icons/expense_1.svg",
            height: main_Height * 0.06,
            width: main_Height * 0.06,
            fit: BoxFit.none,
          ),
          // icon: Icon(CupertinoIcons.house_fill),
          inactiveIcon: SvgPicture.asset(
            "assets/icons/expense.svg",
            height: main_Height * 0.06,
            width: main_Height * 0.06,
            fit: BoxFit.none,
          ),
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),


        PersistentBottomNavBarItem(
          icon: Icon(Icons.add,
          color: Colors.white,),
          // icon: Icon(CupertinoIcons.house_fill),
          // inactiveIcon: Icon(Icons.add,
          //   color: Colors.white,),
          // inactiveColorPrimary: primaryPurple,
          activeColorPrimary: primaryPurple,
          // inactiveColorSecondary: primaryOrange
        ),


        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            "assets/icons/inventory_1.svg",
            height: main_Height * 0.06,
            width: main_Height * 0.06,
            fit: BoxFit.none,
          ),
          // icon: Icon(CupertinoIcons.house_fill),
          inactiveIcon: SvgPicture.asset(
            "assets/icons/inventory.svg",
            height: main_Height * 0.06,
            width: main_Height * 0.06,
            fit: BoxFit.none,
          ),
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),


        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            "assets/icons/profile_1.svg",
            height: main_Height * 0.06,
            width: main_Height * 0.06,
            fit: BoxFit.none,
          ),
          // icon: Icon(CupertinoIcons.house_fill),
          inactiveIcon: SvgPicture.asset(
            "assets/icons/profile.svg",
            height: main_Height * 0.06,
            width: main_Height * 0.06,
            fit: BoxFit.none,
          ),
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),



      ],

      screens: [
        HomeScreen(),

        ExpenseScreen((){
          Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
        }),

        AddExpenseScreen(),

        RoomScreen((){
          Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
        }),

        ProfileScreen((){
          Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
        }),
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

    // if(tabItem == "Page1")
    //   child = TabletHomePage();
    // else if(tabItem == "Page2")
    //   child = BellPage();
    // else if(tabItem == "Page3")
    //   child = Text("Calender");
    // else if(tabItem == "Page4")
    //   child = Text("person");

    if (tabItem == "Page1")
      child = HomeScreen();
    else if (tabItem == "Page2"){
      child = ExpenseScreen(
              (){
            tabManualCallback("Page1", 0);
          }
      );}
    else if (tabItem == "Page3"){
      child = AddExpenseScreen();
    }
    else if (tabItem == "Page4"){
      child = RoomScreen(

              () {
            tabManualCallback("Page1", 0);
          }

      );
    }
    else if (tabItem == "Page5"){
      child = ProfileScreen(
              () {
            tabManualCallback("Page1", 0);
          }

      );
    }


    // if (tabItem == "Page1")
    //   child = DashboardScreen();
    // else if (tabItem == "Page2"){
    //   child = SingleCourse();
    // }else if (tabItem == "Page2"){
    //   child = SubscriptionPriceScreen();
    // }else if (tabItem == "Page2"){
    //   child = ProfileScreen();
    // }




    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child!
        );
      },
    );
  }
}

