class RecommendationRequest {
  int visaApplicationID;
  String fullName;
  String email;
  List<String> activities;
  List<String> bucketList;

  RecommendationRequest({
    required this.visaApplicationID,
    required this.fullName,
    required this.email,
    required this.activities,
    required this.bucketList,
  });

  factory RecommendationRequest.fromJson(Map<String, dynamic> json) => RecommendationRequest(
      visaApplicationID: json['visaApplicationID'],
      fullName: json['fullName'],
      email: json['email'],
      activities: List<String>.from(json['activities']),
      bucketList: List<String>.from(json['bucketList']),
  );

  Map<String, dynamic> toJson() => {
    "visaApplicationID": visaApplicationID,
    "fullName": fullName,
    "email": email,
    "activities": activities,
    "bucketList": bucketList,
  };

  Map<String, dynamic> toJsonActivitiesOnly() => {
    "userinfoId": visaApplicationID,
    "activities": activities
  };

  Map<String, dynamic> toJsonBucketListOnly() => {
    "userinfoId": visaApplicationID,
    "activities": bucketList,
  };
}