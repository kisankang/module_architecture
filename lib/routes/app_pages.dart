import 'package:get/get.dart';
import 'package:module_architecture/modules/create_post/create_binding.dart';
import 'package:module_architecture/modules/create_post/create_post_page.dart';
import 'package:module_architecture/modules/forum/forum_binding.dart';
import 'package:module_architecture/modules/forum/forum_page.dart';
import 'package:module_architecture/modules/login/login_binding.dart';
import 'package:module_architecture/modules/login/login_page.dart';
import 'package:module_architecture/modules/main/main_binding.dart';
import 'package:module_architecture/modules/main/main_page.dart';
import 'package:module_architecture/modules/open_post/open_post_binding.dart';
import 'package:module_architecture/modules/open_post/open_post_page.dart';
import 'package:module_architecture/modules/reset_pw/reset_pw_binding.dart';
import 'package:module_architecture/modules/reset_pw/reset_pw_page.dart';
import 'package:module_architecture/modules/sign_up/sign_up_binding.dart';
import 'package:module_architecture/modules/sign_up/sign_up_page.dart';
import 'package:module_architecture/modules/splash/splash_binding.dart';
import 'package:module_architecture/modules/splash/splash_page.dart';
import 'package:module_architecture/modules/welcome/welcome_binding.dart';
import 'package:module_architecture/modules/welcome/welcome_page.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.WELCOME,
      page: () => const WelComePage(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => const SignUpPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.RESETPW,
      page: () => const ResetPwPage(),
      binding: ResetPwBinding(),
    ),
    GetPage(
      name: Routes.MAIN,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.FORUM,
      page: () => const ForumPage(),
      binding: ForumBinding(),
    ),
    GetPage(
      name: Routes.CREATEPOST,
      page: () => const CreatePostPage(),
      binding: CreatePostBinding(),
    ),
    GetPage(
      name: Routes.OPENPOST,
      page: () => const OpenPostPage(),
      binding: OpenPostBinding(),
    ),
  ];
}
