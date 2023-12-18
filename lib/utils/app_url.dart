class AppUrl {
  static var baseUrl = "https://gfo-backend-code.vercel.app";
  static var loginSendApi = "$baseUrl/api/v1/auth/user/login";
  static var loginOtpVerifyApi = "$baseUrl/api/v1/auth/otp/verify";
  static var consultantSignUpApi = "$baseUrl/api/v1/auth/consultant/signup";
  static var sellerSignUpApi = "$baseUrl/api/v1/auth/seller/signup";
  static var costumerSignUpApi = "$baseUrl/api/v1/auth/customer/signup";
  static var allProductApi = "$baseUrl/api/v1/product";
  static var allConsultantApis = "$baseUrl/api/v1/auth/consultants";
  static var singleConsultantApis = "$baseUrl/api/v1/auth/consultant/";
  static var applyNocApis = "$baseUrl/api/v1/noc/add";
  static var addAddressApi = "$baseUrl/api/v1/shipping/create";

//   !--------consultaant---------!
  static var consultantRegistration = "$baseUrl/api/v1/auth/consultant/details";
  static var sellerRegister = "$baseUrl/api/v1/auth/seller/details";
}
