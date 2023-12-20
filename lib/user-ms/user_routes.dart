import 'package:get/get.dart';
import 'package:helpai/general_ms/view/chat/chat_screen.dart';
import 'package:helpai/user-ms/view/signin/signin_screen.dart';
import 'package:helpai/user-ms/view/signup/signup_screen.dart';

import 'controller/user_binding.dart';

class UserRoutes {
  static final routes = [
    GetPage(
      name: SigninScreen.routeName,
      page: () => const SigninScreen(),
      binding: SigninBinding(),
      //middlewares: [UserMiddleware()],
    ),
    GetPage(
      name: SignUpScreen.routeName,
      page: () => const SignUpScreen(),
      binding: SignUpBinding(),
      //middlewares: [UserMiddleware()],
    ),
    GetPage(name: ChatScreen.routeName, page: () => const ChatScreen()),
  ];
}
