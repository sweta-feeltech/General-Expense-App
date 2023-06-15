import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general_expense_app/blocs/SearchScreenBloc/search_list_screen_bloc.dart';
import 'package:general_expense_app/models/CustomModel/vertical_search_list_model.dart';
import 'package:general_expense_app/models/DashboardModel/search_allData_model.dart';

import '../../Utils/colors.dart';
import '../../models/CustomModel/horizontal_search_list_model.dart';
import '../../network/repository.dart';
import '../Widgets/common_widgets.dart';
import '../Widgets/theme_helper.dart';


class SearchAllData extends StatefulWidget {
  const SearchAllData({Key? key}) : super(key: key);

  @override
  State<SearchAllData> createState() => _SearchAllDataState();
}

class _SearchAllDataState extends State<SearchAllData> {



  SearchListScreenBloc searchListScreenBloc =
  SearchListScreenBloc(Repository.getInstance());

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String searchQuery = '';

  List<VerticalSearchListModel> searchResultsVertical = [];
  List<HorizontalSearchListModel> searchResultsHorizontal = [];
  ///
  /// VERTICAL
  ///
  List<TblExpense>? SearchResTblExpense;
  List<TblIncome>? SearchResTblIncome;
  List<TblGroupMember>? SearchResTblgrpmember;
  List<TblShelfLocation>? SearchResTblShelf;
  List<TblItem>? SearchResTblItem;
  
  List<VerticalSearchListModel> verticalSearchListModelData = [];

  ///
  /// HORIZONTAL
  ///
  List<TblGroup>? SearchResTblGroup;
  List<TblHomeLocation>? SearchResTblHome;
  List<TblRoomLocation>? SearchResTblRoom;


  ///
  ///
  /// MERGE LIST
  ///
  ///

  List<VerticalSearchListModel> mergeListVertical(
  // List<dynamic> mergeListVertical(
  List<TblExpense> SearchResTblExpense,
  List<TblIncome> SearchResTblIncome,
  List<TblGroupMember> SearchResTblgrpmember,
  List<TblShelfLocation> SearchResTblShelf,
  List<TblItem> SearchResTblItem) {
    // List<dynamic> mergedVerticalList = [];
    List<VerticalSearchListModel> mergedVerticalList = [];

    for(int i = 0; i < SearchResTblExpense.length; i++) {
      mergedVerticalList.add(VerticalSearchListModel(id: SearchResTblExpense[i].id, title: SearchResTblExpense[i].remarks, date: SearchResTblExpense[i].expenseDate, amount: SearchResTblExpense[i].amount.toString(), transctionType: SearchResTblExpense[i].expenseDate != null ? "expense" : ""));
    }

    for(int i = 0; i < SearchResTblIncome.length; i++) {
      mergedVerticalList.add(VerticalSearchListModel(id: SearchResTblIncome[i].id, title: SearchResTblIncome[i].description, date: SearchResTblIncome[i].incomeDate, amount: SearchResTblIncome[i].amount.toString(), transctionType: SearchResTblIncome[i].incomeDate != null ? "income" : ""));
    }

    // for(int i = 0; i < SearchResTblgrpmember.length; i++) {
    //   mergedVerticalList.add(VerticalSearchListModel(id: SearchResTblgrpmember[i].id, title: SearchResTblgrpmember[i]., date:  SearchResTblgrpmember![i].createdDate.toString() , amount: SearchResTblgrpmember![i].isGroupAdmin.toString() == true ? "Admin" : "Member"));
    // }

    for(int i = 0; i < SearchResTblShelf.length; i++) {
      mergedVerticalList.add(VerticalSearchListModel(id: SearchResTblShelf[i].id, title: SearchResTblShelf[i].shelfLocationName, date:  SearchResTblShelf[i].createdDate , amount: SearchResTblShelf[i].status.toString(),itemtype: SearchResTblShelf![i].shelfLocationName != null ? "shelf" : ""));
    }

    for(int i = 0; i < SearchResTblItem.length; i++) {
      mergedVerticalList.add(VerticalSearchListModel(id: SearchResTblItem[i].id, title: SearchResTblItem[i].itemName, date:  SearchResTblItem[i].createdDate.toString() , amount: SearchResTblItem[i].price.toString(), itemtype: SearchResTblItem[i].itemName != null ? "item" : ""));
    }

    for(int i = 0; i < mergedVerticalList.length; i++) {
      print("sdhfjksdbf ksdjlfhsf klsjdhf: ${mergedVerticalList[i].id} ${mergedVerticalList[i].amount} ${mergedVerticalList[i].title} ${mergedVerticalList[i].date}  ${mergedVerticalList[i].transctionType}");

    }



    // mergedVerticalList.addAll(SearchResTblIncome);
    // mergedVerticalList.addAll(SearchResTblExpense);
    // mergedVerticalList.addAll(SearchResTblgrpmember);
    // mergedVerticalList.addAll(SearchResTblShelf);
    // mergedVerticalList.addAll(SearchResTblItem);

    // print("llllll : ${mergedVerticalList}");
    //
    //
    // return mergedVerticalList;

    return mergedVerticalList;
  }

