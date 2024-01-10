import 'package:newsapi/constant/curd.dart';

class newsapi {
  Crud crud;
  newsapi(this.crud);
  getData(String category,String country) async {
    var response = await crud.postData(
        'https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=1ec5ce8946cd48449a4910b6189c2059',
        {});
    return response.fold((l) => l, (r) => r);
  }
}
