import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/colors.dart';
import '../../blocs/Locations/AddRoomScreen/add_room_list_screen_bloc.dart';
import '../../models/CommonModel/message_model.dart';
import '../../models/Locations/room_list_model.dart';
import '../../network/repository.dart';
import '../Widgets/common_widgets.dart';
import '../Widgets/theme_helper.dart';

class RoomScreen extends StatefulWidget {
  static String routeName = 'RoomScreen';
  final String homeId;
  RoomScreen(this.homeId,{super.key});

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {


  RoomListScreenBloc roomListScreenBloc =
  RoomListScreenBloc(Repository.getInstance());

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<GetRoomListModel>? getRoomListModelData;
  MessageModel? messageModelData;

  String? RoomLocationName;
  String? Description;
  String? HomeLocationId;

  @override
  void initState() {
    super.initState();
    loadAllRoomListScreenApiCalls();
  }

  void loadAllRoomListScreenApiCalls() {
    //TODO: remove static values
    roomListScreenBloc.add(FetchAllRoomListScreenAPIsEvent("${widget.homeId}"));
  }


  @override
  Widget build(BuildContext context) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return BlocProvider<RoomListScreenBloc>(
        create: (context) =>
        roomListScreenBloc..add(RoomListScreenInitialEvent()),
        child: BlocConsumer<RoomListScreenBloc, RoomListScreenState>(
          builder: (context, state) {
            if (state is RoomListScreenLoadingEventState) {
              return ThemeHelper.buildLoadingWidget();
            } else if (state is FetchAllRoomListScreenAPIsEventState) {
              getRoomListModelData = state.getRoomListModelData;

              return mainViewRoomListScreenViewWidget();
            }
            else if (state is PostCreateRoomEventState){
              messageModelData = state.messageModelData;
              loadAllRoomListScreenApiCalls();
              return mainViewRoomListScreenViewWidget();
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
                loadAllRoomListScreenApiCalls();
              }, ForSuccess: false);



            }
          },
        ));

  }

  Widget mainViewRoomListScreenViewWidget (){

    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: primaryGrey,

      appBar: AppBar(
        titleSpacing: 15,
        title: Text(
          "Room",
          style: TextStyle(color: Colors.white, fontSize: main_Height * 0.022),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: primaryPurple,
        elevation: 0,
        centerTitle: false,
      ),

      body: RefreshIndicator(
        onRefresh: ()async{
          loadAllRoomListScreenApiCalls();
        },
        child:

        getRoomListModelData?.isEmpty == true ?
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Center(
              //   child: SvgPicture.asset("assets/icons/group.svg",
              //     height: main_Height * 0.4,
              //   ),
              // ),
              //

              Center(
                child:   SvgPicture.asset(
                  "assets/images/stupid 2.svg",
                  height: main_Height * 0.4 ,
                ),
              ),


              //
              // Text(
              //   "You don't have any Room !",
              //   maxLines: 1,
              //   textAlign: TextAlign.center,
              //   overflow: TextOverflow.ellipsis,
              //   style: TextStyle(
              //     // color: Color.fromARGB(255, 158, 158, 158),
              //     color: Colors.grey,
              //     fontWeight: FontWeight.w500,
              //     fontSize: main_Height * 0.0239,
              //   ),
              // ),

              SizedBox(
                height: main_Height * 0.04,
              ),

              Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(30),
                child: SizedBox(
                  height: main_Height * 0.060,
                  width: main_Width * 0.5,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      side: BorderSide(
                          style: BorderStyle.none
                      ),
                      backgroundColor: primaryPurple,
                    ),
                    onPressed: () {

                      _displayTextInputDialog(context);

                    },
                    child: Text(
                      "Add Room",
                      style: TextStyle(
                          fontSize: main_Height < 700 ? 12 : 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              )

            ],
          ),
        ) :

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: main_Width * 0.03, vertical: main_Height * 0.015),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Add Rooms",
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
                      getRoomListModelData!.length,
                          (index) {
                        return CommonWidgets.CommonRoomList(context,index: index,
                          getRoomListModelData: getRoomListModelData![index]
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
                                "Add Room",
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
                                    RoomLocationName = onSavedVal1;
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Room Name can\'t be empty';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      isDense: true,
                                      hintText: "Enter a Room name",
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

                                            print("hhname${RoomLocationName} ${Description}  ${widget.homeId}");


                                            roomListScreenBloc.add(PostCreateRoomEvent("${RoomLocationName}","${Description}","${widget.homeId}"));

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
                              child: Icon(Icons.meeting_room,color: Colors.white, size: 40,)
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
