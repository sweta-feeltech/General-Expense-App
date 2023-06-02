import 'package:general_expense_app/models/CommonModel/message_model.dart';
import 'package:general_expense_app/network/api_client.dart';
import 'package:http/http.dart' as http;

import '../Utils/api_end_points.dart';
import '../Utils/constants.dart';
import '../models/CommonModel/user_data_model.dart';
import '../models/DashboardModel/dashboard_model.dart';
import '../models/Expense/add_expense_category_model.dart';
import '../models/Expense/get_expense_category_model.dart';
import '../models/Expense/get_expense_list_model.dart';
import '../models/GroupModel/add_group_model.dart';
import '../models/GroupModel/group_link_model.dart';
import '../models/GroupModel/group_list_model.dart';
import '../models/GroupModel/group_members_model.dart';
import '../models/GroupModel/single_group_view_model.dart';
import '../models/IncomeListModel/income_list_model.dart';
import '../models/LoginRegisterModel/login_model.dart';
import '../models/ProfileModel/edit_profile_model.dart';
import '../models/ProfileModel/get_profile_model.dart';
import 'custom_exception.dart';

class Repository {
  final ApiClient apiClient;

  Repository(this.apiClient);

  static Repository getInstance() {
    return Repository(ApiClient(httpClient: http.Client()));
  }

  Future<LoginModel> loginPostAPI(String apiEndPoint, dynamic body) async {
    try {
      Map<String, dynamic> json =
          await apiClient.postApiCall(BASEURL, apiEndPoint, body);
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
      Map<String, dynamic> listData = await apiClient.getApiCall(
          BASEURL, "$getProfileApiEnd",
          isAccessToken: accessToken, isBearer: true);
      GetProfileModel list = GetProfileModel.fromJson(listData);
      return list;
    } on CustomException {
      rethrow;
    }
  }

