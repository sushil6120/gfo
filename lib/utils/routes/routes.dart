import 'package:flutter/material.dart';
import 'package:gfo/ui/consultant/Consultant_customer_review.dart';
import 'package:gfo/ui/consultant/Consultant_registration.dart';
import 'package:gfo/ui/consultant/consultantBottomNavigation.dart';
import 'package:gfo/ui/consultant/consultantUserDeatails.dart';
import 'package:gfo/ui/consultant/consultant_chat_list.dart';
import 'package:gfo/ui/consultant/consultant_chat_massage.dart';
import 'package:gfo/ui/consultant/consultant_homeScreen.dart';
import 'package:gfo/ui/consultant/consultant_notification.dart';
import 'package:gfo/ui/consultant/consultant_profile.dart';
import 'package:gfo/ui/consultant/consultant_profile_details.dart';
import 'package:gfo/ui/consultant/consultant_wallet.dart';
import 'package:gfo/ui/customer/cart_screen.dart';
import 'package:gfo/ui/customer/customer_product_details_screen.dart';
import 'package:gfo/ui/seller/seller_add_gallery_screen.dart';
import 'package:gfo/ui/customer/faq_screen.dart';
import 'package:gfo/ui/seller/seller_add_inventory_screen.dart';
import 'package:gfo/ui/seller/seller_bottomNavigation_bar_screen.dart';
import 'package:gfo/ui/seller/seller_edit_product_screen.dart';
import 'package:gfo/ui/seller/seller_home_screen.dart';
import 'package:gfo/ui/seller/seller_notification.dart';
import 'package:gfo/ui/seller/seller_order_screen.dart';
import 'package:gfo/ui/seller/seller_privacy_policy.dart';
import 'package:gfo/ui/seller/seller_producat.dart';
import 'package:gfo/ui/seller/seller_product_details.dart';
import 'package:gfo/ui/seller/seller_profile_detail_screen.dart';
import 'package:gfo/ui/seller/seller_registration.dart';
import 'package:gfo/ui/seller/seller_wallet_screen.dart';
import 'package:gfo/verification/consultant_sign_up.dart';
import 'package:gfo/verification/customer_sign_up.dart';
import 'package:gfo/verification/role.dart';
import 'package:gfo/verification/seller_sign_up.dart';
import 'package:gfo/verification/sign_up_otp_verify.dart';
import '../../ui/customer/all_products_screen.dart';
import '../../ui/customer/apply_noc_screen.dart';
import '../../ui/customer/bottom_navBar_Screen.dart';
import '../../ui/customer/chat_screen.dart';
import '../../ui/customer/checkout_screen.dart';
import '../../ui/customer/consultant_info_screen.dart';
import '../../ui/customer/customer_add_new_address.dart';
import '../../ui/customer/customer_address_screen.dart';
import '../../ui/customer/customer_hire_consultant_screen.dart';
import '../../ui/customer/customer_home_Screen.dart';
import '../../ui/customer/customer_login_screen.dart';
import '../../ui/customer/customer_profile_screen.dart';
import '../../ui/customer/login_otp_screen.dart';
import '../../ui/customer/congratulations_screen.dart';
import '../../ui/customer/notification_screen.dart';
import '../../ui/customer/order_info_screen.dart';
import '../../ui/customer/order_screen.dart';
import '../../ui/customer/privacy_policy_screen.dart';
import '../../ui/customer/review_screen.dart';
import '../../ui/customer/role_screen.dart';
import '../../ui/seller/seller_add_inventory_general_screen.dart';
import '../../ui/seller/seller_profile_screen.dart';
import '../../ui/splash_screen.dart';
import '../slideTransition.dart';
import 'routesName.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen1:
        return SlideRoute(page: const SplashScreen(), x: 1, y: 0);
      case RoutesName.splashScreen:
        return SlideRoute(page: const CustomerLoginScreen(), x: 1, y: 0);
      case RoutesName.loginOtpVerify:
        final arguments = settings.arguments as Map<String, dynamic>;
        return SlideRoute(
            page: LoginOtpVerifyScreen(arguments: arguments), x: 1, y: 0);
      case RoutesName.rolesScreen:
        return SlideRoute(page: const RolesScreen(), x: 1, y: 0);
      case RoutesName.customerHomeScreen:
        return SlideRoute(page: const CustomerHomeScreen(), x: 1, y: 0);
      case RoutesName.bottomNavigationBarScreen:
        return SlideRoute(page: const BottomNavigationBarScreen(), x: 1, y: 0);
      case RoutesName.customerAllProductScreen:
        return SlideRoute(page: const CustomerAllProductScreen(), x: 1, y: 0);
      case RoutesName.customerProductDetailsScreen:
        final arguments = settings.arguments as Map<String, dynamic>;
        return SlideRoute(
            page: CustomerProductDetailsScreen(arguments: arguments),
            x: 1,
            y: 0);
      case RoutesName.checkOutScreen:
        return SlideRoute(page: const CheckOutScreen(), x: 1, y: 0);
      case RoutesName.customerAddressScreen:
        return SlideRoute(page: const CustomerAddressScreen(), x: 1, y: 0);
      case RoutesName.customerAddNewAddressScreen:
        final arguments = settings.arguments as Map<String, dynamic>;
        return SlideRoute(
            page: CustomerAddNewAddressScreen(arguments: arguments),
            x: 1,
            y: 0);
      case RoutesName.congrotulationsScreen:
        return SlideRoute(page: const CongrotulationsScreen(), x: 1, y: 0);
      case RoutesName.customeHireConsutantScreen:
        return SlideRoute(page: const CustomeHireConsutantScreen(), x: 1, y: 0);
      case RoutesName.cartScreen:
        return SlideRoute(page: const CartScreen(), x: 1, y: 0);
      case RoutesName.applyNocScreen:
        return SlideRoute(page: const ApplyNocScreen(), x: 1, y: 0);
      case RoutesName.consultantInfoScreen:
        final arguments = settings.arguments as Map<String, dynamic>;
        return SlideRoute(
            page: ConsultantInfoScreen(arguments: arguments), x: 1, y: 0);
      case RoutesName.chatScreen:
        return SlideRoute(page: ChatScreen(), x: 1, y: 0);
      case RoutesName.customerProfileScreen:
        return SlideRoute(page: CustomerProfileScreen(), x: 1, y: 0);
      case RoutesName.notificationScreen:
        return SlideRoute(page: NotificationScreen(), x: 1, y: 0);
      case RoutesName.reviewScreen:
        return SlideRoute(page: ReviewScreen(), x: 1, y: 0);
      case RoutesName.orderScreen:
        return SlideRoute(page: OrderScreen(), x: 1, y: 0);
      case RoutesName.orderInfoScreen:
        return SlideRoute(page: OrderInfoScreen(), x: 1, y: 0);
      case RoutesName.privacyPolicyScreen:
        return SlideRoute(page: PrivacyPolicyScreen(), x: 1, y: 0);
      case RoutesName.faqScreen:
        return SlideRoute(page: FaqScreen(), x: 1, y: 0);
      case RoutesName.customerSignUpScreen:
        return SlideRoute(page: CustomerSignUpScreen(), x: 1, y: 0);
      case RoutesName.SellerSignUpScreen:
        return SlideRoute(page: SellerSignUp(), x: 1, y: 0);
      case RoutesName.ConsultantSignUpScreen:
        return SlideRoute(page: ConsultantSignUpScreen(), x: 1, y: 0);
      case RoutesName.RoleScreen:
        return SlideRoute(page: RoleScreen(), x: 1, y: 0);
      case RoutesName.SignUpOtpScreen:
        final arguments = settings.arguments as Map<String, dynamic>;
        return SlideRoute(
            page: SignUpOtpVerifyScreen(arguments: arguments), x: 1, y: 0);

      // ------------Selller ------

      case RoutesName.SellerHomeScreen:
        return SlideRoute(page: const SellerHomeScreen(), x: 1, y: 0);
      case RoutesName.SellerProfileScreen:
        return SlideRoute(page: const SellerProfileScreen(), x: 1, y: 0);
      case RoutesName.SellerProfileDetailScreen:
        return SlideRoute(page: const SellerProfileDetailScreen(), x: 1, y: 0);
      case RoutesName.SellerAddInventoryScreen:
        return SlideRoute(page: const SellerAddInventoryScreen(), x: 1, y: 0);
      case RoutesName.SellerAddInventoryGeneralScreen:
        final arguments = settings.arguments as Map<String, dynamic>;
        return SlideRoute(
            page: SellerAddInventoryGeneralScreen(arguments: arguments),
            x: 1,
            y: 0);
      case RoutesName.SellerAddGalleryScreen:
        final arguments = settings.arguments as Map<String, dynamic>;
        return SlideRoute(
            page: SellerAddGalleryScreen(arguments: arguments), x: 1, y: 0);
      case RoutesName.SellerWalletScreen:
        return SlideRoute(page: const SellerWalletScreen(), x: 1, y: 0);
      case RoutesName.SellerOrderScreen:
        return SlideRoute(page: const SellerOrderScreen(), x: 1, y: 0);
      case RoutesName.SellerBottomNavBar:
        return SlideRoute(page: const SellerBottomNavBar(), x: 1, y: 0);
      case RoutesName.sellerRegistratinScreen:
        return SlideRoute(page: const SellerRegistratinScreen(), x: 1, y: 0);
      case RoutesName.sellerNotificationScreen:
        return SlideRoute(page: const SellerNotificationScreen(), x: 1, y: 0);
      case RoutesName.sellerPrivacyPolicyScreen:
        return SlideRoute(page: const SellerPrivacyPolicyScreen(), x: 1, y: 0);
      case RoutesName.sellerAllProductScreen:
        return SlideRoute(page: const SellerAllProductScreen(), x: 1, y: 0);
      case RoutesName.sellerProductDetailsScreen:
      final arguments = settings.arguments as Map<String, dynamic>;
        return SlideRoute(page:  SellerProductDetailsScreen(arguments: arguments), x: 1, y: 0);
      case RoutesName.sellerEditProductScreen:
      final arguments = settings.arguments as Map<String, dynamic>;
        return SlideRoute(page:  SellerEditProductScreen(arguments: arguments), x: 1, y: 0);

      // --------- consultant ------
      case RoutesName.consultantHomeScreen:
        return SlideRoute(page: const ConsultantHomeScreen(), x: 1, y: 0);
      case RoutesName.consultantBottomNavigationBarScreen:
        return SlideRoute(
            page: const ConsultantBottomNavigationBarScreen(), x: 1, y: 0);
      case RoutesName.consultantProfileScreen:
        return SlideRoute(page: const ConsultantProfileScreen(), x: 1, y: 0);
      case RoutesName.consultantProfileDetailScreen:
        return SlideRoute(
            page: const ConsultantProfileDetailScreen(), x: 1, y: 0);
      case RoutesName.consultantRegistratinScreen:
        return SlideRoute(
            page: const ConsultantRegistratinScreen(), x: 1, y: 0);
      case RoutesName.consultantChatListScreen:
        return SlideRoute(page: const ConsultantChatListScreen(), x: 1, y: 0);
      case RoutesName.consultantWalletScreen:
        return SlideRoute(page: const ConsultantWalletScreen(), x: 1, y: 0);
      case RoutesName.consultantChatMassageScreen:
        return SlideRoute(page: ConsultantChatMassageScreen(), x: 1, y: 0);
      case RoutesName.consultantUserInfoScreen:
        return SlideRoute(page: const ConsultantUserInfoScreen(), x: 1, y: 0);
      case RoutesName.consultantNotificationScreen:
        return SlideRoute(
            page: const ConsultantNotificationScreen(), x: 1, y: 0);
      case RoutesName.consultantCoustomerReview:
        return SlideRoute(page: const ConsultantCoustomerReview(), x: 1, y: 0);

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('NO route defined'),
            ),
          );
        });
    }
  }
}
