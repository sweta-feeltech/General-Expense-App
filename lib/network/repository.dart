import 'package:general_expense_app/network/api_client.dart';
import 'package:http/http.dart' as http;

import '../Utils/api_end_points.dart';
import '../Utils/constants.dart';
import '../models/CommonModel/user_data_model.dart';
import '../models/GroupModel/group_list_model.dart';
import '../models/GroupModel/single_group_view_model.dart';
import '../models/LoginRegisterModel/login_model.dart';
import '../models/ProfileModel/edit_profile_model.dart';
import '../models/ProfileModel/get_profile_model.dart';
import 'custom_exception.dart';


class Repository {
  final ApiClient apiClient;

  Repository(this.apiClient);

  static Repository getInstance () {
    return Repository(ApiClient(httpClient: http.Client()));
  }


  Future<LoginModel> loginPostAPI(String apiEndPoint, dynamic body) async {
    try {
      Map<String, dynamic> json = await apiClient.postApiCall(BASEURL, apiEndPoint, body);
      print("final received json = $json");
      LoginModel loginResponse = LoginModel.fromJson(json);
      return loginResponse;
    } on CustomException {
      rethrow;
    }
  }

  /// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~GET: SINGLE COURSE ENROLLED COURSE APIS~~~~~~~~~~~~~~~~~~~~~
  ///
  Future<GetProfileModel> getProfileData() async {
    try {
      Map<String, dynamic> listData = await apiClient.getApiCall(BASEURL,"$getProfileApiEnd", isAccessToken: accessToken,isBearer:true);
      GetProfileModel list = GetProfileModel.fromJson(listData);
      return list;
    } on CustomException {
      rethrow;
    }
  }

  /// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~PUT:Update Profile API~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  Future<EditProfileModel> putEditProfileData(Map<String, dynamic> putJson, {String? id}) async {
    try {
      var json = await apiClient.apiCallMultipartPut(BASEURL,"$updateProfileApiEnd",isAccessToken: accessToken,isBearer:true, putJson,);
      print("here put json : $json");
      EditProfileModel productPut = EditProfileModel.fromJson(json);
      return productPut;
    } on CustomException {
      rethrow;
    }
  }

  ///// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~SPLASH PAGE APIS~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ///
  /// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~GET: PROFILE REQUEST FOR SESSION MANAGE~~~~~~~~~~~~~~~~~~~~~~~
  ///
  Future<UserData> getProfileSplashAPICall({String? access}) async {
    try {
      print("acss${access}");
      Map<String, dynamic> json = await apiClient.getApiCall(BASEURL, SplashScreenAPIEnd, isAccessToken: access,isBearer: true);
      print("accc${access}");
      UserData oneNuBeeCardModelRes = UserData.fromJson(json);
      return oneNuBeeCardModelRes;
    } on CustomException {
      rethrow;
    }
  }

  ///// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~DASHBOARD PAGE APIS~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ///
  /// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~GET: GROUP MODEL REQUEST APIS~~~~~~~~~~~~~~~~~~~~~~~
  ///
  Future<List<GetGroupListModel>> getGroupModelData({String? access}) async {
    try {
      var listData = await apiClient.getApiCall(BASEURL, getGroupListAPIEnd, isAccessToken: accessToken,isBearer: true) as List;
      var list = listData.map((json) => GetGroupListModel.fromJson(json)).toList();
      return list;
    } on CustomException {
      rethrow;
    }
  }


  ///
  ///
  ///
  /// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~GET: SINGLE GROUP GET APIS~~~~~~~~~~~~~~~~~~~~~~~
  ///
  Future<List<SingleGroupViewModel>> getSingleGroupViewList(String query) async {
    try {
      var listData = await apiClient.getApiCall(
          BASEURL, "$getGroupbyIdAPIEnd/$query", isAccessToken: accessToken)
      as List;
      print("listData: $listData");
      var list =
      listData.map((json) => SingleGroupViewModel.fromJson(json)).toList();
      return list;
    } on CustomException {
      rethrow;
    }
  }



}