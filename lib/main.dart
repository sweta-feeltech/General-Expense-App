import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:general_expense_app/pages/Dashboard/add_home_Screen.dart';
import 'package:general_expense_app/pages/Dashboard/add_expense_screen.dart';
import 'package:general_expense_app/pages/Dashboard/add_inventory.dart';
import 'package:general_expense_app/pages/Dashboard/bottom_nav_bar.dart';
import 'package:general_expense_app/pages/Dashboard/category_screen.dart';
import 'package:general_expense_app/pages/Dashboard/expense_screen.dart';
import 'package:general_expense_app/pages/Dashboard/items_screen.dart';
import 'package:general_expense_app/pages/Group/group_list_screen.dart';
import 'package:general_expense_app/pages/Dashboard/home_screen.dart';
import 'package:general_expense_app/pages/Dashboard/room_screen.dart';
import 'package:general_expense_app/pages/Dashboard/edit_profile_screen.dart';
import 'package:general_expense_app/pages/Income_Expense/list_screen.dart';
import 'package:general_expense_app/pages/Dashboard/profile_screen.dart';
import 'package:general_expense_app/pages/Dashboard/shelf_screen.dart';
import 'package:general_expense_app/pages/Income_Expense/income_screen.dart';
import 'package:general_expense_app/pages/LoginRegistrationScreens/login_screen.dart';
import 'package:general_expense_app/pages/LoginRegistrationScreens/registration_screen.dart';
import 'package:general_expense_app/pages/LoginRegistrationScreens/splash_screen.dart';
import 'package:general_expense_app/pages/Widgets/nav_drawer.dart';
import 'package:general_expense_app/responsive/responsive_layout.dart';

import 'pages/LoginRegistrationScreens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await FkUserAgent.init();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  )
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, DeviceOrientation.portraitDown
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        fontFamily: 'Poppins',
      ),

      initialRoute: ResponsiveLayout.routeName,
      onGenerateRoute: globalGenerateRoute,
    );
  }

  static MaterialPageRoute? globalGenerateRoute(RouteSettings settings) {
    if(settings.name == ResponsiveLayout.routeName) {
      return getMaterialPageRoute(ResponsiveLayout(
        // mobileBody: OtpVerificationScreen(arguments: OtpVerificationScreenArguments("9725676540"),),
          mobileBody: SplashScreen(),
          TabletBody: SplashScreen()
      )
      );
    }

    //// FOR MOBILE SCREENS
    /// LOGINSCREEN AND SIGN UP AND VERIFICATION SCREEN
    if(settings.name == LogInScreen.routeName) {
      return getMaterialPageRoute(LogInScreen());
    }
    if(settings.name == MainPageScreen.routeName) {
      return getMaterialPageRoute(MainPageScreen());
    }
    if(settings.name == BottomNavBarScreen.routeName) {
      return getMaterialPageRoute(BottomNavBarScreen());
    }
    if(settings.name == ProfileScreen.routeName) {
      return getMaterialPageRoute(ProfileScreen(
              (){}

      ));
    }
    if(settings.name == EditProfileScreen.routeName) {
      return getMaterialPageRoute(EditProfileScreen(
              (){}
      ));
    }
    if(settings.name == ExpenseScreen.routeName) {
      return getMaterialPageRoute(ExpenseScreen((){}));
    }
    if(settings.name == CategoryScreen.routeName) {
      return getMaterialPageRoute(CategoryScreen());
    }
    if(settings.name == RoomScreen.routeName) {
      return getMaterialPageRoute(RoomScreen((){}));
    }
    if(settings.name == AddInventoryScreen.routeName) {
      return getMaterialPageRoute(AddInventoryScreen());
    }
    if(settings.name == NavDrawer.routeName) {
      return getMaterialPageRoute(NavDrawer());
    }

    if(settings.name == ListOfExpenses.routeName) {
      return getMaterialPageRoute(ListOfExpenses());
    }

    if(settings.name == ShelfScreen.routeName) {
      return getMaterialPageRoute(ShelfScreen());
    }
    if(settings.name == ItemScreen.routeName) {
      return getMaterialPageRoute(ItemScreen());
    }
    if(settings.name == ListofIncomeScreen.routeName) {
      return getMaterialPageRoute(ListofIncomeScreen());
    }

    if(settings.name == RegistrationScreen.routeName) {
      return getMaterialPageRoute(RegistrationScreen());
    }

    if(settings.name == AddExpenseScreen.routeName) {
      return getMaterialPageRoute(AddExpenseScreen((){

      }));
    }
    if(settings.name == GroupListScreen.routeName) {
      return getMaterialPageRoute(GroupListScreen());
    }
    if(settings.name == AddHomeScreen.routeName) {
      return getMaterialPageRoute(AddHomeScreen());
    }

    if(settings.name == EditProfileScreen.routeName) {
      return getMaterialPageRoute(EditProfileScreen(
        (){

        }
      ));
    }

}

  static MaterialPageRoute getMaterialPageRoute(
      Widget Screen,
      // {RouteSettings? setting}
      ) {
    return MaterialPageRoute(
      // settings: setting,
        builder: ((context) {
          return Screen;
        })
    );
  }
}



