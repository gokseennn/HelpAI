import 'package:get/get.dart';
import 'package:helpai/general_ms/controller/general_binding.dart';
import 'package:helpai/general_ms/view/chat/chat_screen.dart';
import 'package:helpai/general_ms/view/home/home_screen.dart';

class GeneralRoutes {
  static final routes = [
    GetPage(
      name: ChatScreen.routeName,
      page: () => const ChatScreen(),
      binding: ChatBinding(),
      //middlewares: [UserMiddleware()],
    ),
    GetPage(
      name: HomeScreen.routeName,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
      //middlewares: [UserMiddleware()],
    ),
  ];
}
