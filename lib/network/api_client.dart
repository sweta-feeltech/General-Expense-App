import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../Utils/constants.dart';

import 'package:flutter/cupertino.dart';
import 'package:http_parser/http_parser.dart';

import 'custom_exception.dart';


class ApiClient {
  http.Client? httpClient;

  ApiClient({this.httpClient});

  //////~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ///
  ///// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~API CALLS~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ///
  ///
  /// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~GET APIS~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ///
  ///
  /// ~~~~~~GET API CALL: SENDING GET REQUEST TO SERVER.~~~~~
  ///
  ///
  Future<dynamic> getApiCall(String baseUrl, String endPoint, {String query = "", String? isAccessToken, dynamic bodyForGetApi,bool? isBearer}) async {
    var getResponseJson;
    var getUrl;

    // Map<String, String>? headers;

    if(query.isNotEmpty) {
      getUrl = "$baseUrl$endPoint?$query";
    } else {
      getUrl = "$baseUrl$endPoint";
    }


    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $accessToken"
    };



    print("url $getUrl, headers: $headers");

    try {

      var response = await httpClient?.get(Uri.parse(getUrl), headers: headers);
      getResponseJson = await _parseGetResponse(response!);

    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return getResponseJson;
  }

  /// HERE, CONVERTING HTTP RESPONSE TO JSON.
  Future<dynamic> _parseGetResponse(http.Response response) async {
    debugPrint("GET API RESPONSE: ${response.body}");
    print("request Status: ${response.statusCode}");

    switch (response.statusCode) {
      case 200:
        var getResponseJson = json.decode(response.body);
        return getResponseJson;

      case 401:
      // throw UnAuthorizedException("Unautorized Acces s or Invalid Credentials");
        var postResponseJson = json.decode(response.body);
        print("message:  ${postResponseJson["message"]}");
        throw UnAuthorizedException(postResponseJson["message"]);

      case 404:
        var postResponseJson = json.decode(response.body);
        throw DoesNotExistException(postResponseJson["message"]);

      case 400:
        var postResponseJson = json.decode(response.body);
        throw ServerValidationError(postResponseJson["message"]);

      default:
        throw Exception("Something went Wrong");
    }
  }

  /////
  ///
  /// POST APIS
  ///
  /// POST API CALL: SENDING LOGIN DATA REQUEST TO SERVER.
  ///
  ///
  Future<dynamic> postApiCall(String baseUrl, String endPoint, dynamic postBody, {
    String? isAccessToken,
    bool? isBearer
  }) async {
    var postResponseJson;
    var getUrl;


    getUrl = '$baseUrl$endPoint';

    Map<String, String> headers;
    //print("herrreeeeee1");
    //print(postBody);
    // //print();

    var encodedBody = json.encode(postBody);

    //print("herrreeeeee2");
    if(isBearer == true){
      headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $accessToken"
      };
    }else{
      headers = {
        "Content-Type": "application/json",
        "Authorization": "$accessToken"
      };
    }


    print("Test 1 ");
    print("post url: $getUrl, headers: $headers, body: $encodedBody");

    try {
      var response = await httpClient?.post(Uri.parse(getUrl), headers: headers, body: encodedBody);
      postResponseJson = await _parsePostResponse(response!);
    } on SocketException {
      throw FetchDataException("No internet Connetion");
    }

