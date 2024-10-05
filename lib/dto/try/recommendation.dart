class TryRecommendationRequest {
  String fullName;
  String email;
  List<String> activities;
  List<String> bucketList;

  TryRecommendationRequest({
    required this.fullName,
    required this.email,
    required this.activities,
    required this.bucketList,
  });

  factory TryRecommendationRequest.fromJson(Map<String, dynamic> json) => TryRecommendationRequest(
    fullName: json['fullName'],
    email: json['email'],
    activities: List<String>.from(json['activities']),
    bucketList: List<String>.from(json['bucketList']),
  );

  Map<String, dynamic> toJson() => {
    "fullName": fullName,
    "email": email,
    "activities": activities,
    "bucketList": bucketList,
  };

  Map<String, dynamic> toJsonActivitiesOnly() => {
    "activities": activities
  };

  Map<String, dynamic> toJsonBucketListOnly() => {
    "activities": bucketList,
  };
}