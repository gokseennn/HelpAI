import 'package:get/get.dart';
import 'package:helpai/general_ms/model/category_model.dart';
import 'package:helpai/general_ms/model/home_item_model.dart';
import 'package:helpai/service/app_service.dart';

class HomeController extends GetxController {
  RxList<CategoryModel> aiFilterItem = <CategoryModel>[].obs;
  RxList<HomeItemModel> homeItems = <HomeItemModel>[].obs;
  @override
  void onInit() async {
    aiFilterItem.value = await AppService.to.getCategories();
    homeItems.value = await AppService.to.getHomeItems();
    super.onInit();
  }
}
