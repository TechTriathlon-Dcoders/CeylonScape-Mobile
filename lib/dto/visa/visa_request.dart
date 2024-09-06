class VisaRequest {
  String picture;
  String fullName;
  String nationality;
  String gender;
  String dateOfBirth;
  String birthPlace;
  String birthCountry;
  String civilStatus;
  String height;
  String peculiarity;
  String domicileCountryAddress;
  String sriLankanAddress;
  String telephoneNumber;
  String mobileNumber;
  String email;
  String nameOfWorkPlace;
  String addressOfWorkPlace;
  String workPlaceEmail;
  String passportNumber;
  String placeOfPassportIssue;
  String dateOfPassportIssue;
  String dateOfPassportExpiry;
  String previousPassportNumber;
  String placeOfPreviousPassportIssue;
  String dateOfPreviousPassportIssue;
  String dateOfPreviousPassportExpiry;
  String spouseFullName;
  String spouseNationality;
  String spousePostalAddress;
  String spousePassportNumber;
  String spouseDateOfPassportExpiry;
  String dateOfNaturalized;
  String placeOfNaturalized;
  String formerNationality;
  String routeAndModeOfTravel;
  String periodForVisitVisa;
  String lastPlaceOfResidence;
  String dateOfLeaving;
  String lastObtainedVisaType;
  String lastObtainedVisaDateOfIssue;
  String lastObtainedVisaPeriodOfValidity;
  String lastObtainedVisaResidenceVisaNumber;
  String refusedVisaReason;
  String emergencyContactName;
  String emergencyContactAddress;
  String emergencyContactContactNumber;
  String emergencyContactRelationship;
  String emergencyContactBelongingMoneyAmount;
  String emergencyContactNameOfCreditCard;
  String emergencyContactSpendableAmount;
  String urgeSupportReason;

  VisaRequest({
    required this.picture,
    required this.fullName,
    required this.nationality,
    required this.gender,
    required this.dateOfBirth,
    required this.birthPlace,
    required this.birthCountry,
    required this.civilStatus,
    required this.height,
    required this.peculiarity,
    required this.domicileCountryAddress,
    required this.sriLankanAddress,
    required this.telephoneNumber,
    required this.mobileNumber,
    required this.email,
    required this.nameOfWorkPlace,
    required this.addressOfWorkPlace,
    required this.workPlaceEmail,
    required this.passportNumber,
    required this.placeOfPassportIssue,
    required this.dateOfPassportIssue,
    required this.dateOfPassportExpiry,
    required this.previousPassportNumber,
    required this.placeOfPreviousPassportIssue,
    required this.dateOfPreviousPassportIssue,
    required this.dateOfPreviousPassportExpiry,
    required this.spouseFullName,
    required this.spouseNationality,
    required this.spousePostalAddress,
    required this.spousePassportNumber,
    required this.spouseDateOfPassportExpiry,
    required this.dateOfNaturalized,
    required this.placeOfNaturalized,
    required this.formerNationality,
    required this.routeAndModeOfTravel,
    required this.periodForVisitVisa,
    required this.lastPlaceOfResidence,
    required this.dateOfLeaving,
    required this.lastObtainedVisaType,
    required this.lastObtainedVisaDateOfIssue,
    required this.lastObtainedVisaPeriodOfValidity,
    required this.lastObtainedVisaResidenceVisaNumber,
    required this.refusedVisaReason,
    required this.emergencyContactName,
    required this.emergencyContactAddress,
    required this.emergencyContactContactNumber,
    required this.emergencyContactRelationship,
    required this.emergencyContactBelongingMoneyAmount,
    required this.emergencyContactNameOfCreditCard,
    required this.emergencyContactSpendableAmount,
    required this.urgeSupportReason,
  });

  factory VisaRequest.fromJson(Map<String, dynamic> json) => VisaRequest(
      picture: json['picture'],
      fullName: json['fullName'],
      nationality: json['nationality'],
      gender: json['gender'],
      dateOfBirth: json['dateOfBirth'],
      birthPlace: json['birthPlace'],
      birthCountry: json['birthCountry'],
      civilStatus: json['civilStatus'],
      height: json['height'],
      peculiarity: json['peculiarity'],
      domicileCountryAddress: json['domicileCountryAddress'],
      sriLankanAddress: json['sriLankanAddress'],
      telephoneNumber: json['telephoneNumber'],
      mobileNumber: json['mobileNumber'],
      email: json['email'],
      nameOfWorkPlace: json['nameOfWorkPlace'],
      addressOfWorkPlace: json['addressOfWorkPlace'],
      workPlaceEmail: json['workPlaceEmail'],
      passportNumber: json['passportNumber'],
      placeOfPassportIssue: json['placeOfPassportIssue'],
      dateOfPassportIssue: json['dateOfPassportIssue'],
      dateOfPassportExpiry: json['dateOfPassportExpiry'],
      previousPassportNumber: json['previousPassportNumber'],
      placeOfPreviousPassportIssue: json['placeOfPreviousPassportIssue'],
      dateOfPreviousPassportIssue: json['dateOfPreviousPassportIssue'],
      dateOfPreviousPassportExpiry: json['dateOfPreviousPassportExpiry'],
      spouseFullName: json['spouseFullName'],
      spouseNationality: json['spouseNationality'],
      spousePostalAddress: json['spousePostalAddress'],
      spousePassportNumber: json['spousePassportNumber'],
      spouseDateOfPassportExpiry: json['spouseDateOfPassportExpiry'],
      dateOfNaturalized: json['dateOfNaturalized'],
      placeOfNaturalized: json['placeOfNaturalized'],
      formerNationality: json['formerNationality'],
      routeAndModeOfTravel: json['routeAndModeOfTravel'],
      periodForVisitVisa: json['periodForVisitVisa'],
      lastPlaceOfResidence: json['lastPlaceOfResidence'],
      dateOfLeaving: json['dateOfLeaving'],
      lastObtainedVisaType: json['lastObtainedVisaType'],
      lastObtainedVisaDateOfIssue: json['lastObtainedVisaDateOfIssue'],
      lastObtainedVisaPeriodOfValidity: json['lastObtainedVisaPeriodOfValidity'],
      lastObtainedVisaResidenceVisaNumber: json['lastObtainedVisaResidenceVisaNumber'],
      refusedVisaReason: json['refusedVisaReason'],
      emergencyContactName: json['emergencyContactName'],
      emergencyContactAddress: json['emergencyContactAddress'],
      emergencyContactContactNumber: json['emergencyContactContactNumber'],
      emergencyContactRelationship: json['emergencyContactRelationship'],
      emergencyContactBelongingMoneyAmount: json['emergencyContactBelongingMoneyAmount'],
      emergencyContactNameOfCreditCard: json['emergencyContactNameOfCreditCard'],
      emergencyContactSpendableAmount: json['emergencyContactSpendableAmount'],
      urgeSupportReason: json['urgeSupportReason']
  );

  Map<String, dynamic> toJson() => {
    "picture" : picture,
    "fullName" : fullName,
    "nationality" : nationality,
    "gender" : gender,
    "dateOfBirth" : dateOfBirth,
    "birthPlace" : birthPlace,
    "birthCountry" : birthCountry,
    "civilStatus" : civilStatus,
    "height" : height,
    "peculiarity" : peculiarity,
    "domicileCountryAddress" : domicileCountryAddress,
    "sriLankanAddress" : sriLankanAddress,
    "telephoneNumber" : telephoneNumber,
    "mobileNumber" : mobileNumber,
    "email" : email,
    "nameOfWorkPlace" : nameOfWorkPlace,
    "addressOfWorkPlace" : addressOfWorkPlace,
    "workPlaceEmail" : workPlaceEmail,
    "passportNumber" : passportNumber,
    "placeOfPassportIssue" : placeOfPassportIssue,
    "dateOfPassportIssue" : dateOfPassportIssue,
    "dateOfPassportExpiry" : dateOfPassportExpiry,
    "previousPassportNumber" : previousPassportNumber,
    "placeOfPreviousPassportIssue" : placeOfPreviousPassportIssue,
    "dateOfPreviousPassportIssue" : dateOfPreviousPassportIssue,
    "dateOfPreviousPassportExpiry" : dateOfPreviousPassportExpiry,
    "spouseFullName" : spouseFullName,
    "spouseNationality" : spouseNationality,
    "spousePostalAddress" : spousePostalAddress,
    "spousePassportNumber" : spousePassportNumber,
    "spouseDateOfPassportExpiry" : spouseDateOfPassportExpiry,
    "dateOfNaturalized" : dateOfNaturalized,
    "placeOfNaturalized" : placeOfNaturalized,
    "formerNationality" : formerNationality,
    "routeAndModeOfTravel" : routeAndModeOfTravel,
    "periodForVisitVisa" : periodForVisitVisa,
    "lastPlaceOfResidence" : lastPlaceOfResidence,
    "dateOfLeaving" : dateOfLeaving,
    "lastObtainedVisaType" : lastObtainedVisaType,
    "lastObtainedVisaDateOfIssue" : lastObtainedVisaDateOfIssue,
    "lastObtainedVisaPeriodOfValidity" : lastObtainedVisaPeriodOfValidity,
    "lastObtainedVisaResidenceVisaNumber" : lastObtainedVisaResidenceVisaNumber,
    "refusedVisaReason" : refusedVisaReason,
    "emergencyContactName" : emergencyContactName,
    "emergencyContactAddress" : emergencyContactAddress,
    "emergencyContactContactNumber" : emergencyContactContactNumber,
    "emergencyContactRelationship" : emergencyContactRelationship,
    "emergencyContactBelongingMoneyAmount" : emergencyContactBelongingMoneyAmount,
    "emergencyContactNameOfCreditCard" : emergencyContactNameOfCreditCard,
    "emergencyContactSpendableAmount" : emergencyContactSpendableAmount,
    "urgeSupportReason" : urgeSupportReason,
  };
}