class BedApiResponse {
  bool? success;
  int? status;
  String? message;
  List<Data>? data;

  BedApiResponse({this.success, this.status, this.message, this.data});

  BedApiResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  PatientId? patientId;
  bool? isActive;
  bool? active;
  bool? isBlocked;
  String? sId;
  String? bedNumber;
  String? wardId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.patientId,
        this.isActive,
        this.active,
        this.isBlocked,
        this.sId,
        this.bedNumber,
        this.wardId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    patientId = json['patientId'] != null
        ? new PatientId.fromJson(json['patientId'])
        : null;
    isActive = json['isActive'];
    active = json['Active'];
    isBlocked = json['isBlocked'];
    sId = json['_id'];
    bedNumber = json['bedNumber'];
    wardId = json['wardId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.patientId != null) {
      data['patientId'] = this.patientId!.toJson();
    }
    data['isActive'] = this.isActive;
    data['Active'] = this.active;
    data['isBlocked'] = this.isBlocked;
    data['_id'] = this.sId;
    data['bedNumber'] = this.bedNumber;
    data['wardId'] = this.wardId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class PatientId {
  // Null? holderSsnEin;
  // Null? zipCode;
  List<Hospital>? hospital;
  // List<Null>? clients;
  // List<Null>? ntdata;
  // List<Needs>? needs;
  String? admissionTime;
  bool? isSubscribe;
  bool? isSubscribedToFirstPlan;
  bool? isFirstHospitalAdded;
  bool? isRegFromApp;
  bool? isVerifed;
  bool? islogin;
  bool? isdocVerifed;
  int? isdocStatus;
  int? docVerification;
  bool? forgotPassword;
  bool? isBlocked;
  bool? isClientBlocked;
  bool? isAdminBlocked;
  bool? isUserBlocked;
  bool? isPatientBlocked;
  bool? discharge;
  bool? died;
  bool? isNotificationBlocked;
  bool? isProfileUpdated;
  bool? isPasswordSet;
  bool? isOtpVerified;
  String? scheduleDate;
  // Null? otp;
  // Null? accessToken;
  // List<Null>? payments;
  // List<Null>? badges;
  // List<Null>? schedules;
  // List<Null>? diagnosis;
  // List<Null>? palcare;
  // List<Null>? status;
  // List<Null>? anthropometry;
  // List<Null>? vigilance;
  String? sId;
  String? name;
  String? gender;
  String? city;
  String? state;
  String? street;
  String? dob;
  String? wardId;
  String? bedId;
  String? medicalId;
  String? admissionDate;
  String? usertype;
  String? lang;
  String? createdAt;
  String? updatedAt;

  PatientId(
       {
  // this.holderSsnEin,
      //   this.zipCode,
        this.hospital,
        // this.clients,
        // this.ntdata,
        // this.needs,
        this.admissionTime,
        this.isSubscribe,
        this.isSubscribedToFirstPlan,
        this.isFirstHospitalAdded,
        this.isRegFromApp,
        this.isVerifed,
        this.islogin,
        this.isdocVerifed,
        this.isdocStatus,
        this.docVerification,
        this.forgotPassword,
        this.isBlocked,
        this.isClientBlocked,
        this.isAdminBlocked,
        this.isUserBlocked,
        this.isPatientBlocked,
        this.discharge,
        this.died,
        this.isNotificationBlocked,
        this.isProfileUpdated,
        this.isPasswordSet,
        this.isOtpVerified,
        this.scheduleDate,
        // this.otp,
        // this.accessToken,
        // this.payments,
        // this.badges,
        // this.schedules,
        // this.diagnosis,
        // this.palcare,
        // this.status,
        // this.anthropometry,
        // this.vigilance,
        this.sId,
        this.name,
        this.gender,
        this.city,
        this.state,
        this.street,
        this.dob,
        this.wardId,
        this.bedId,
        this.medicalId,
        this.admissionDate,
        this.usertype,
        this.lang,
        this.createdAt,
        this.updatedAt});

  PatientId.fromJson(Map<String, dynamic> json) {
    // holderSsnEin = json['holderSsnEin'];
    // zipCode = json['zipCode'];
    if (json['hospital'] != null) {
      hospital = <Hospital>[];
      json['hospital'].forEach((v) {
        // hospital!.add(new Hospital.fromJson(v));
      });
    }

    admissionTime = json['admissionTime'];
    isSubscribe = json['isSubscribe'];
    isSubscribedToFirstPlan = json['isSubscribedToFirstPlan'];
    isFirstHospitalAdded = json['isFirstHospitalAdded'];
    isRegFromApp = json['isRegFromApp'];
    isVerifed = json['isVerifed'];
    islogin = json['islogin'];
    isdocVerifed = json['isdocVerifed'];
    isdocStatus = json['isdocStatus'];
    docVerification = json['docVerification'];
    forgotPassword = json['forgotPassword'];
    isBlocked = json['isBlocked'];
    isClientBlocked = json['isClientBlocked'];
    isAdminBlocked = json['isAdminBlocked'];
    isUserBlocked = json['isUserBlocked'];
    isPatientBlocked = json['isPatientBlocked'];
    discharge = json['discharge'];
    died = json['died'];
    isNotificationBlocked = json['isNotificationBlocked'];
    isProfileUpdated = json['isProfileUpdated'];
    isPasswordSet = json['isPasswordSet'];
    isOtpVerified = json['isOtpVerified'];
    scheduleDate = json['scheduleDate'];
    // otp = json['otp'];
    // accessToken = json['accessToken'];
    sId = json['_id'];
    name = json['name'];
    gender = json['gender'];
    city = json['city'];
    state = json['state'];
    street = json['street'];
    dob = json['dob'];
    wardId = json['wardId'];
    bedId = json['bedId'];
    medicalId = json['medicalId'];
    admissionDate = json['admissionDate'];
    usertype = json['usertype'];
    lang = json['lang'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['holderSsnEin'] = this.holderSsnEin;
    // data['zipCode'] = this.zipCode;
    if (this.hospital != null) {
      // data['hospital'] = this.hospital!.map((v) => v.toJson()).toList();
    }

    data['admissionTime'] = this.admissionTime;
    data['isSubscribe'] = this.isSubscribe;
    data['isSubscribedToFirstPlan'] = this.isSubscribedToFirstPlan;
    data['isFirstHospitalAdded'] = this.isFirstHospitalAdded;
    data['isRegFromApp'] = this.isRegFromApp;
    data['isVerifed'] = this.isVerifed;
    data['islogin'] = this.islogin;
    data['isdocVerifed'] = this.isdocVerifed;
    data['isdocStatus'] = this.isdocStatus;
    data['docVerification'] = this.docVerification;
    data['forgotPassword'] = this.forgotPassword;
    data['isBlocked'] = this.isBlocked;
    data['isClientBlocked'] = this.isClientBlocked;
    data['isAdminBlocked'] = this.isAdminBlocked;
    data['isUserBlocked'] = this.isUserBlocked;
    data['isPatientBlocked'] = this.isPatientBlocked;
    data['discharge'] = this.discharge;
    data['died'] = this.died;
    data['isNotificationBlocked'] = this.isNotificationBlocked;
    data['isProfileUpdated'] = this.isProfileUpdated;
    data['isPasswordSet'] = this.isPasswordSet;
    data['isOtpVerified'] = this.isOtpVerified;
    data['scheduleDate'] = this.scheduleDate;
    // data['otp'] = this.otp;
    // data['accessToken'] = this.accessToken;

    data['_id'] = this.sId;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['city'] = this.city;
    data['state'] = this.state;
    data['street'] = this.street;
    data['dob'] = this.dob;
    data['wardId'] = this.wardId;
    data['bedId'] = this.bedId;
    data['medicalId'] = this.medicalId;
    data['admissionDate'] = this.admissionDate;
    data['usertype'] = this.usertype;
    data['lang'] = this.lang;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Hospital {
  String? sId;
  String? name;
  String? admissionDate;
  String? diagnosis;
  // Null? diagnosisLastUpdate;
  // Null? verificationStatus;
  // Null? observation;
  // Null? observationLastUpdate;
  // Null? observationLastUpdateBy;

  Hospital(
      {this.sId,
        this.name,
        this.admissionDate,
        this.diagnosis,
        // this.diagnosisLastUpdate,
        // this.verificationStatus,
        // this.observation,
        // this.observationLastUpdate,
        // this.observationLastUpdateBy});




});}