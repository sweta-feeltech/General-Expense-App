import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:general_expense_app/models/CommonModel/message_model.dart';
import 'package:general_expense_app/models/Locations/home_list_model.dart';
import 'package:general_expense_app/pages/Widgets/common_widgets.dart';
import '../../Utils/colors.dart';
import '../../blocs/Locations/AddHomeScreen/add_home_list_screen_bloc.dart';
import '../../network/repository.dart';
import '../Widgets/theme_helper.dart';

class AddHomeScreen extends StatefulWidget {
  static String routeName = 'AddHomeScreen';
  Function backPressCallback;
  AddHomeScreen(this.backPressCallback,{super.key});

  @override
  State<AddHomeScreen> createState() => _AddHomeScreenState();
}

class _AddHomeScreenState extends State<AddHomeScreen> {

  HomeListScreenBloc homeListScreenBloc =
  HomeListScreenBloc(Repository.getInstance());

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<GetHomeListModel>? getHomeListModelData;
  MessageModel? messageModelData;

  String? HomeLocationName;
  String? Description;


  @override
  void initState() {
    super.initState();
    loadAllHomeListScreenApiCalls();
  }

  void loadAllHomeListScreenApiCalls() {
    //TODO: remove static values
    homeListScreenBloc.add(FetchAllHomeListScreenAPIsEvent());
  }

