import 'package:get/get.dart';
import 'package:newsapi/constant/curd.dart';

class initialBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(Crud());
  }
}
