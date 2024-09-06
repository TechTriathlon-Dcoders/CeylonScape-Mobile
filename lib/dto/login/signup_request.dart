class SignUpRequest {
  String email;
  String firstName;
  String lastName;
  String mobileNumber;
  String password;

  SignUpRequest({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.password
  });

  factory SignUpRequest.fromJson(Map<String, dynamic> json) => SignUpRequest(
      email: json["mobileNumber"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      mobileNumber: json["phoneNumber"],
      password: json["password"]
  );

  Map<String, dynamic> toJson() => {
    "email" : email,
    "firstName" : firstName,
    "lastName" : lastName,
    "mobileNumber" : mobileNumber,
    "password" : password,
  };
}