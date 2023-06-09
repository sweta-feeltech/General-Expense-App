import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general_expense_app/Utils/colors.dart';
import 'package:general_expense_app/pages/Dashboard/search_all_data_screen.dart';
import 'package:general_expense_app/pages/Dashboard/view_all_income_expense.dart';
import 'package:general_expense_app/pages/Locations/room_screen.dart';
import 'package:general_expense_app/pages/LoginRegistrationScreens/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../Utils/api_end_points.dart';
import '../../Utils/constants.dart';
import 'dart:math' as math;
import '../../blocs/ProfileScreen/profile_screen_bloc.dart';
import '../../models/ProfileModel/get_profile_model.dart';
import '../../network/api_client.dart';
import '../../network/repository.dart';
import '../Group/group_list_screen.dart';
import '../Widgets/theme_helper.dart';
import '../Locations/add_home_Screen.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = '/profileScreen';
  Function backPressCallback;

  ProfileScreen(this.backPressCallback,{super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  Repository repositoryRepo = Repository(ApiClient(httpClient: http.Client()));


  ProfileScreenBloc profileScreenBloc =
  ProfileScreenBloc(Repository.getInstance());

  GetProfileModel? profileDataListModelData;

  @override
  void initState() {
    super.initState();
    loadAllProfileScreenApiCalls();
  }

  void loadAllProfileScreenApiCalls() {
    profileScreenBloc.add(FetchAllProfileScreenScreenAPIsEvent());
  }

  @override
  Widget build(BuildContext context) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocProvider<ProfileScreenBloc>(
        create: (context) =>
        profileScreenBloc..add(ProfileScreenInitialEvent()),
        child: BlocConsumer<ProfileScreenBloc, ProfileScreenState>(
          builder: (context, state) {
            if (state is ProfileScreenLoadingEventState) {
              return ThemeHelper.buildLoadingWidget();
            } else if (state is FetchAllProfileScreenAPIsEventState) {
              print("hi2");
              profileDataListModelData = state.profileDataListModelData;
              print("hi");
              return ProfileScreenViewWidget();

            } else {
              print("notsuth");
              return ProfileScreenViewWidget();
            }
          },
          listener: (context, state) {
            if (state is ApiFailureState) {


              ThemeHelper.customDialogForMessage(
                  context,
                  (state.exception.toString().replaceAll('Exception:', ''))
                      .replaceAll(':', ''),
                  MediaQuery.of(context).size.width, () {
                Navigator.of(context, rootNavigator: true).pop();
                ProfileScreenViewWidget();
              }, ForSuccess: false);

            }
          },
        ),
      ),
    );
  }


  Widget ProfileScreenViewWidget(){

    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,

      body: WillPopScope(
        onWillPop: () async{
          widget.backPressCallback.call();
          return true;
        },
        child: RefreshIndicator(
          onRefresh: () async {
            loadAllProfileScreenApiCalls();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [

                AppBar(
                  centerTitle: false,
                  titleSpacing: 15,
                  backgroundColor: primaryPurple,
                  // elevation: 10,
                  // leading:   IconButton(
                  //   padding: EdgeInsets.zero,
                  //   constraints: BoxConstraints(minHeight: 20, minWidth: 20),
                  //   onPressed: () {
                  //     widget.backPressCallback.call();
                  //   },
                  //   icon: const Icon(Icons.arrow_back, color: Colors.white),
                  // ),
                  title:  Text("Setting",
                    style:
                    TextStyle(color: Colors.white, fontSize: main_Height * 0.022),),
                ),
                const Divider(thickness: 0.1,height: 0.1, indent: 0, endIndent: 0,color: primaryGrey,),
                Container(
                  decoration: const BoxDecoration(
                      color: primaryPurple
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(3),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: primaryGrey,
                              ),
                              child:  ClipOval(
                                child: Material(
                                    child: Container(
                                      height: main_Height * 0.06,
                                      width: main_Height * 0.06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10.0),
                                          image: DecorationImage(
                                            image:
                                            profileDataListModelData?.profilePic == ""
                                                ?
                                            AssetImage(
                                                "assets/images/avtar.png")
                                            as ImageProvider
                                                : NetworkImage(
                                                "$BASEIMAGEURL${profileDataListModelData?.profilePic}"),
                                            fit: BoxFit.fill,

                                          )),
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: main_Height * 0.015,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: main_Width * 0.4,
                                  child: Text("${profileDataListModelData?.firstName} ${profileDataListModelData?.lastName}",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: main_Height * 0.0218,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ),
                                Container(
                                  width: main_Width * 0.4,
                                  child: Text("${profileDataListModelData?.email}",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: main_Height * 0.0158,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: ElevatedButton(onPressed: () async {

                            String refresh = await Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
                                builder: (context) => EditProfileScreen((){})));
                            if(refresh == "refresh"){
                              loadAllProfileScreenApiCalls();
                            }
                          },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)
                                  )
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            ),
                            child: Text("Edit Profile",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: main_Height * 0.015,
                                  color: primaryPurple,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    children: [
                      Text("Settings ",
                        style: TextStyle(
                          letterSpacing: 0.5,
                          fontSize: main_Height * 0.017,
                          // fontSize: main_Height * 0.04,
                          fontWeight: FontWeight.w500,
                          color: darkGrey,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(7),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Column(
                        children: [

                          ListTile(
                            onTap: (){

                              Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context)=>SearchAllData()));

                            },
                            title: Row(
                              children:  [
                                SizedBox(width: 20,),
                                Align(
                                    alignment: Alignment.center,
                                    child: Transform(
                                      transform:Matrix4.rotationY(math.pi),
                                      child: const Icon(Icons.search_outlined,
                                        color: primaryPurple,
                                      ),
                                    )
                                ),
                                Text("Find All", style: TextStyle(fontSize: main_Height * 0.019, fontWeight: FontWeight.w500),),
                              ],
                            ),
                          ),
                          const Divider(thickness: 1,height: 0, indent: 20, endIndent: 20),

                          ListTile(
                            onTap: (){
                              Navigator.of(context, rootNavigator: true).pushNamed(GroupListScreen.routeName);                            },
                            title: Row(
                              children:  [
                                SizedBox(width: 2),
                                const Align(
                                  alignment: Alignment.center,
                                  child: Icon(Icons.group,color: primaryPurple,),
                                ),
                                SizedBox(width: main_Height * 0.020,),
                                Text("Group", style: TextStyle(fontSize: main_Height * 0.019, fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),

                          const Divider(thickness: 1,height: 0, indent: 20, endIndent: 20),

                          ListTile(
                            onTap: () async{

                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddHomeScreen(
                                      (){

                                  }
                              )));

                            },
                            title: Row(
                              children:  [
                                const SizedBox(width: 2),
                                const Align(
                                  alignment: Alignment.center,
                                  child: Icon(Icons.home,color: primaryPurple,),
                                ),
                                SizedBox(width: main_Height * 0.020,),
                                Text("Home", style: TextStyle(fontSize: main_Height * 0.019, fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),

                          const Divider(thickness: 1,height: 0, indent: 20, endIndent: 20),

                          ListTile(
                            onTap: () async{

                              Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context)=>ViewallIncomeExpense()));

                            },
                            title: Row(
                              children:  [
                                const SizedBox(width: 2),
                                const Align(
                                  alignment: Alignment.center,
                                  child: Icon(Icons.money,color: primaryPurple,),
                                ),
                                SizedBox(width: main_Height * 0.020,),
                                Text("Income Expense", style: TextStyle(fontSize: main_Height * 0.019, fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),



                        ],
                      ),
                    ),
                  ),
                ),


                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    children: [
                      Text("Account Settings ",
                        style: TextStyle(
                          letterSpacing: 0.5,
                          fontSize: main_Height * 0.017,
                          // fontSize: main_Height * 0.04,
                          fontWeight: FontWeight.w500,
                          color: darkGrey,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(7),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Column(
                        children: [

                          ListTile(
                            onTap: () async{

                              String refresh = await Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
                                  builder: (context) => EditProfileScreen((){})));

                              if(refresh == "refresh"){
                              }
                            },
                            title: Row(
                              children:  [
                                const SizedBox(width: 2),
                                const Align(
                                  alignment: Alignment.center,
                                  child: Icon(Icons.person,color: primaryPurple,),
                                ),
                                SizedBox(width: main_Height * 0.020,),
                                Text("My Profile", style: TextStyle(fontSize: main_Height * 0.019, fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),


                          const Divider(thickness: 1,height: 0, indent: 20, endIndent: 20),

                          ListTile(
                            onTap: () async {
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              prefs.remove('accessSession');
                              accessToken = null;
                              appUserData = null;
                              Navigator.of(context,rootNavigator: true)
                                  .pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>MainPageScreen()), (route) => false);
                            },
                            title: Row(
                              children:  [
                                SizedBox(width: 20,),
                                Align(
                                    alignment: Alignment.center,
                                    child: Transform(
                                      transform:Matrix4.rotationY(math.pi),
                                      child: const Icon(Icons.logout,
                                        color: primaryPurple,
                                      ),
                                    )
                                ),
                                Text("Logout", style: TextStyle(fontSize: main_Height * 0.019, fontWeight: FontWeight.w500),),
                              ],
                            ),
                          ),




                        ],
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),

        ),

      ),

    );

  }


}
