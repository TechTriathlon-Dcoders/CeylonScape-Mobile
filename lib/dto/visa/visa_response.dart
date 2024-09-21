class VisaResponse{
  int id;
  String fullName;
  String email;

  VisaResponse({
    required this.id,
    required this.fullName,
    required this.email
  });

  factory VisaResponse.fromJson(Map<String, dynamic> json) => VisaResponse(
    id: json["id"],
    fullName: json["fullName"],
    email: json["email"]
  );

  // Map<String, dynamic> toJson() => {
  //   "id": id,
  //   "fullName": fullName,
  //   "email": email
  // };
}