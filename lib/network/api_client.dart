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

    print("ases${accessToken}");
    print("ases${isAccessToken}");

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $isAccessToken"
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
        "Authorization": "Bearer $isAccessToken"
      };
    }else{
      headers = {
        "Content-Type": "application/json",
        // "Authorization": "$isAccessToken"
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
  ///
  ///
  /// POST REQUEST FOR MULTIPART FOR EXPENSE [form-data]
  ///
  ///
  Future<dynamic> apiCallMultipartPost(String baseUrl, String apiEndPoint,dynamic postBody,{bool? isBearer,String? isAccessToken,}) async {

    postData data = postData.fromJson(postBody);

    var getUrl;

    getUrl = Uri.parse('$baseUrl$apiEndPoint');
    print("postUrl $getUrl");

    var request = http.MultipartRequest('POST', getUrl);

    // request.headers.addAll({
    //   "Content-Type": "application/json",
    //   "isClient": "true",
    //   "Authorization": "$accessToken"
    // });


    if(isBearer == true){
      request.headers.addAll({
        "Content-Type": "application/json",
        "isClient": "true",
        "Authorization": "Bearer $accessToken"
      });
    }else{
      request.headers.addAll({
        "Content-Type": "application/json",
        "isClient": "true",
        "Authorization": "$accessToken"
      });
    }





    if(data.Receipt != null) {
      var stream = http.ByteStream(data.Receipt!.openRead());
      stream.cast();
      var length = await data.Receipt!.length();
      var multiport = await http.MultipartFile.fromPath("Receipt",data.Receipt!.path, contentType: MediaType('image', 'jpg'));
      request.files.add(multiport);
    }

    print("testres");



    request.fields['ExpenseCategoryId'] = data.ExpenseCategoryId!.toString();
    request.fields['ExpenseDate'] = data.ExpenseDate!.toString();
    request.fields['Amount'] = data.Amount!.toString();
    request.fields['ToPay'] = data.ToPay!.toString();
    request.fields['Remarks'] = data.Remarks!.toString();


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
  /// POST REQUEST FOR MULTIPART FOR ITEM
  ///
  ///

  Future<dynamic> apiCallMultipartPostforItem(String baseUrl, String apiEndPoint,dynamic postBody,{bool? isBearer,String? isAccessToken,}) async {

    postDataItem data = postDataItem.fromJson(postBody);

    var getUrl;

    getUrl = Uri.parse('$baseUrl$apiEndPoint');
    print("postUrl $getUrl");

    var request = http.MultipartRequest('POST', getUrl);

    // request.headers.addAll({
    //   "Content-Type": "application/json",
    //   "isClient": "true",
    //   "Authorization": "$accessToken"
    // });


    if(isBearer == true){
      request.headers.addAll({
        "Content-Type": "application/json",
        "isClient": "true",
        "Authorization": "Bearer $accessToken"
      });
    }else{
      request.headers.addAll({
        "Content-Type": "application/json",
        "isClient": "true",
        "Authorization": "$accessToken"
      });
    }





    if(data.Receipt != null) {
      var stream = http.ByteStream(data.Receipt!.openRead());
      stream.cast();
      var length = await data.Receipt!.length();
      var multiport = await http.MultipartFile.fromPath("Receipt",data.Receipt!.path, contentType: MediaType('image', 'jpg'));
      request.files.add(multiport);
    }

    print("testres");



    print("dataforpost : ${data.ShelfLocationId} ${data.ItemName} ${data.Price} ${data.Description} ${data.Receipt}");

    request.fields['ItemName'] = data.ItemName!.toString();
    request.fields['Price'] = data.Price!.toString();
    request.fields['ShelfLocationId'] = data.ShelfLocationId!.toString();
    request.fields['Description'] = data.Description!.toString();


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
  Future<dynamic> apiCallMultipartPut(String baseUrl, String apiEndPoint,dynamic putBody,{bool? isBearer,String? isAccessToken,}) async {
    // Map<String, dynamic> jDecoded = json.decode(putBody);
    putData data = putData.fromJson(putBody);
    // print("${data.email} ${data.image} ${data.dob} ${data.state} ${data.district} ${data.area}");
    // print(" here data ${data.prodName} ${data.prodSku} ${data.tax} ${data.freight} ${data.prodQty} ${data.branchPrice} ${data.distributorPrice} ${data.dealerPrice} ${data.wholesalerPrice} ${data.technicianPrice} ${data.categoryId} ${data.brandId} ${data.profilePic}");

    var putResponse;
    var getUrl;

    getUrl = Uri.parse('$baseUrl$apiEndPoint');
    print("putUrl $getUrl");

    var request = http.MultipartRequest('PUT', getUrl);

    // request.headers.addAll({
    //   "Content-Type": "application/json",
    //   "isClient": "true",
    //   "Authorization": "$accessToken"
    // });


    if(isBearer == true){
      request.headers.addAll({
        "Content-Type": "application/json",
        "isClient": "true",
        "Authorization": "Bearer $accessToken"
      });
    }else{
      request.headers.addAll({
        "Content-Type": "application/json",
        "isClient": "true",
        "Authorization": "$accessToken"
      });
    }





    if(data.profilePic != null) {
      var stream = http.ByteStream(data.profilePic!.openRead());
      stream.cast();
      var length = await data.profilePic!.length();
      var multiport = await http.MultipartFile.fromPath("profilePic",data.profilePic!.path, contentType: MediaType('image', 'jpg'));
      request.files.add(multiport);
    }



    request.fields['firstName'] = data.firstName!.toString();
    request.fields['lastName'] = data.lastName!.toString();
    request.fields['birthDate'] = data.birthDate!.toString();
    request.fields['bio'] = data.bio!.toString();


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
    headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $accessToken"
    };

    // if(isBearer == true){
    //   print("in bear");
    //   headers = {
    //     "Content-Type": "application/json",
    //     "Authorization": "$accessToken"
    //   };
    // }
    // else if(isAccessToken != null){
    //
    // }
    // else{
    //   headers = {
    //     "Content-Type": "application/json",
    //     // "Authorization": "$accessToken"
    //   };
    // }

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
  String? firstName;
  String? lastName;
  String? birthDate;
  File? profilePic;
  String? bio;
  putData(
      {
        this.firstName,
        this.lastName,
        this.birthDate,
        this.profilePic,
        this.bio,
      });

  putData.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    birthDate = json['birthDate'];
    profilePic = json['profilePic'];
    bio = json['bio'];
  }
}




class postData {
  String? ExpenseCategoryId;
  String? ExpenseDate;
  String? Amount;
  String? ToPay;
  String? Remarks;
  File? Receipt;
  postData(
      {
        this.ExpenseCategoryId,
        this.ExpenseDate,
        this.Amount,
        this.ToPay,
        this.Remarks,
        this.Receipt,
      });

postData.fromJson(Map<String, dynamic> json) {
  ExpenseCategoryId = json['ExpenseCategoryId'];
  ExpenseDate = json['ExpenseDate'];
  Amount = json['Amount'];
  ToPay = json['ToPay'];
  Remarks = json['Remarks'];
  Receipt = json['Receipt'];
  }
}



class postDataItem {
  String? ItemName;
  String? Price;
  String? ShelfLocationId;
  String? Description;
  File? Receipt;
  postDataItem(
      {
        this.ItemName,
        this.Price,
        this.ShelfLocationId,
        this.Description,
        this.Receipt,
      });

  postDataItem.fromJson(Map<String, dynamic> json) {
    ItemName = json['ItemName'];
    Price = json['Price'];
    ShelfLocationId = json['ShelfLocationId'];
    Description = json['Description'];
    Receipt = json['Receipt'];
  }
}

