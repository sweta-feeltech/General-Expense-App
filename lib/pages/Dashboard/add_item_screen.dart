import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Utils/colors.dart';
import '../../Utils/document_upload.dart';
import '../../blocs/AddItemScreen/add_item_screen_bloc.dart';
import '../../models/CommonModel/message_model.dart';
import '../../network/repository.dart';
import '../Widgets/theme_helper.dart';

class AddItemScreen extends StatefulWidget {
  final String shelfId;
  final String apbar;
  AddItemScreen(this.shelfId,this.apbar,{super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();


  PlatformFile? PIimage;

  String? Amount, Remarks, ItemName;


  @override
  void initState() {
    super.initState();

    loadAllItemListScreenApiCalls();
  }

  List<dynamic>? allDocs = [];

  ItemScreenBloc itemScreenBloc =
  ItemScreenBloc(Repository.getInstance());


  MessageModel? messageModelData;

  loadAllItemListScreenApiCalls() {
    itemScreenBloc.add(ItemScreenListInitialEvent());
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: BlocProvider<ItemScreenBloc>(
          create: (context) =>
          itemScreenBloc..add(ItemScreenListInitialEvent()),
          child: BlocConsumer<ItemScreenBloc,ItemScreenState>(
            builder: (context, state) {
              if (state is ItemScreenLoadingEventState) {
                return ThemeHelper.buildLoadingWidget();
              }
              else if (state is PostAddItemFormEventState) {
                messageModelData = state.messageModelData;
                PIimage = null;

                loadAllItemListScreenApiCalls();
                return mainViewAllItemScreenViewWidget();
              }

              else {
                return mainViewAllItemScreenViewWidget();
              }
            },
            listener: (context, state) {
              if (state is ApiFailureState) {
                ThemeHelper.customDialogForMessage(
                    context,
                    (state.exception.toString().replaceAll('Exception:', ''))
                        .replaceAll(':', ''),
                    MediaQuery.of(context).size.width, () {
                  Navigator.of(context).pop();
                  mainViewAllItemScreenViewWidget();
                }, ForSuccess: false);
              }
            },
          )),


    );



  }

  Widget mainViewAllItemScreenViewWidget() {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: primaryGrey,
        bottomSheet: Container(
          height: main_Height * 0.13,
          width: main_Width * 1,
          decoration: BoxDecoration(color: Colors.transparent),
          alignment: Alignment.center,
          // padding: EdgeInsets.symmetric(horizontal: main_Width * 0.05, vertical: main_Height * 0.035),
          child: Container(
            height: main_Height * 0.06,
            width: main_Width * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                primary: primaryPurple,
              ),
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  _formkey.currentState!.save();


                  print("additmresult :n ${ItemName}  a${Amount} r ${Remarks} s: ${widget.shelfId} i ${PIimage}");


                  PIimage == null ?
                  ThemeHelper.showToastMessage("Add File or Image First")
                      :
                  itemScreenBloc.add(PostAddItemFormEvent("${ItemName}","${Amount}","${Remarks}","${widget.shelfId}",File(PIimage!.path.toString())));


                }
              },
              child: Text(
                "Add Income",
                style: TextStyle(
                    letterSpacing: 1,
                    fontSize: main_Height * 0.018,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


        appBar:
         widget.apbar == "0" ?
        AppBar(
          titleSpacing: 15,
          title: Text(
            "Item",
            style: TextStyle(color: Colors.white, fontSize: main_Height * 0.025),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: primaryPurple,
          elevation: 0,
          centerTitle: false,
        )  :
        AppBar(toolbarHeight: 0,),



        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [


                Padding(
                  padding: EdgeInsets.symmetric(
            horizontal: main_Width * 0.03,
                vertical: main_Height * 0.01),
                  child: Column(
                    children: [


                      Row(
                        children: [
                          Text(
                            "Item",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: main_Height * 0.018,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        // initialValue: "${Username}",
                        // initialValue: "${getProfileModelData?.firstName == null ? appUserData!.firstName : getProfileModelData!.firstName}",
                        style: TextStyle(
                          fontSize: main_Height * 0.022,
                        ),
                        onSaved: (newValue2) {
                          ItemName = newValue2;
                        },
                        // onChanged: (value){
                        //   firstName = value;
                        // },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Item Name can\'t be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding:
                          const EdgeInsets.only(top: 5, bottom: 5, left: 10),
                          // filled: true,
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black38),
                          ),
                          // fillColor: ,
                          hintText: "Item Name",
                          hintStyle: TextStyle(
                              color: Colors.grey, fontSize: main_Height * 0.018),
                          border: const OutlineInputBorder(
                            // borderSide:
                            // const BorderSide(color: Colors.white),
                            // borderRadius: BorderRadius.circular(10)

                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),



                      Row(
                        children: [
                          Text(
                            "Amount",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: main_Height * 0.018,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        // initialValue: "${Username}",
                        // initialValue: "${getProfileModelData?.firstName == null ? appUserData!.firstName : getProfileModelData!.firstName}",
                        style: TextStyle(
                          fontSize: main_Height * 0.022,
                        ),
                        onSaved: (newValue1) {
                          Amount = newValue1;
                        },
                        // onChanged: (value){
                        //   firstName = value;
                        // },
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Amount can\'t be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding:
                          const EdgeInsets.only(top: 5, bottom: 5, left: 10),
                          // filled: true,
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black38),
                          ),
                          // fillColor: ,
                          hintText: "Amount",
                          hintStyle: TextStyle(
                              color: Colors.grey, fontSize: main_Height * 0.018),
                          border: const OutlineInputBorder(
                            // borderSide:
                            // const BorderSide(color: Colors.white),
                            // borderRadius: BorderRadius.circular(10)

                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            "Remarks",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: main_Height * 0.018,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: main_Height * 0.2,
                        child: TextFormField(
                          // initialValue: "Remarks",
                          // initialValue: "${getProfileModelData?.description == null ? appUserData?.description == null ?  "" : appUserData?.description : getProfileModelData?.description}",
                          textAlignVertical: TextAlignVertical.top,
                          keyboardType: TextInputType.multiline,
                          expands: true,
                          // textAlign: TextAlign.start,
                          maxLines: null,
                          // minLines: null,
                          style: TextStyle(
                            fontSize: main_Height * 0.022,
                          ),
                          onSaved: (newValue) {
                            Remarks = newValue;
                          },
                          // onChanged: (value){
                          //   description = value;
                          // },
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'First Name can\'t be empty';
                          //   }
                          //   return null;
                          // },
                          decoration: InputDecoration(
                            hintText: "Remarks",
                            contentPadding:
                            EdgeInsets.only(top: 5, bottom: 5, left: 10),
                            // filled: true,
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38),
                            ),
                            // fillColor: ,

                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: main_Height * 0.018),
                            border: OutlineInputBorder(
                              // borderSide:
                              //     const BorderSide(color: Colors.transparent),
                              // borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            "Add File Or Images",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: main_Height * 0.018,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      SizedBox(
                        height: main_Height * 0.1,
                        child: InkWell(
                          onTap: () async {
                            PlatformFile? aIamge =
                            await UploadDocumets.selectFile();

                            PIimage = aIamge;

                            // print("sssssimage${PIimage}");
                            // print("sssssimage${aIamge}");

                            setState(() {
                              PIimage = aIamge;
                              // print("sssssimage${PIimage!.name}");
                            });
                          },
                          child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: (PIimage != null)
                                  ? cardOfDocAfterUploadSuccessWidget(PIimage!,
                                  cardTextWidth: 200)
                                  : cardOfDocBeforeUploadWidget(
                                  PIimage?.identifier, context)),
                        ),
                      ),



                    ],
                  ),
                ),




                Container(
                  height: main_Height * 0.13,
                  width: main_Width * 1,
                )

              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget cardOfDocBeforeUploadWidget(
      String? docToUpload, BuildContext context) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.all(main_Width * 0.015),
      decoration: BoxDecoration(border: Border.all(color: primaryPurple)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Click to upload",
                style: TextStyle(
                    color: primaryPurple,
                    fontWeight: FontWeight.w500,
                    fontSize: main_Height * 0.018),
              ),
              Text("${docToUpload == null ? "" : docToUpload}",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      letterSpacing: 0.8,
                      fontSize: main_Height * 0.015)),
              Text("Upload .jpg or .pdf file",
                  style: TextStyle(
                      color: Colors.black, fontSize: main_Height * 0.012))
            ],
          ),
          Image(
            image: AssetImage("assets/images/add_doc.png"),
            width: 40,
          ),
        ],
      ),
    );
  }

  Widget cardOfDocAfterUploadSuccessWidget(PlatformFile uploadedFile,
      {double? cardTextWidth}) {
    return Container(
      height: 70,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(border: Border.all(color: primaryPurple)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: cardTextWidth ?? null,
                child: RichText(
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text:
                      "${uploadedFile.name == "null" ? "" : uploadedFile.name}\n",
                      style: TextStyle(
                          color: primaryPurple, fontWeight: FontWeight.w500),
                    )),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
          uploadedFile.extension == "jpeg" ||
              uploadedFile.extension == "png" ||
              uploadedFile.extension == "jpg"
              ? Image(
            image: AssetImage("assets/images/picture_pre.jpg"),
            width: 40,
          )
              : Image(
            image: AssetImage("assets/images/pdf_pre.png"),
            width: 40,
          )
        ],
      ),
    );
  }


}
