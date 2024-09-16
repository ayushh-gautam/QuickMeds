import 'package:quickmeds_user/app/modules/book_time_module/book_time_binding.dart';
import 'package:quickmeds_user/app/modules/book_time_module/book_time_page.dart';
import 'package:quickmeds_user/app/modules/edit_medicine_reminder_module/edit_medicine_reminder_bindings.dart';
import 'package:quickmeds_user/app/modules/edit_medicine_reminder_module/edit_medicine_reminder_page.dart';
import 'package:quickmeds_user/app/modules/edit_profile_screen_module/edit_profile_screen_bindings.dart';
import 'package:quickmeds_user/app/modules/edit_profile_screen_module/edit_profile_screen_page.dart';
import 'package:quickmeds_user/app/modules/medicine_request_module/medicine_request_screen_bindings.dart';
import 'package:quickmeds_user/app/modules/medicine_request_module/medicine_request_screen_page.dart';
import 'package:quickmeds_user/app/modules/track_booking_module/track_booking_bindings.dart';
import 'package:quickmeds_user/app/modules/track_booking_module/track_booking_page.dart';

import '../../app/modules/search_screen_module/search_screen_page.dart';
import '../../app/modules/search_screen_module/search_screen_bindings.dart';
import '../../app/modules/my_lab_test_module/my_lab_test_page.dart';
import '../../app/modules/my_lab_test_module/my_lab_test_bindings.dart';
import '../../app/modules/booking_success_module/booking_success_page.dart';
import '../../app/modules/booking_success_module/booking_success_bindings.dart';
import '../../app/modules/booking_summary_module/booking_summary_page.dart';
import '../../app/modules/booking_summary_module/booking_summary_bindings.dart';
import '../../app/modules/add_patient_module/add_patient_page.dart';
import '../../app/modules/add_patient_module/add_patient_bindings.dart';
import '../../app/modules/choose_patient_module/choose_patient_page.dart';
import '../../app/modules/choose_patient_module/choose_patient_bindings.dart';
import '../../app/modules/time_slot_module/time_slot_page.dart';
import '../../app/modules/time_slot_module/time_slot_bindings.dart';
import '../../app/modules/lab_test_cart_module/lab_test_cart_page.dart';
import '../../app/modules/lab_test_cart_module/lab_test_cart_bindings.dart';
import '../../app/modules/lab_test_detail_module/lab_test_detail_page.dart';
import '../../app/modules/lab_test_detail_module/lab_test_detail_bindings.dart';
import '../../app/modules/track_order_module/track_order_page.dart';
import '../../app/modules/track_order_module/track_order_bindings.dart';
import '../../app/modules/order_placed_screen_module/order_placed_screen_page.dart';
import '../../app/modules/order_placed_screen_module/order_placed_screen_bindings.dart';
import '../../app/modules/cart_checkout_module/cart_checkout_page.dart';
import '../../app/modules/cart_checkout_module/cart_checkout_bindings.dart';
import '../../app/modules/add_address_module/add_address_page.dart';
import '../../app/modules/add_address_module/add_address_bindings.dart';
import '../../app/modules/ask_question_screen_module/ask_question_screen_page.dart';
import '../../app/modules/ask_question_screen_module/ask_question_screen_bindings.dart';
import '../../app/modules/confirm_order_module/confirm_order_page.dart';
import '../../app/modules/confirm_order_module/confirm_order_bindings.dart';
import '../../app/modules/my_prescription_module/my_prescription_page.dart';
import '../../app/modules/my_prescription_module/my_prescription_bindings.dart';
import '../../app/modules/orderby_prescription_module/orderby_prescription_page.dart';
import '../../app/modules/orderby_prescription_module/orderby_prescription_bindings.dart';
import '../../app/modules/upload_prescription_module/upload_prescription_page.dart';
import '../../app/modules/upload_prescription_module/upload_prescription_bindings.dart';
import '../../app/modules/all_reminders_module/all_reminders_page.dart';
import '../../app/modules/all_reminders_module/all_reminders_bindings.dart';
import '../../app/modules/add_medicine_reminder_module/add_medicine_reminder_page.dart';
import '../../app/modules/add_medicine_reminder_module/add_medicine_reminder_bindings.dart';
import '../../app/modules/my_orders_screen_module/my_orders_screen_page.dart';
import '../../app/modules/my_orders_screen_module/my_orders_screen_bindings.dart';
import '../../app/modules/wallet_screen_module/wallet_screen_page.dart';
import '../../app/modules/wallet_screen_module/wallet_screen_bindings.dart';
import '../../app/modules/my_health_screen_module/my_health_screen_page.dart';
import '../../app/modules/my_health_screen_module/my_health_screen_bindings.dart';
import '../../app/modules/terms_screen_module/terms_screen_page.dart';
import '../../app/modules/terms_screen_module/terms_screen_bindings.dart';
import '../../app/modules/return_policy_screen_module/return_policy_screen_page.dart';
import '../../app/modules/return_policy_screen_module/return_policy_screen_bindings.dart';
import '../../app/modules/privacy_policy_screen_module/privacy_policy_screen_page.dart';
import '../../app/modules/privacy_policy_screen_module/privacy_policy_screen_bindings.dart';
import '../../app/modules/profile_screen_module/profile_screen_page.dart';
import '../../app/modules/profile_screen_module/profile_screen_bindings.dart';
import '../../app/modules/faq_screen_module/faq_screen_page.dart';
import '../../app/modules/faq_screen_module/faq_screen_bindings.dart';
import '../../app/modules/notification_screen_module/notification_screen_page.dart';
import '../../app/modules/notification_screen_module/notification_screen_bindings.dart';
import '../../app/modules/wishlist_screen_module/wishlist_screen_page.dart';
import '../../app/modules/wishlist_screen_module/wishlist_screen_bindings.dart';
import '../../app/modules/top_selling_screen_module/top_selling_screen_page.dart';
import '../../app/modules/top_selling_screen_module/top_selling_screen_bindings.dart';
import '../../app/modules/rating_review_screen_module/rating_review_screen_page.dart';
import '../../app/modules/rating_review_screen_module/rating_review_screen_bindings.dart';
import '../../app/modules/product_detail_screen_module/product_detail_screen_page.dart';
import '../../app/modules/product_detail_screen_module/product_detail_screen_bindings.dart';
import '../../app/modules/medicine_list_module/medicine_list_page.dart';
import '../../app/modules/medicine_list_module/medicine_list_bindings.dart';
import '../../app/modules/packages_detail_module/packages_detail_page.dart';
import '../../app/modules/packages_detail_module/packages_detail_bindings.dart';
import '../../app/modules/explore_packages_module/explore_packages_page.dart';
import '../../app/modules/explore_packages_module/explore_packages_bindings.dart';
import '../../app/modules/drawer_screen_module/drawer_screen_page.dart';
import '../../app/modules/drawer_screen_module/drawer_screen_bindings.dart';
import '../../app/modules/cart_screen_module/cart_screen_page.dart';
import '../../app/modules/cart_screen_module/cart_screen_bindings.dart';
import '../../app/modules/lab_test_module/lab_test_page.dart';
import '../../app/modules/lab_test_module/lab_test_bindings.dart';
import '../../app/modules/category_screen_module/category_screen_page.dart';
import '../../app/modules/category_screen_module/category_screen_bindings.dart';
import '../../app/modules/home_screen_module/home_screen_page.dart';
import '../../app/modules/home_screen_module/home_screen_bindings.dart';
import '../../app/modules/tab_screen_module/tab_screen_page.dart';
import '../../app/modules/tab_screen_module/tab_screen_bindings.dart';
import '../../app/modules/sign_up_screen_module/sign_up_screen_page.dart';
import '../../app/modules/sign_up_screen_module/sign_up_screen_bindings.dart';
import '../../app/modules/verification_screen_module/verification_screen_page.dart';
import '../../app/modules/verification_screen_module/verification_screen_bindings.dart';
import '../../app/modules/login_screen_module/login_screen_page.dart';
import '../../app/modules/login_screen_module/login_screen_bindings.dart';
import '../../app/modules/onboard_screen_module/onboard_screen_page.dart';
import '../../app/modules/onboard_screen_module/onboard_screen_bindings.dart';
import '../../app/modules/splash_screen_module/splash_screen_page.dart';
import '../../app/modules/splash_screen_module/splash_screen_bindings.dart';
import '../modules/z. my_app_module/my_app_bindings.dart';
import '../modules/z. my_app_module/my_app_page.dart';
import 'package:get/get.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.MY_APP,
      page: () => const MyAppPage(),
      binding: MyAppBinding(),
    ),
    GetPage(
      name: Routes.SPLASH_SCREEN,
      page: () => SplashScreenPage(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: Routes.ONBOARD_SCREEN,
      page: () => OnboardScreenPage(),
      binding: OnboardScreenBinding(),
    ),
    GetPage(
      name: Routes.LOGIN_SCREEN,
      page: () => LoginScreenPage(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: Routes.VERIFICATION_SCREEN,
      page: () => VerificationScreenPage(),
      binding: VerificationScreenBinding(),
    ),
    GetPage(
      name: Routes.SIGN_UP_SCREEN,
      page: () => SignUpScreenPage(),
      binding: SignUpScreenBinding(),
    ),
    GetPage(
      name: Routes.TAB_SCREEN,
      page: () => TabScreenPage(),
      binding: TabScreenBinding(),
    ),
    GetPage(
      name: Routes.HOME_SCREEN,
      page: () => HomeScreenPage(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: Routes.CATEGORY_SCREEN,
      page: () => CategoryScreenPage(),
      binding: CategoryScreenBinding(),
    ),
    GetPage(
      name: Routes.UPLOAD_PRESCRIPTION,
      page: () => UploadPrescriptionPage(),
      binding: UploadPrescriptionBinding(),
    ),
    GetPage(
      name: Routes.LAB_TEST,
      page: () => LabTestPage(),
      binding: LabTestBinding(),
    ),
    GetPage(
      name: Routes.CART_SCREEN,
      page: () => CartScreenPage(),
      binding: CartScreenBinding(),
    ),
    GetPage(
      name: Routes.DRAWER_SCREEN,
      page: () => DrawerScreenPage(),
      binding: DrawerScreenBinding(),
    ),
    GetPage(
      name: Routes.EXPLORE_PACKAGES,
      page: () => ExplorePackagesPage(),
      binding: ExplorePackagesBinding(),
    ),
    GetPage(
      name: Routes.PACKAGES_DETAIL,
      page: () => PackagesDetailPage(),
      binding: PackagesDetailBinding(),
    ),
    GetPage(
      name: Routes.MEDICINE_LIST,
      page: () => MedicineListPage(),
      binding: MedicineListBinding(),
    ),
    GetPage(
      name: Routes.PRODUCT_DETAIL_SCREEN,
      page: () => ProductDetailScreenPage(),
      binding: ProductDetailScreenBinding(),
    ),
    GetPage(
      name: Routes.RATING_REVIEW_SCREEN,
      page: () => RatingReviewScreenPage(),
      binding: RatingReviewScreenBinding(),
    ),
    GetPage(
      name: Routes.TOP_SELLING_SCREEN,
      page: () => TopSellingScreenPage(),
      binding: TopSellingScreenBinding(),
    ),
    GetPage(
      name: Routes.WISHLIST_SCREEN,
      page: () => WishlistScreenPage(),
      binding: WishlistScreenBinding(),
    ),
    GetPage(
      name: Routes.NOTIFICATION_SCREEN,
      page: () => NotificationScreenPage(),
      binding: NotificationScreenBinding(),
    ),
    GetPage(
      name: Routes.FAQ_SCREEN,
      page: () => FaqScreenPage(),
      binding: FaqScreenBinding(),
    ),
    GetPage(
      name: Routes.PROFILE_SCREEN,
      page: () => ProfileScreenPage(),
      binding: ProfileScreenBinding(),
    ),
    GetPage(
      name: Routes.EDIT_PROFILE_SCREEN,
      page: () => EditProfileScreenPage(),
      binding: EditProfileScreenBinding(),
    ),
    GetPage(
      name: Routes.PRIVACY_POLICY_SCREEN,
      page: () => PrivacyPolicyScreenPage(),
      binding: PrivacyPolicyScreenBinding(),
    ),
    GetPage(
      name: Routes.RETURN_POLICY_SCREEN,
      page: () => ReturnPolicyScreenPage(),
      binding: ReturnPolicyScreenBinding(),
    ),
    GetPage(
      name: Routes.TERMS_SCREEN,
      page: () => TermsScreenPage(),
      binding: TermsScreenBinding(),
    ),
    GetPage(
      name: Routes.MY_HEALTH_SCREEN,
      page: () => MyHealthScreenPage(),
      binding: MyHealthScreenBinding(),
    ),
    GetPage(
      name: Routes.WALLET_SCREEN,
      page: () => WalletScreenPage(),
      binding: WalletScreenBinding(),
    ),
    GetPage(
      name: Routes.ASK_QUESTION_SCREEN,
      page: () => AskQuestionScreenPage(),
      binding: AskQuestionScreenBinding(),
    ),
    GetPage(
      name: Routes.MEDICINE_REQUEST_SCREEN,
      page: () => MedicineRequestScreenPage(),
      binding: MedicineRequestScreenBinding(),
    ),
    GetPage(
      name: Routes.MY_ORDERS_SCREEN,
      page: () => MyOrdersScreenPage(),
      binding: MyOrdersScreenBinding(),
    ),
    GetPage(
      name: Routes.ADD_MEDICINE_REMINDER,
      page: () => AddMedicineReminderPage(),
      binding: AddMedicineReminderBinding(),
    ),
    GetPage(
      name: Routes.EDIT_MEDICINE_REMINDER,
      page: () => EditMedicineReminderPage(),
      binding: EditMedicineReminderBinding(),
    ),
    GetPage(
      name: Routes.ALL_REMINDERS,
      page: () => AllRemindersPage(),
      binding: AllRemindersBinding(),
    ),
    GetPage(
      name: Routes.ORDERBY_PRESCRIPTION,
      page: () => OrderbyPrescriptionPage(),
      binding: OrderbyPrescriptionBinding(),
    ),
    GetPage(
      name: Routes.MY_PRESCRIPTION,
      page: () => MyPrescriptionPage(),
      binding: MyPrescriptionBinding(),
    ),
    GetPage(
      name: Routes.CONFIRM_ORDER,
      page: () => ConfirmOrderPage(),
      binding: ConfirmOrderBinding(),
    ),
    GetPage(
      name: Routes.ADD_ADDRESS,
      page: () => AddAddressPage(),
      binding: AddAddressBinding(),
    ),
    GetPage(
      name: Routes.CART_CHECKOUT,
      page: () => CartCheckoutPage(),
      binding: CartCheckoutBinding(),
    ),
    GetPage(
      name: Routes.ORDER_PLACED_SCREEN,
      page: () => OrderPlacedScreenPage(),
      binding: OrderPlacedScreenBinding(),
    ),
    GetPage(
      name: Routes.TRACK_ORDER,
      page: () => const TrackOrderPage(),
      binding: TrackOrderBinding(),
    ),
    GetPage(
      name: Routes.LAB_TEST_DETAIL,
      page: () => LabTestDetailPage(),
      binding: LabTestDetailBinding(),
    ),
    GetPage(
      name: Routes.LAB_TEST_CART,
      page: () => LabTestCartPage(),
      binding: LabTestCartBinding(),
    ),
    GetPage(
      name: Routes.TIME_SLOT,
      page: () => TimeSlotPage(),
      binding: TimeSlotBinding(),
    ),
    GetPage(
      name: Routes.CHOOSE_PATIENT,
      page: () => ChoosePatientPage(),
      binding: ChoosePatientBinding(),
    ),
    GetPage(
      name: Routes.ADD_PATIENT,
      page: () => AddPatientPage(),
      binding: AddPatientBinding(),
    ),
    GetPage(
      name: Routes.BOOKING_SUMMARY,
      page: () => BookingSummaryPage(),
      binding: BookingSummaryBinding(),
    ),
    GetPage(
      name: Routes.TRACK_BOOKING_PAGE,
      page: () => TrackBookingPage(),
      binding: TrackBookingBinding(),
    ),
    GetPage(
      name: Routes.BOOKING_SUCCESS,
      page: () => BookingSuccessPage(),
      binding: BookingSuccessBinding(),
    ),
    GetPage(
      name: Routes.MY_LAB_TEST,
      page: () => MyLabTestPage(),
      binding: MyLabTestBinding(),
    ),
    GetPage(
      name: Routes.SEARCH_SCREEN,
      page: () => SearchScreenPage(),
      binding: SearchScreenBinding(),
    ),
    GetPage(
        name: Routes.BOOKTIME_SCREEN,
        page: () => BookTimePage(),
        binding: BookTimeBinding())
  ];
}
