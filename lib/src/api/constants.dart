class Constants {
  static String baseUrl = "https://sandbox.api.lettutor.com/";
  static String register = "auth/register";
  static String registerByPhone = "auth/phone-register";
  static String resendOTP = "verify/phone-auth-verify/create";
  static String activatePhoneWithOTP = "verify/phone-auth-verify/activate";
  static String login = "auth/login";
  static String loginByPhone = "auth/phone-login";
  static String loginByGoogle = "auth/google";
  static String loginByFacebook = "auth/facebook";
  static String verifyAccount = "auth/verifyAccount"; // auth/verifyAccount?token=123
  static String refreshToken = "auth/refresh-token";
  static String forgotPassword = "user/forgotPassword";
}