  @override
  Widget build(BuildContext context) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return BlocProvider<HomeListScreenBloc>(
        create: (context) =>
        homeListScreenBloc..add(HomeListScreenInitialEvent()),
        child: BlocConsumer<HomeListScreenBloc, HomeListScreenState>(
          builder: (context, state) {
            if (state is HomeListScreenLoadingEventState) {
              return ThemeHelper.buildLoadingWidget();
            } else if (state is FetchAllHomeListScreenAPIsEventState) {
              getHomeListModelData = state.getHomeListModelData;

              return mainViewHomeListScreenViewWidget();
            }
            else if (state is PostCreateHomeEventState){
              messageModelData = state.messageModelData;
              loadAllHomeListScreenApiCalls();
              return mainViewHomeListScreenViewWidget();
            }
            else {
              return Container();
            }
          },
            listener: (context, state) {
              if (state is APIFailureState) {

                ThemeHelper.customDialogForMessage(
                    context,
                    (state.exception.toString().replaceAll('Exception:', ''))
                        .replaceAll(':', ''),
                    MediaQuery.of(context).size.width, () {

                  Navigator.of(context).pop();
                  loadAllHomeListScreenApiCalls();
                }, ForSuccess: false);



              }
            },
        ));
  }


  Widget mainViewHomeListScreenViewWidget (){
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: primaryGrey,

      appBar: AppBar(
        // leading: IconButton(
        //   padding: EdgeInsets.zero,
        //   constraints: BoxConstraints(minHeight: 20, minWidth: 20),
        //   onPressed: () {
        //     widget.backPressCallback.call();
        //     // Navigator.of(context).pop();
        //   },
        //   icon: const Icon(Icons.arrow_back, color: Colors.black),
        // ),
        titleSpacing: 15,
        title: Text(
          "Home",
          style: TextStyle(color: Colors.white, fontSize: main_Height * 0.022),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: primaryPurple,
        elevation: 0,
        centerTitle: false,
      ),

      body: RefreshIndicator(
        onRefresh: () async {
          loadAllHomeListScreenApiCalls();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: main_Width * 0.03, vertical: main_Height * 0.015),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Add Home",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        letterSpacing: 1,
                        fontSize: main_Height * 0.021,
                        fontWeight: FontWeight.w500
                    ),
                  ),

                  InkWell(
                    onTap: (){
                      _displayTextInputDialog(context);

                    },
                    child: Container(
                      height: main_Height * 0.05,
                      width: main_Height * 0.05,
                      child: SvgPicture.asset("assets/images/add.svg",
                        fit: BoxFit.fill,),
                    ),
                  )


                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: main_Width * 0.035),
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  childAspectRatio: 6/5,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  padding: EdgeInsets.only(bottom: main_Height * 0.005),
                  children: List.generate(
                      getHomeListModelData!.length,
                          (index) {
                        return CommonWidgets.CommonHomeList(context,index: index,
                        getHomeListModelData: getHomeListModelData![index]
                        );
                      }
                  ),
                ),
              ),

            ),

          ],
        ),
      ),

    );

  }


  Future<void> _displayTextInputDialog(BuildContext context) async {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

    return showDialog(
        context: context,
        builder: (context) {
          double main_Width = MediaQuery.of(context).size.width;
          double main_Height = MediaQuery.of(context).size.height;

          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Form(
              key: _formkey,
              child: Stack(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.none,
                children: [
                  Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        // color: Color.fromARGB(255, 217, 231, 250),
                        color: Colors.white,
                      ),
                      height: main_Height * 0.35,
                      width: main_Width * 0.7,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 15,),

                              Text(
                                "Add Home",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              SizedBox(height: 10,),
                              // SizedBox(height: main_Height * 0.0235,),
                              // Image(image: AssetImage("assets/images/logout_reverse.png"), width: 30, height: 30,),

                              TextFormField(
                                  onSaved: (onSavedVal1) {
                                    HomeLocationName = onSavedVal1;
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Home Name can\'t be empty';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText: "Enter a Home name",
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: darkGrey,
                                        fontSize: main_Height * 0.018),
                                      // enabledBorder: UnderlineInputBorder(
                                      //   borderSide: BorderSide(color: primaryPurple)
                                      // ),
                                    focusedBorder:UnderlineInputBorder(
                                        borderSide: BorderSide(color: primaryPurple,width: 2)
                                    )
                                  ),
                                  textInputAction: TextInputAction.next
                              ),
                              SizedBox(height: main_Height * 0.0135,),

                              TextFormField(
                                  onSaved: (onSavedVal2) {
                                    Description = onSavedVal2;
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Description can\'t be empty';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      isDense: true,
                                      hintText: "Description",
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: darkGrey,
                                          fontSize: main_Height * 0.018),
                                      // enabledBorder: UnderlineInputBorder(
                                      //   borderSide: BorderSide(color: primaryPurple)
                                      // ),
                                      focusedBorder:UnderlineInputBorder(
                                          borderSide: BorderSide(color: primaryPurple,width: 2)
                                      )
                                  ),
                                  textInputAction: TextInputAction.next
                              ),
                              SizedBox(height: main_Height * 0.0235,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: BorderSide(color: primaryPurple)))
                                      ),
                                      child: Text("Cancel", style: TextStyle(color: primaryPurple, fontSize: main_Height * 0.01872,),overflow: TextOverflow.ellipsis,)
                                  ),
                                  SizedBox(width: 5,),

                                  SizedBox(
                                    width: 75,
                                    child: TextButton(
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: BorderSide(color:primaryPurple))),
                                            backgroundColor: MaterialStateProperty.all(primaryPurple)
                                        ),
                                        onPressed: (){
                                          if (_formkey.currentState!.validate()) {
                                            _formkey.currentState!.save();

                                            print("hhname${HomeLocationName} ${Description}");

                                            homeListScreenBloc.add(PostCreateHomeEvent("${HomeLocationName}","${Description}"));

                                            Navigator.of(context).pop();
                                          }
                                        },
                                        child: Text("Add",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: main_Height * 0.01872,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500
                                          ),
                                        )
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                      top: -35,
                      child: Material(
                        borderRadius: BorderRadius.circular(60),
                        // elevation: 4,
                        // elevation: 10,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle
                          ),
                          child: CircleAvatar(
                            // backgroundColor: Colors.white,
                              backgroundColor: primaryPurple,
                              radius: 35,
                              // child: Icon(Icons.home, size: 35,)
                              child: Icon(Icons.home,color: Colors.white, size: 40,)
                            // child: Image.asset("assets/images/app_icon_png.png", width: 80, height: 80,)
                          ),
                        ),
                      )
                  )
                ],
              ),
            ),
          );
        }
    );
  }


}
