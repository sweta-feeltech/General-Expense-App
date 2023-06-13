import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:general_expense_app/blocs/Locations/ItemListScreen/item_list_screen_bloc.dart';
import 'package:general_expense_app/models/Locations/Item_list_model.dart';
import '../../Utils/colors.dart';
import '../../network/repository.dart';
import '../Dashboard/add_item_screen.dart';
import '../Widgets/common_widgets.dart';
import '../Widgets/theme_helper.dart';


class ItemListScreen extends StatefulWidget {
  static String routeName = '/ShelfScreen';
  final String shelfId;
  final String all;
  ItemListScreen(this.shelfId,this.all,{super.key});

  @override
  State<ItemListScreen> createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {


  ItemListScreenBloc itemListScreenBloc =
  ItemListScreenBloc(Repository.getInstance());

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String searchQuery = '';
  List<GetItemListModel> searchResults = [];


  List<GetItemListModel>? getItemListModelData;

  bool? allData1;

  @override
  void initState() {
    super.initState();
    allData1 = false;
    loadAllShelfListScreenApiCalls();
  }

  void loadAllShelfListScreenApiCalls() {
    //TODO: remove static values
    itemListScreenBloc.add(FetchAllItemListScreenAPIsEvent("${widget.shelfId}"));
  }



  @override
  Widget build(BuildContext context) {
    return BlocProvider<ItemListScreenBloc>(
        create: (context) =>
        itemListScreenBloc..add(ItemListScreenInitialEvent()),
        child: BlocConsumer<ItemListScreenBloc,ItemListScreenState>(
          builder: (context, state) {
            if (state is ItemListScreenLoadingEventState) {
              return ThemeHelper.buildLoadingWidget();
            } else if (state is FetchAllItemListScreenAPIsEventState) {
              getItemListModelData = state.getItemListModelData;
              return mainViewItemListScreenViewWidget();
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




  Widget  mainViewItemListScreenViewWidget(){
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
          titleSpacing: 15,
          title: Text(
            widget.all == "1" ? "All Item":"Item",
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
           loadAllShelfListScreenApiCalls();
           },
          child: Column(
            children: [

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: main_Width * 0.03, vertical: main_Height * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Add Item",
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

                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddItemScreen("${widget.shelfId}","0")));


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

              Hero(
                tag: "search",
                child: Padding(
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
                    // decoration: InputDecoration(
                    //   contentPadding: EdgeInsets.symmetric(vertical: main_Height * 0.015), // Adjust vertical padding
                    //   hintText: 'Search Shelf',
                    //   prefixIcon: Icon(Icons.search),
                    //   border: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(25.0),
                    //   ),
                    //   filled: true,
                    //   fillColor: Colors.white,
                    // ),
                    onTap: (){
                      allData1 = true;

                    },
                    onChanged: (value) {
                      print("ccc");
                      setState(() {
                        print("ccc");
                        allData1 = true;
                        searchQuery = value;
                        searchResults = getItemListModelData!.where((item) =>
                        item.description!.toLowerCase().contains(searchQuery.toLowerCase()) ||
                            item.itemName!.toLowerCase().contains(searchQuery.toLowerCase())
                        ).toList();
                      });
                      // Do something with the search query
                    },

                  ),

                ),
              ),

              getItemListModelData?.isEmpty == true ?
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    SizedBox(
                      height: main_Height * 0.1,
                    ),

                    Text(
                      "Empty Item !",
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        // color: Color.fromARGB(255, 158, 158, 158),
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: main_Height * 0.0239,
                      ),
                    ),

                    SizedBox(
                      height: main_Height * 0.04,
                    ),


                  ],
                ),
              )
                  :
              Expanded(
                child: ListView.builder(
                    itemCount: allData1 == false ? getItemListModelData!.length : searchResults!.length,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return CommonWidgets.masterCardforItem(context,
                          index: index,
                          getItemListModelData:   allData1 == false ?  getItemListModelData![index] : searchResults![index]
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
