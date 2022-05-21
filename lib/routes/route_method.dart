
import 'package:get/get.dart';

//app file

import 'route_name.dart';
import 'screen_list.dart';

RouteName _routeName = RouteName();

class AppRoute {
  final List<GetPage> getPages = [
    GetPage(name: _routeName.changeTheme, page: () => ChangeTheme()),
    GetPage(name: _routeName.dashboard, page: () => const Dashboard()),
    GetPage(name: _routeName.onBoarding, page: () => OnBoardingScreen()),
    GetPage(name: _routeName.login, page: () => const LoginScreen()),
    GetPage(name: _routeName.signup, page: () => const SignUpScreen()),
    GetPage(name: _routeName.error404page, page: () => Error404Page()),
    GetPage(name: _routeName.shopScreen, page: () => const ShopScreen()),
    GetPage(name: _routeName.productDetail, page: () => const ProductDetailScreen()),
    GetPage(name: _routeName.myCart, page: () => const MyCartListScreen()),
    GetPage(name: _routeName.addAddress, page: () => AddAddress()),
    GetPage(name: _routeName.addressList, page: () => AddressListScreen()),
    GetPage(name: _routeName.paymentScreen, page: () => PaymentScreen()),
    GetPage(name: _routeName.orderSuccess, page: () => OrderSuccess()),
    GetPage(name: _routeName.orderTrack, page: () => OrderTrack()),
    GetPage(name: _routeName.orderDetail, page: () => OrderDetail()),
    GetPage(name: _routeName.myWishList, page: () => MyWishListScreen()),
    GetPage(name: _routeName.orderHistory, page: () => OrderHistoryScreen()),
    GetPage(name: _routeName.yourAccount, page: () => YourAccount()),
    GetPage(name: _routeName.notification, page: () => Notification()),
    GetPage(name: _routeName.setting, page: () => Setting()),
    GetPage(name: _routeName.pageList, page: () => PagesList()),
    GetPage(name: _routeName.aboutUs, page: () => AboutUs()),
  ];
}
