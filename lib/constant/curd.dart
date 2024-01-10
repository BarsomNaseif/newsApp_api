import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapi/constant/checkInternet.dart';
import 'package:newsapi/constant/statusrequest.dart';
import 'package:dartz/dartz.dart';
class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    if (await checkInternet()) {
      var response = await http.get(Uri.parse(linkurl),);
      print(response.statusCode);
      print('=================response.statusCode===========');
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        print(responsebody);
        print('============================');
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }
}
