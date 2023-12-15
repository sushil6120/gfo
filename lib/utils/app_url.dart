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
  static var allAddressApi = "$baseUrl/api/v1/shipping";
  static var deletAddressApi = "$baseUrl/api/v1/shipping/";
  static var updateAddressApi = "$baseUrl/api/v1/shipping/";
  static var productInfoApi = "$baseUrl/api/v1/product/";
  static var anotherProductApi = "$baseUrl/api/v1/product?limit=10&sellerId=";
  static var addToCartApi = "$baseUrl/api/v1/cart/add";



//   !--------consultaant---------!
  static var consultantRegistration = "$baseUrl/api/v1/auth/consultant/details";
  static var consultantGetBookedUser = "$baseUrl/api/v1/booking/consultant/users";



  // -----------Seller ----------------!
  static var sellerUploadProduct = "$baseUrl/api/v1/product";

 



}