   List<VerticalSearchListModel>? verticalListData;


  List<HorizontalSearchListModel> mergeListHorizontal(
      // List<dynamic> mergeListVertical(
      List<TblGroup> SearchResTbGroup,
      List<TblHomeLocation> SearchResTblHomeLocation,
      List<TblRoomLocation> SearchResTblRoomLocation,
      ) {
    // List<dynamic> mergedVerticalList = [];
    List<HorizontalSearchListModel> mergedHorizontalList = [];

    for(int i = 0; i < SearchResTblGroup!.length; i++) {
      mergedHorizontalList.add(HorizontalSearchListModel(id: SearchResTblGroup![i].id, title:SearchResTblGroup![i].groupName, desc:SearchResTblGroup![i].description,  boxtype:SearchResTblGroup![i].groupName != null ? "Group" : ""));
    }

    for(int i = 0; i < SearchResTblHome!.length; i++) {
      mergedHorizontalList.add(HorizontalSearchListModel(id: SearchResTblHome![i].id, title:SearchResTblHome![i].homeLocationName, desc:SearchResTblHome![i].description,  boxtype:SearchResTblHome![i].homeLocationName != null ? "Home" : ""));
    }

    for(int i = 0; i < SearchResTblRoom!.length; i++) {
      mergedHorizontalList.add(HorizontalSearchListModel(id: SearchResTblRoom![i].id, title:SearchResTblRoom![i].roomLocationName, desc:SearchResTblHome![i].description,  boxtype:SearchResTblRoom![i].roomLocationName != null ? "Room" : ""));
    }


    return mergedHorizontalList;
  }

  List<HorizontalSearchListModel>? horizontalSearchListModelData;




  GetSerachModel? getSerachModelData;

  bool? allData1;
  bool? allData2;

  @override
  void initState() {
    super.initState();
    allData1 = false;
    allData2 = false;
    loadAllSearchListScreenApiCalls();
  }

  void loadAllSearchListScreenApiCalls() {

    searchListScreenBloc.add(FetchAllSearchListScreenAPIsEvent());
  }