  /// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~PUT:Update Profile API~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  Future<EditProfileModel> putEditProfileData(Map<String, dynamic> putJson,
      {String? id}) async {
    try {
      var json = await apiClient.apiCallMultipartPut(
        BASEURL,
        "$updateProfileApiEnd",
        isAccessToken: accessToken,
        isBearer: true,
        putJson,
      );
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
      Map<String, dynamic> json = await apiClient.getApiCall(
          BASEURL, SplashScreenAPIEnd,
          isAccessToken: access, isBearer: true);
      print("accc${access}");
      UserData oneNuBeeCardModelRes = UserData.fromJson(json);
      return oneNuBeeCardModelRes;
    } on CustomException {
      rethrow;
    }
  }

  ///// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~GROUP PAGE APIS~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ///
  /// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~POST: ADD GROUP APIS~~~~~~~~~~~~~~~~~~~~~~~
  ///

  // Future<AddGroupModel> createGroupPostAPI(String apiEndPoint, dynamic body) async {
  //   try {
  //     Map<String, dynamic> json = await apiClient.postApiCall(BASEURL, createGroupAPIEnd, body);
  //     print("final received json = $json");
  //     AddGroupModel loginResponse = AddGroupModel.fromJson(json);
  //     return loginResponse;
  //   } on CustomException {
  //     rethrow;
  //   }
  // }

  Future<AddGroupModel> createGroupPostAPI(dynamic body) async {
// Future<SignUpModel> postSigUpData(dynamic body, String firebaseToken) async {
    try {
      Map<String, dynamic> json = await apiClient.postApiCall(
          BASEURL, createGroupAPIEnd, body,
          isAccessToken: accessToken, isBearer: true);
      // print("final received json = $json");
      AddGroupModel courseSavedRes = AddGroupModel.fromJson(json);
      return courseSavedRes;
    } on CustomException {
      rethrow;
    }
  }

  ///
  /// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~POST: JOIN GROUP APIS~~~~~~~~~~~~~~~~~~~~~~~
  ///

  Future<AddGroupModel> joinGroupPostAPI(dynamic body) async {
// Future<SignUpModel> postSigUpData(dynamic body, String firebaseToken) async {
    try {
      Map<String, dynamic> json = await apiClient.postApiCall(
          BASEURL, addGroupMemberAPIEndPost, body,
          isAccessToken: accessToken, isBearer: true);
      // print("final received json = $json");
      AddGroupModel GroupJoinRes = AddGroupModel.fromJson(json);
      return GroupJoinRes;
    } on CustomException {
      rethrow;
    }
  }

  ///
  /// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~GET: GROUP MODEL REQUEST APIS~~~~~~~~~~~~~~~~~~~~~~~
  ///
  Future<List<GetGroupListModel>> getGroupModelData({String? access}) async {
    try {
      var listData = await apiClient.getApiCall(BASEURL, getGroupListAPIEnd,
          isAccessToken: accessToken, isBearer: true) as List;
      var list =
          listData.map((json) => GetGroupListModel.fromJson(json)).toList();
      return list;
    } on CustomException {
      rethrow;
    }
  }

  ///
  /// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~GET: INCOME LIST  APIS~~~~~~~~~~~~~~~~~~~~~~~
  ///
  Future<List<IncomeListModel>> getIncomeListModelData({String? access}) async {
    try {
      var listData = await apiClient.getApiCall(BASEURL, getIncomeListAPIEnd,
          isAccessToken: accessToken, isBearer: true) as List;
      var list =
          listData.map((json) => IncomeListModel.fromJson(json)).toList();
      return list;
    } on CustomException {
      rethrow;
    }
  }

  ///
  /// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~GET: GROUP MEMCER REQUEST APIS~~~~~~~~~~~~~~~~~~~~~~~
  ///
  Future<List<GroupMembersModel>> getGroupMemberList(String query) async {
    try {
      var listData = await apiClient.getApiCall(
          BASEURL, "$getGroupMemberListAPIEnd/$query",
          isAccessToken: accessToken) as List;
      // print("listData: $listData");
      var list =
          listData.map((json) => GroupMembersModel.fromJson(json)).toList();
      return list;
    } on CustomException {
      rethrow;
    }
  }

  ///
  /// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~GET: GROUP LINK REQUEST APIS~~~~~~~~~~~~~~~~~~~~~~~
  ///
  Future<GroupLinkModel> getGroupLinkData(String query) async {
    try {
      Map<String, dynamic> listData = await apiClient.getApiCall(
          BASEURL, "$getGroupLinkAPIEnd/$query",
          isAccessToken: accessToken, isBearer: true);
      GroupLinkModel list = GroupLinkModel.fromJson(listData);
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
  Future<List<SingleGroupViewModel>> getSingleGroupViewList(
      String query) async {
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

  ///
  ///
  ///
  /// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~DELETE:GROUP DELETE APIS~~~~~~~~~~~~~~~~~~~~~~~
  ///
  Future<AddGroupModel> delGroupData({required String id}) async {
    try {
      Map<String, dynamic> json = await apiClient
          .apiCallDel(BASEURL, "$deleteGroupListAPIEnd/$id", isBearer: true);
      AddGroupModel changePassModelRes = AddGroupModel.fromJson(json);
      return changePassModelRes;
    } on CustomException {
      rethrow;
    }
  }

  /// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~POST: ADD INCOME APIS~~~~~~~~~~~~~~~~~~~~~~~
  ///


  Future<MessageModel> addIncomePostAPI(dynamic body) async {
    try {
      Map<String, dynamic> json = await apiClient.postApiCall(
          BASEURL, addIncomeAPIEnd, body,
          isAccessToken: accessToken, isBearer: true);
      // print("final received json = $json");
      MessageModel courseSavedRes = MessageModel.fromJson(json);
      return courseSavedRes;
    } on CustomException {
      rethrow;
    }
  }

  ///
  /// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~GET: EXPENSE CATEGORY APIS~~~~~~~~~~~~~~~~~~~~~~~
  ///
  Future<List<GetExpenseCatModel>> getExpenseCatModelData({String? access}) async {
    try {
      var listData = await apiClient.getApiCall(BASEURL, getExpCatAPIEnd,
          isAccessToken: accessToken, isBearer: true) as List;
      var list =
      listData.map((json) => GetExpenseCatModel.fromJson(json)).toList();
      return list;
    } on CustomException {
      rethrow;
    }
  }

  ///
  /// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~POST: ADD EXP CAT~~~~~~~~~~~~~~~~~~~~~~~
  ///

  Future<AddExpenseCatModel> addExpenseCatModelData(dynamic body) async {
    try {
      Map<String, dynamic> json = await apiClient.postApiCall(
          BASEURL, addExpCatAPIEnd, body,
          isAccessToken: accessToken, isBearer: true);
      AddExpenseCatModel courseSavedRes = AddExpenseCatModel.fromJson(json);
      return courseSavedRes;
    } on CustomException {
      rethrow;
    }
  }

  ///
  /// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~POST: ADD EXP CAT~~~~~~~~~~~~~~~~~~~~~~~
  ///

  Future<MessageModel> addExpenseFormModelData(dynamic body) async {
    try {
      Map<String, dynamic> json = await apiClient.apiCallMultipartPost(
          BASEURL, PostExpFormAPIEnd, body,
          isAccessToken: accessToken, isBearer: true);
      MessageModel courseSavedRes = MessageModel.fromJson(json);
      return courseSavedRes;
    } on CustomException {
      rethrow;
    }
  }

  ///
  /// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~GET: EXPENSE LIST  APIS~~~~~~~~~~~~~~~~~~~~~~~
  ///
  Future<List<GetExpenseListModel>> getExpenseListModelData({String? access}) async {
    try {
      var listData = await apiClient.getApiCall(BASEURL, getExpListAPIEnd,
          isAccessToken: accessToken, isBearer: true) as List;
      var list =
      listData.map((json) => GetExpenseListModel.fromJson(json)).toList();
      return list;
    } on CustomException {
      rethrow;
    }
  }


  /// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~GET: SINGLE COURSE ENROLLED COURSE APIS~~~~~~~~~~~~~~~~~~~~~
  ///
  Future<DashboardModel> getDashboardData() async {
    try {
      Map<String, dynamic> listData = await apiClient.getApiCall(
          BASEURL, "$dashboardListAPIEnd",
          isAccessToken: accessToken, isBearer: true);
      DashboardModel list = DashboardModel.fromJson(listData);
      return list;
    } on CustomException {
      rethrow;
    }
  }




}
