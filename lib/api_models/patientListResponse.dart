class PatientResponse {
  bool? success;
  String? message;
  List<Data>? data;

  PatientResponse({this.success, this.message, this.data});

  PatientResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
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
    data['message'] = this.message;

    return data;
  }
}

class Data {
  // Null? holderSsnEin;
  // Null? zipCode;
  List<Hospital>? hospital;
  //List<Null>? clients;
  List<Ntdata>? ntdata;
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

  String? sId;
  String? name;
  String? gender;
  String? city;
  String? state;
  String? street;
  String? dob;
  String? insurance;
  String? admissionDate;
  String? usertype;
  String? lang;
  String? createdAt;
  String? updatedAt;
  String? email;
  String? hospitalId;
  String? phone;
  String? rId;

  Data(
      {
        this.hospital,
        // this.clients,
        this.ntdata,
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
        this.sId,
        this.name,
        this.gender,
        this.city,
        this.state,
        this.street,
        this.dob,
         this.insurance,
        this.admissionDate,
        this.usertype,
        this.lang,
        this.createdAt,
        this.updatedAt,
        this.email,
        this.hospitalId,
        this.phone,
        this.rId});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['hospital'] != null) {
      hospital = <Hospital>[];
      json['hospital'].forEach((v) {
        hospital!.add(new Hospital.fromJson(v));
      });
    }

    if (json['ntdata'] != null) {
      ntdata = <Ntdata>[];
      json['ntdata'].forEach((v) {
        ntdata!.add(new Ntdata.fromJson(v));
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



    sId = json['_id'];
    name = json['name'];
    gender = json['gender'];
    city = json['city'];
    state = json['state'];
    street = json['street'];
    dob = json['dob'];

    insurance = json['insurance'];
    admissionDate = json['admissionDate'];
    usertype = json['usertype'];
    lang = json['lang'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    email = json['email'];
    hospitalId = json['hospitalId'];
    phone = json['phone'];
    rId = json['rId'];
  }}

class Hospital {
  String? sId;
  String? name;
  String? admissionDate;
  String? diagnosis;
  // Null? diagnosisLastUpdate;
  int? verificationStatus;
  String? observation;
  String? observationLastUpdate;
  String? observationLastUpdateBy;
  String? stay;
  bool? isBlocked;
  String? disChargeDate;

  Hospital(
      {this.sId,
        this.name,
        this.admissionDate,
        this.diagnosis,
        // this.diagnosisLastUpdate,
        this.verificationStatus,
        this.observation,
        this.observationLastUpdate,
        this.observationLastUpdateBy,
        this.stay,
        this.isBlocked,
        this.disChargeDate});

  Hospital.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    admissionDate = json['admissionDate'];
    diagnosis = json['diagnosis'];
    // diagnosisLastUpdate = json['diagnosisLastUpdate'];
    verificationStatus = json['verificationStatus'];
    observation = json['observation'];
    observationLastUpdate = json['observationLastUpdate'];
    observationLastUpdateBy = json['observationLastUpdateBy'];
    stay = json['stay'];
    isBlocked = json['isBlocked'];
    disChargeDate = json['disChargeDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['admissionDate'] = this.admissionDate;
    data['diagnosis'] = this.diagnosis;
    // data['diagnosisLastUpdate'] = this.diagnosisLastUpdate;
    data['verificationStatus'] = this.verificationStatus;
    data['observation'] = this.observation;
    data['observationLastUpdate'] = this.observationLastUpdate;
    data['observationLastUpdateBy'] = this.observationLastUpdateBy;
    data['stay'] = this.stay;
    data['isBlocked'] = this.isBlocked;
    data['disChargeDate'] = this.disChargeDate;
    return data;
  }
}

class Ntdata {
  List<Result>? result;
  String? score;
  String? type;
  String? status;
  bool? isBlocked;
  String? sId;
  String? userId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Ntdata(
      {this.result,
        this.score,
        this.type,
        this.status,
        this.isBlocked,
        this.sId,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Ntdata.fromJson(Map<String, dynamic> json) {

    score = json['score'];
    type = json['type'];
    status = json['status'];
    isBlocked = json['isBlocked'];
    sId = json['_id'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['score'] = this.score;
    data['type'] = this.type;
    data['status'] = this.status;
    data['isBlocked'] = this.isBlocked;
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Result {
  String? lastUpdate;
  String? updatedBy;
  String? condition;
  String? info;
   bool? isDeleted;
   bool? teamAgree;
  bool? fasting;
  String? fastingReason;
  String? description;
  String? kcal;
  String? ptn;
  String? totalKcal;
  String? totalPtn;
  String? totalFiber;
  String? fiber;
  String? volume;
  String? times;

  Result(
      {this.lastUpdate,
        this.updatedBy,
        this.condition,
        this.info,
        this.isDeleted,
        this.teamAgree,
        this.fasting,
        this.fastingReason,
        this.description,
        this.kcal,
        this.ptn,
        this.totalKcal,
        this.totalPtn,
        this.totalFiber,
        this.fiber,
        this.volume,
        this.times,
    }
  );
}