  @override
  Widget build(BuildContext context) {


    return BlocProvider<SearchListScreenBloc>(
        create: (context) =>
        searchListScreenBloc..add(SearchListScreenInitialEvent()),
        child: BlocConsumer<SearchListScreenBloc,SearchListScreenState>(
          builder: (context, state) {
            if (state is SearchListScreenInitialState) {
              return ThemeHelper.buildLoadingWidget();
            } else if (state is FetchAllSearchListScreenAPIsEventState) {
              getSerachModelData = state.getSerachModelData;


              SearchResTblExpense  = state.getSerachModelData?.tblExpense;
              SearchResTblIncome  = state.getSerachModelData?.tblIncome;
              SearchResTblShelf  = state.getSerachModelData?.tblShelfLocation;
              SearchResTblItem  = state.getSerachModelData?.tblItem;
              SearchResTblgrpmember  = state.getSerachModelData?.tblGroupMember;

              verticalListData  =  mergeListVertical(SearchResTblExpense ?? [], SearchResTblIncome ?? [], SearchResTblgrpmember ?? [], SearchResTblShelf ?? [], SearchResTblItem ?? []);

              print("vert ${verticalListData}");


              // if(verticalSearchListModelData.isEmpty == true) {
              //   for(int i =0; i < (verticalListData?.length ?? 0); i++) {
              //     print("i: ${i}");
              //     print("i: ${verticalListData![i]}");
              //     if(verticalListData![i].runtimeType == TblIncome) {
              //       print(verticalListData![i].runtimeType);
              //       verticalSearchListModelData.add(VerticalSearchListModel(id: verticalListData![i].toString(), title: "sdjhbf", date: "sdkjh"));
              //     }
              //   }
              // }
              //
              //


              SearchResTblGroup  = state.getSerachModelData?.tblGroup;
              SearchResTblHome  = state.getSerachModelData?.tblHomeLocation;
              SearchResTblRoom  = state.getSerachModelData?.tblRoomLocation;

              horizontalSearchListModelData  =  mergeListHorizontal(SearchResTblGroup ?? [], SearchResTblHome ?? [], SearchResTblRoom ?? []);
              print("hori ${horizontalSearchListModelData![0].id}");





              return mainViewDataListScreenViewWidget();
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
                loadAllSearchListScreenApiCalls();
              }, ForSuccess: false);



            }
          },
        ));

  }


  Widget  mainViewDataListScreenViewWidget(){
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    // print("vvvll${verticalListData![0]["id"]}");
    // print("vvvll${verticalListData![1]}");
    // // print("vvvll${verticalListData![2]["amount"]}");
    // print("vvvll${verticalListData![3]}");
    // print("vvvll${verticalListData![4]}");
    // print("vvvll${verticalListData![5]}");

    return WillPopScope(

      onWillPop: () async{

        Navigator.of(context).pop();
        return true;
      },

      child: Scaffold(
        backgroundColor: primaryGrey,
        appBar: AppBar(
          titleSpacing: 15,
          title: Text(
            "Search All Data",
            style: TextStyle(color: Colors.white, fontSize: main_Height * 0.025),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: primaryPurple,
          elevation: 0,
          centerTitle: false,
        ),
        body:
        RefreshIndicator(
          onRefresh: () async{
            // loadAllShelfListScreenApiCalls();
          },
          child: Column(
            children: [

              ///
              ///
              /// SEARCH FEILD
              ///
              ///

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: main_Width * 0.03, vertical: main_Height * 0.005),
                child: TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: main_Height * 0.015), // Adjust vertical padding
                    hintText: 'Search Item . . ',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onTap: (){
                    allData1 = true;

                  },
                  onChanged: (value) {
                    print("ccc");
                    setState(() {
                      print("ccc");
                      allData1 = true;
                      allData2 = true;
                      searchQuery = value;

                      ///
                      /// Vertical Search Result
                      ///

                      searchResultsVertical = verticalListData!.where((item) =>
                      item.title!.toLowerCase().contains(searchQuery.toLowerCase()) ||
                          item.amount!.toLowerCase().contains(searchQuery.toLowerCase())
                      ).toList();


                      searchResultsHorizontal = horizontalSearchListModelData!.where((item) =>
                      item.title!.toLowerCase().contains(searchQuery.toLowerCase()) ||
                          item.desc!.toLowerCase().contains(searchQuery.toLowerCase())
                      ).toList();





                    });

                    ///
                    /// Horizontal Search Result
                    ///






                    // Do something with the search query
                  },

                ),

              ),


              ///
              ///
              /// HORIZONTAL LIST
              ///
              ///

              searchResultsHorizontal!.isEmpty == true  ?
              Container() :
              Container(
                height: main_Height * 0.2,
                width: main_Width,
                padding: EdgeInsets.symmetric(horizontal: main_Width * 0.025,),
                child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    itemCount:  allData2 == false ?  horizontalSearchListModelData!.length : searchResultsHorizontal!.length,
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return CommonWidgets.CommonHorizontalSearchList(context,
                          index: index,
                          horizontalSearchListModelData: allData2 == false ?  horizontalSearchListModelData![index] : searchResultsHorizontal![index]
                      );
                    }

                    ),

              ),


              ///
              ///
              /// VERTICAL LIST
              ///
              ///

              searchResultsVertical!.isEmpty == true ?
              Container() :
                Expanded(
                  child: ListView.builder(
                      itemCount:  allData1 == false ? verticalListData!.length : searchResultsVertical!.length,
                      physics: AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return CommonWidgets.CommonSearchVerticalListView(context,
                            verticalSearchListModelData: allData1 == false ? verticalListData![index] : searchResultsVertical![index]
                          // getItemListModelData:   allData1 == false ?  getSerachModelData!.tblExpense![index] : SearchReSTblExpense![index]
                        );
                      }),
                ),


            ],
          ),
        ),


      ),
    );


  }



}