    return postResponseJson;
  }




  Future<dynamic> postApiCallWithoutBody(String baseUrl, String endPoint, {String? isAccessToken, String? isFireBaseToken}) async {
    var postResponseJson;
    var getUrl;

    Map<String, String>? headers;

    getUrl = '$baseUrl$endPoint';

    // var encodedBody = json.encode(postBody);

    if(isAccessToken != null) {
      print("with token");
      headers = {
        "Content-Type": "application/json",
        "Authorization": isAccessToken,
      };
    }
    else if(isFireBaseToken != null) {
      print("with firebase");
      headers = {
        "Content-Type": "application/json",
        "firebase": isFireBaseToken,
      };
    }
    else {
      print("without token");
      headers = {
        "Content-Type": "application/json"
      };
    }

    print("post url: $getUrl, headers: $headers");

    try {
      var response = await httpClient?.post(Uri.parse(getUrl), headers: headers);
      postResponseJson = await _parsePostResponse(response!);
    } on SocketException {
      throw FetchDataException("No internet Connetion");
    }

    return postResponseJson;
  }

  //////
  ///
  /// POST API CALL: SENDING LOGIN DATA REQUEST TO SERVER.
  ///
  Future<dynamic> _parsePostResponse(http.Response response) async {
    debugPrint("Post Api Response: ${response.body}");
    print("post status: ${response.statusCode}");

    switch (response.statusCode) {
      case 200:
        var postResponseJson = json.decode(response.body);
        return postResponseJson;

      case 401:
        var postResponseJson = json.decode(response.body);
        print("message:  ${postResponseJson["message"]}");
        throw UnAuthorizedException(postResponseJson["message"]);
    // throw UnAuthorizedException("Unauthorized access or Invalid credentials");

      case 404:
        print("here");
        var postResponseJson = json.decode(response.body);
        print("message:  ${postResponseJson["message"]}");
        throw DoesNotExistException(postResponseJson["message"]);

      case 400:
        var postResponseJson = json.decode(response.body);
        if(postResponseJson.toString().contains("Payment")) {
          print("inside");
          return postResponseJson;
        }
        else {
          // var errMessage = ErrorModel.fromJson(postResponseJson);
          // throw ServerValidationError(errMessage.message);
          print("message:  ${postResponseJson["message"]}");
          throw ServerValidationError(postResponseJson['message']);
        }

      case 403:
        var postResponseJson = json.decode(response.body);
        print("message:  ${postResponseJson["message"]}");
        throw ServerValidationError(postResponseJson["message"]);


      default:
        var postResponseJson = json.decode(response.body);
        print("message:  ${postResponseJson["message"]}");
        // throw Exception("Something went Wrong");
        throw Exception(postResponseJson["message"]);
    }
  }
  ///
  ///
  ///
  //////
  ///
  /// ~~~~~~~~~~~~~~~~~~~NORMAL PUT API CALL~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ///
  Future<dynamic> normalPutAPICall(String baseurl, String endPoint, dynamic body,{bool? isBearer}) async {
    var putResponseJson;
    var getUrl;


    // getUrl = '$baseUrl$apiEndPoint';

    Map<String, String> headers;
    //print("herrreeeeee1");
    //print(postBody);
    // //print();

    var encodedBody = json.encode(body);

    //print("herrreeeeee2");
    if(isBearer == true){
      headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $accessToken"
      };
    }else{
      headers = {
        "Content-Type": "application/json",
        // "Authorization": "$accessToken"
      };
    }


    print("url: $getUrl, headers: $headers");
    try {
      var response = await httpClient!.put(Uri.parse(getUrl), headers: headers, body: encodedBody);
      putResponseJson = await _parsePutResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return putResponseJson;
  }

  Future<dynamic> _parsePutResponse(http.Response response) async {
    debugPrint("Post Api Response: ${response.body}");
    print("status: ${response.statusCode}");

    switch (response.statusCode) {
      case 200:
        var putResponseJson = json.decode(response.body);
        return putResponseJson;

      case 401:
        var putResponseJson = json.decode(response.body);
        print(putResponseJson["message"]);
        throw UnAuthorizedException(putResponseJson["message"]);
    // throw UnAuthorizedException("Unauthorized access or Invalid credentials");

      case 404:
        var postResponseJson = json.decode(response.body);
        throw DoesNotExistException(postResponseJson["message"]);

      default:
        throw Exception("Something went Wrong");
    }
  }

  // PUTAPICALL
  Future<dynamic> apiCallMultipartPut(String baseUrl, String apiEndPoint,dynamic putBody,{String? isAccessToken}) async {
    // Map<String, dynamic> jDecoded = json.decode(putBody);
    putData data = putData.fromJson(putBody);
    // print("${data.email} ${data.image} ${data.dob} ${data.state} ${data.district} ${data.area}");
    // print(" here data ${data.prodName} ${data.prodSku} ${data.tax} ${data.freight} ${data.prodQty} ${data.branchPrice} ${data.distributorPrice} ${data.dealerPrice} ${data.wholesalerPrice} ${data.technicianPrice} ${data.categoryId} ${data.brandId} ${data.profilePic}");

    var putResponse;
    var getUrl;

    getUrl = Uri.parse('$baseUrl$apiEndPoint');
    print("putUrl $getUrl");

    var request = http.MultipartRequest('PUT', getUrl);

    request.headers.addAll({
      "Content-Type": "application/json",
      "isClient": "true",
      "Authorization": "$accessToken"
    });

    if(data.profilePic != null) {
      var stream = http.ByteStream(data.profilePic!.openRead());
      stream.cast();
      var length = await data.profilePic!.length();
      var multiport = await http.MultipartFile.fromPath("profilePic",data.profilePic!.path, contentType: MediaType('image', 'jpg'));
      request.files.add(multiport);
    }




    request.fields['firstName'] = data.firstName!.toString();
    request.fields['lastName'] = data.lastName!.toString();
    request.fields['email'] = data.email!.toString();
    request.fields['dob'] = data.dob!.toString();
    request.fields['description'] = data.description!.toString();


    var response = await request.send();

    var stringResponse = await response.stream.bytesToString();
    print("string response ${stringResponse}");
    print(response.request);
    print(response.statusCode);
    switch (response.statusCode) {
      case 200:
        var jDecode = json.decode(stringResponse);
        return jDecode;

    // case 400:
    //   Map<String, dynamic> jsonD = json.decode(stringResponse);
    //   ChangePassModel changePassModelRes = ChangePassModel.fromJson(jsonD);
    //   throw ServerValidationError(changePassModelRes.message);

      case 400:
        throw ServerValidationError("Server validation error : 404");

      case 401:
        throw UnAuthorizedException("Unauthorized access or Invalid credentials");

      case 404:
        throw DoesNotExistException("User Does Not Exist");

      default:
        throw Exception("Something went Wrong");
    }
  }


  ///
  ///
  ///
  //////
  ///
  /// ~~~~~~~~~~~~~~~~~~~NORMAL DELETE API CALL~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ///
  // DELAPICALL

  Future<dynamic> apiCallDel(String baseUrl, String endPoint, {String? isAccessToken, bool? isBearer}) async {
    var deleteResponseJson;
    var getUrl;

    getUrl ='$baseUrl$endPoint';

    Map<String, String> headers;

    print("herrreeeeee2");
    if(isBearer == true){
      print("in bear");
      headers = {
        "Content-Type": "application/json",
        "Authorization": "$accessToken"
      };
    }
    else if(isAccessToken != null){
      headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $accessToken"
      };
    }
    else{
      headers = {
        "Content-Type": "application/json",
        // "Authorization": "$accessToken"
      };
    }

    // Map<String, String> headers = {
    //   "Content-Type": "application/json",
    //   "Authorization": "$accessToken"
    // };

    print("url: $getUrl, headers: $headers");
    try {

      var response = await httpClient!.delete(Uri.parse(getUrl), headers: headers);
      print("response : ${response.body}");
      deleteResponseJson = await _parseDelResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return deleteResponseJson;
  }



  Future<dynamic> _parseDelResponse(http.Response response) async {
    debugPrint("Put Api Response: ${response.body}");
    print("status: ${response.statusCode}");

    switch (response.statusCode) {
      case 200:
        var deleteResponseJson = json.decode(response.body);
        return deleteResponseJson;

      case 401:
        throw UnAuthorizedException("Unauthorized access or Invalid credentials");

      case 404:
        throw DoesNotExistException("User Does Not Exist");

      case 400:
        throw ServerValidationError("hi");

      default:
        throw Exception("Something went Wrong");
    }
  }



}


