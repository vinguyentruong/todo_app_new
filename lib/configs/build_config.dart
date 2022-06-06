// import 'package:injectable/injectable.dart';
//
// @lazySingleton
// class BuildConfig {
//   static const String googleApisKey = 'AIzaSyBFyOynrXpO5Wfg0wStZDBUHOVQQxiL5LM';
//
//   static const bool debugLog = true;
//
//   static const String kBaseUrl = 'https://dev-api.wemu.co';
//   static const String kBaseSocketUrl = 'wss://dev-discovery-api.wemu.co';
//   static const String kMarketDomain = 'wemu.co';
//   static const String kBaseImageUrl = 'https://s3-ap-southeast-1.amazonaws.com/wemu-dev';
//   static const String kDefaultAppName = 'Wemu';
//   static const String kTermUrl = 'https://wemu.io/terms-of-use.html';
//   static const String kPrivacyPolicyUrl = 'https://wemu.io/privacy-policy.html';
//   static const String kAppleLoginRedirect = 'https://business.wemu.co/sign-up-apple';
//   static const String kAppleClientId = 'com.wemu.business';
//
//   static const String kIntercomIOS = 'ios_sdk-d0609e4054ff4dbbfa22089b1acd1bbd672042af';
//   static const String kIntercomAppID = 'ji4dzrcq';
//   static const String kIntercomAndroid = 'android_sdk-513d995b2b092922391fc037c338db271e8163d9';
//
//   static const String kAppStoreUrl = 'https://apps.apple.com/vn/app/wemu-business/id1472726070';
//   static const String kPlayStoreUrl = 'https://play.google.com/store/apps/details?id=com.wemu_ipad';
//
//   static const String kShipmateGuideStep1 =
//       'https://wemu-prod.s3.ap-southeast-1.amazonaws.com/statics/shipmate_tutorial_1.webp';
//   static const String kShipmateGuideStep2 =
//       'https://wemu-prod.s3.ap-southeast-1.amazonaws.com/statics/shipmate_tutorial_2.webp';
//
//   static const String kImportProductsTemplate =
//       'https://wemu-prod.s3.ap-southeast-1.amazonaws.com/static/products.xlsx';
//   static const String kPaymentTermCondition =
//       'https://marketplace-dev.wemu.co/payment-terms-and-conditions';
// }

// @lazySingleton
// class BuildConfig {
//   static const String googleApisKey = 'AIzaSyBFyOynrXpO5Wfg0wStZDBUHOVQQxiL5LM';
//
//   static const bool debugLog = false;
//
//   static const String kBaseUrl = 'http://192.168.1.4:5050';
//   static const String kBaseSocketUrl = 'ws://192.168.1.4:5050';
//   static const String kMarketDomain = 'wemu.co';
//   static const String kBaseImageUrl =
//       'https://s3-ap-southeast-1.amazonaws.com/wemu-dev';
//   static const String kDefaultAppName = 'Wemu';
//   static const String kTermUrl = 'https://wemu.io/terms-of-use.html';
//   static const String kPrivacyPolicyUrl = 'https://wemu.io/privacy-policy.html';
//   static const String kAppleLoginRedirect =
//       'https://business.wemu.co/sign-up-apple';
//   static const String kAppleClientId = 'com.wemu.business';
//
//   static const String kIntercomIOS =
//       'ios_sdk-d0609e4054ff4dbbfa22089b1acd1bbd672042af';
//   static const String kIntercomAppID = 'ji4dzrcq';
//   static const String kIntercomAndroid =
//       'android_sdk-513d995b2b092922391fc037c338db271e8163d9';
//
//   static const String kAppStoreUrl =
//       'https://apps.apple.com/vn/app/wemu-business/id1472726070';
//   static const String kPlayStoreUrl =
//       'https://play.google.com/store/apps/details?id=com.wemu_ipad';
//
//   static const String kShipmateGuideStep1 =
//       'https://wemu-prod.s3.ap-southeast-1.amazonaws.com/statics/shipmate_tutorial_1.webp';
//   static const String kShipmateGuideStep2 =
//       'https://wemu-prod.s3.ap-southeast-1.amazonaws.com/statics/shipmate_tutorial_2.webp';
//   static const String kImportProductsTemplate = 'https://wemu-prod.s3.ap-southeast-1.amazonaws.com/static/products.xlsx';
//   static const String kPaymentTermCondition = 'https://business-dev.wemu.co/payment-terms-and-conditions';
// }

import 'package:injectable/injectable.dart';

@lazySingleton
class BuildConfig {
  static const bool debugLog = true;
  static const String kDefaultAppName = 'Todo App';
}
