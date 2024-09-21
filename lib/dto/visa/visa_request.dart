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

  Map<String, dynamic> toJson(int userId) => {
    "fullName": fullName,
    "nationality": nationality,
    "gender": gender,
    "dob": "${dateOfBirth}T00:00:00Z",
    "birthCountry": birthCountry,
    "birthPlace": birthPlace,
    "height": int.parse(height),
    "peculiarity": peculiarity,
    "domicileAddress": domicileCountryAddress,
    "addressDuringSriLanka": sriLankanAddress,
    "telephone": telephoneNumber,
    "mobile": mobileNumber,
    "email": email,
    "civilStatus": civilStatus == 'Single' ? 0 : 1,
    "image" : picture,
    "profession": {
          "id":0,
          "nameOfWorkplace": nameOfWorkPlace,
          "addressOfWorkplace": addressOfWorkPlace,
          "email": workPlaceEmail,
          "fax": "facs"
    },
    "emergencyContacts": [
      {
        "name": emergencyContactName,
        "address": emergencyContactAddress,
        "contact": emergencyContactContactNumber,
        "relationship": emergencyContactRelationship,
        "nameOfCreditCard": emergencyContactNameOfCreditCard,
        "spendableAmount": double.parse(emergencyContactSpendableAmount),
        "usdAmount" : double.parse(emergencyContactBelongingMoneyAmount),
        "support" : urgeSupportReason
      }
    ],
    "naturalizationInfo": {
      "naturalizationDate": "${dateOfNaturalized}T00:00:00Z",
      "placeOfNaturalization": placeOfNaturalized,
      "formerNationality": formerNationality
    },
    "spouse": {
      "fullname": spouseFullName,
      "nationality": spouseNationality,
      "postalAddress": spousePostalAddress,
      "passportNumber": spousePassportNumber,
      "dateOfExpiry": "${spouseDateOfPassportExpiry}T00:00:00Z"
    },
    "passport": {
      "number": passportNumber,
      "placeOfIssue": placeOfPassportIssue,
      "dateOfIssue": "${dateOfPassportIssue}T00:00:00Z",
      "dateOfExpiry": "${dateOfPassportExpiry}T00:00:00Z",
      "previousNumber": previousPassportNumber,
      "previousPlaceOfIssue": placeOfPreviousPassportIssue,
      "previousDateOfIssue": "${dateOfPreviousPassportIssue}T00:00:00Z",
      "previousDateOfExpiry" : "${dateOfPreviousPassportExpiry}T00:00:00Z"
    },
    "entryVisas": [
      {
        "objectOfVisit": "Tourism",
        "modeOfTravel": routeAndModeOfTravel,
        "dateOfLeaving": "${dateOfLeaving}T00:00:00Z",
        "lastPlaceOfResidence": lastPlaceOfResidence,
        "dateOfIssue": "${lastObtainedVisaDateOfIssue}T00:00:00Z",
        "residenceVisaNumber": lastObtainedVisaResidenceVisaNumber,
        "hasRefusedVisa": refusedVisaReason,
        "userInfoId": 1,
        "periodOfValidity": int.parse(lastObtainedVisaPeriodOfValidity),
        "PeriodOfVisitVisa": int.parse(periodForVisitVisa),
        "lastObtainedVisa": lastObtainedVisaType
      }
    ],
    "residenceVisaInfo": {
        "id": 0,
        "dateOfArrival": "2020-01-01T00:00:00Z",
        "reasonForApplyingVisa": "Work",
        "applyingFor": "Work Visa",
        "salaryIncome": "50000"
    },
    "userID": userId
  };
}