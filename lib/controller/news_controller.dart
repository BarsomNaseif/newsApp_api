import 'package:get/get.dart';
import 'package:newsapi/model/artices_model.dart';
import 'package:newsapi/constant/handingdatacontroller.dart';
import 'package:newsapi/services/news_service.dart';
import 'package:newsapi/constant/statusrequest.dart';

class NewsapiController extends GetxController {
  newsapi homedata = newsapi(Get.find());
  List getNews = [];
  late StatusRequest statusRequest;
  ArticlesList? articlesList;
 
  String? NameCategory = 'business';
  String? dropdownValue = 'us';
  

  getcategory(String indexs) {
    NameCategory = indexs;
    print(dropdownValue);
    getdata();
    update();
  }

  List source = [];
  getdata() async {
    getNews.clear();
    statusRequest = StatusRequest.loading;
    print(dropdownValue);
    print('&&&&&&&&&&&&&&&&&&&&&&&&&&&&7');
    var response = await homedata.getData(NameCategory!, dropdownValue!);
    update();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "ok") {
        List<dynamic> articlesJson = response['articles'];
        articlesList = ArticlesList.fromJson(articlesJson);
        getNews.addAll(articlesJson);
        //source.addAll(response['source']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }
 List<String> country = <String>[
    'ae',
    'ar',
    'at',
    'au',
    'be',
    'bg',
    'br',
    'ca',
    'ch',
    'cn',
    'co',
    'cu',
    'cz',
    'de',
    'us',
    'eg',
  ];
  List category = [
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'technology'
  ];
  void onInit() {
    getdata();
    dropdownValue;
    super.onInit();
  }
}