class putData {
  String? id;
  String? firstName;
  String? lastName;
  String? mobile;
  String? email;
  String? planStartDate;
  String? planEndDate;
  File? profilePic;
  String? dob;
  String? description;
  bool? isSubscriber;
  String? deviceId;
  String? deviceName;
  String? deviceModelName;
  String? deviceProductName;
  bool? isFirstLogin;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? createdBy;
  String? updatedBy;
  String? deletedBy;
  String? planId;


  putData(
      {this.id,
        this.firstName,
        this.lastName,
        this.mobile,
        this.email,
        this.planStartDate,
        this.planEndDate,
        this.profilePic,
        this.dob,
        this.description,
        this.isSubscriber,
        this.deviceId,
        this.deviceName,
        this.deviceModelName,
        this.deviceProductName,
        this.isFirstLogin,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.createdBy,
        this.updatedBy,
        this.deletedBy,
        this.planId});

  putData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    mobile = json['mobile'];
    email = json['email'];
    planStartDate = json['planStartDate'];
    planEndDate = json['planEndDate'];
    profilePic = json['profilePic'];
    dob = json['dob'];
    description = json['description'];
    isSubscriber = json['isSubscriber'];
    deviceId = json['deviceId'];
    deviceName = json['deviceName'];
    deviceModelName = json['deviceModelName'];
    deviceProductName = json['deviceProductName'];
    isFirstLogin = json['isFirstLogin'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    deletedBy = json['deletedBy'];
    planId = json['planId'];
  }
}
