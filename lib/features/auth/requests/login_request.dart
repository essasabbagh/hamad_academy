class LoginRequest {
  LoginRequest({
    this.emailOrSerialNumber,
    this.password,
    this.fcmToken,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
    emailOrSerialNumber: json['email_or_serial_number'],
    password: json['password'],
    fcmToken: json['fcm_token'],
  );

  String? emailOrSerialNumber;
  String? password;
  String? fcmToken;

  Map<String, dynamic> toJson() => {
    'email_or_serial_number': emailOrSerialNumber,
    'password': password,
    // 'fcm_token': fcmToken,
  };
}
