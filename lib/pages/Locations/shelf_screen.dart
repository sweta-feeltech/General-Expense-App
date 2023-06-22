import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/colors.dart';
import '../../blocs/Locations/AddShelfScreen/add_shelf_list_screen_bloc.dart';
import '../../models/CommonModel/message_model.dart';
import '../../models/Locations/shelf_list_model.dart';
import '../../network/repository.dart';
import '../Widgets/common_widgets.dart';
import '../Widgets/theme_helper.dart';


class ShelfScreen extends StatefulWidget {
  static String routeName = '/ShelfScreen';
  final String roomId;
  ShelfScreen(this.roomId,{super.key});

  @override
  State<ShelfScreen> createState() => _ShelfScreenState();
}

class _ShelfScreenState extends State<ShelfScreen> {

  ShelfListScreenBloc shelfListScreenBloc =
  ShelfListScreenBloc(Repository.getInstance());

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String searchQuery = '';
  List<GetShelfListModel> searchResults = [];


  List<GetShelfListModel>? getShelfListModelData;
  MessageModel? messageModelData;

  String? shelfLocationName;
  String? Description;

  bool? allData;

  @override
  void initState() {
    super.initState();
    allData = false;
    loadAllShelfListScreenApiCalls();
  }

  void loadAllShelfListScreenApiCalls() {
    //TODO: remove static values
    shelfListScreenBloc.add(FetchAllShelfListScreenAPIsEvent("${widget.roomId}"));
  }


  @override
  Widget build(BuildContext context) {

    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return BlocProvider<ShelfListScreenBloc>(
        create: (context) =>
        shelfListScreenBloc..add(shelfListScreenInitialEvent()),
        child: BlocConsumer<ShelfListScreenBloc, ShelfListScreenState>(
          builder: (context, state) {
            if (state is ShelfListScreenLoadingEventState) {
              return ThemeHelper.buildLoadingWidget();
            } else if (state is FetchAllShelfListScreenAPIsEventState) {
              getShelfListModelData = state.getShelfListModelData;
              return mainViewShelfListScreenViewWidget();
            }
            else if (state is PostCreateShelfEventState){
              messageModelData = state.messageModelData;
              loadAllShelfListScreenApiCalls();
              return mainViewShelfListScreenViewWidget();
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
                loadAllShelfListScreenApiCalls();
              }, ForSuccess: false);



            }
          },
        ));

  }




  Widget  mainViewShelfListScreenViewWidget(){
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return WillPopScope(

      onWillPop: () async{

        Navigator.of(context).pop();
        return true;
      },

      child: Scaffold(
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
            "Shelf",
            style: TextStyle(color: Colors.white, fontSize: main_Height * 0.025),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: primaryPurple,
          elevation: 0,
          centerTitle: false,
        ),

        body:

        RefreshIndicator(
          onRefresh: ()async{
            loadAllShelfListScreenApiCalls();
          },
          child: Column(
            children: [

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: main_Width * 0.03, vertical: main_Height * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Add Shelf",
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

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: main_Width * 0.03, vertical: main_Height * 0.005),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: main_Height * 0.015), // Adjust vertical padding
                    hintText: 'Search Shelf . . ',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onTap: (){
                    allData = true;

                  },
                  onChanged: (value) {
                    print("ccc");
                          setState(() {
                            print("ccc");
                            allData = true;
                            searchQuery = value;
                            searchResults = getShelfListModelData!.where((item) =>
                                item.description!.toLowerCase().contains(searchQuery.toLowerCase()) ||
                                    item.shelfLocationName!.toLowerCase().contains(searchQuery.toLowerCase())
                            ).toList();
                          });
                    // Do something with the search query
                  },

                ),

              ),

              getShelfListModelData?.isEmpty == true ?

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/images/stupid 2.svg",
                    height: main_Height * 0.3,
                  ),
                ],
              )
              // Expanded(
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //
              //     children: [
              //       SizedBox(
              //         height: main_Height * 0.1,
              //       ),
              //
              //   SvgPicture.asset(
              //     "assets/images/stupid 2.svg",
              //     height: main_Height * 0.4 ,
              //   ),
              //
              //
              //
              //       SizedBox(
              //         height: main_Height * 0.04,
              //       ),
              //
              //
              //     ],
              //   ),
              // )
                  :
              Expanded(
                child: ListView.builder(
                    itemCount: allData == false ? getShelfListModelData!.length : searchResults!.length,
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return CommonWidgets.CommonListShelf(context,index: index,
                      getShelfListModelData:   allData == false ?  getShelfListModelData![index] : searchResults![index]
                      );
                    }),
              ),



            ],
          ),
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
                                "Add Shelf",
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
                                    shelfLocationName = onSavedVal1;
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Shelf Name can\'t be empty';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      isDense: true,
                                      hintText: "Enter a Shelf name",
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

                                            print("hhname${shelfLocationName} ${Description}   ${widget.roomId}");


                                            shelfListScreenBloc.add(PostCreateShelfEvent("${shelfLocationName}","${Description}","${widget.roomId}"));
                                            // roomListScreenBloc.add(PostCreateRoomEvent("${RoomLocationName}","${Description}","${widget.homeId}"));

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
                              child: Icon(Icons.dashboard,color: Colors.white, size: 40,)
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