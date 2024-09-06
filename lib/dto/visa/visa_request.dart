class VisaRequest {
  String email;
  String password;

  VisaRequest({
    required this.email,
    required this.password
  });

  factory VisaRequest.fromJson(Map<String, dynamic> json) => VisaRequest(
      email: json["mobileNumber"],
      password: json["password"]
  );

  Map<String, dynamic> toJson() => {
    "email" : email,
    "password" : password,
  };
}