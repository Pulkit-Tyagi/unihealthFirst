class WardApiResponse {
  bool? success;
  String? message;
  List<Data>? data;

  WardApiResponse({this.success, this.message, this.data});

  WardApiResponse.fromJson(Map<String, dynamic> json) {
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
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  List<Hospital>? hospital;
  bool? isBlocked;
  bool? isActive;
  String? sId;
  String? wardname;
  String? userId;
  String? hospitalId;
  int? bedsCount;
  List<Beds>? beds;
  int? activeBeds;
  int? todayschedule;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.hospital,
        this.isBlocked,
        this.isActive,
        this.sId,
        this.wardname,
        this.userId,
        this.hospitalId,
        this.bedsCount,
        this.beds,
        this.activeBeds,
        this.todayschedule,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['hospital'] != null) {
      hospital = <Hospital>[];
      json['hospital'].forEach((v) {
        hospital!.add(new Hospital.fromJson(v));
      });
    }
    isBlocked = json['isBlocked'];
    isActive = json['isActive'];
    sId = json['_id'];
    wardname = json['wardname'];
    userId = json['userId'];
    hospitalId = json['hospitalId'];
    bedsCount = json['bedsCount'];
    if (json['beds'] != null) {
      beds = <Beds>[];
      json['beds'].forEach((v) {
        beds!.add(new Beds.fromJson(v));
      });
    }
    activeBeds = json['activeBeds'];
    todayschedule = json['todayschedule'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hospital != null) {
      data['hospital'] = this.hospital!.map((v) => v.toJson()).toList();
    }
    data['isBlocked'] = this.isBlocked;
    data['isActive'] = this.isActive;
    data['_id'] = this.sId;
    data['wardname'] = this.wardname;
    data['userId'] = this.userId;
    data['hospitalId'] = this.hospitalId;
    data['bedsCount'] = this.bedsCount;
    if (this.beds != null) {
      data['beds'] = this.beds!.map((v) => v.toJson()).toList();
    }
    data['activeBeds'] = this.activeBeds;
    data['todayschedule'] = this.todayschedule;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Hospital {
  String? sId;
  String? name;

  Hospital({this.sId, this.name});

  Hospital.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}

class Beds {
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

  Beds(String name,
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

  Beds.fromJson(Map<String, dynamic> json) {
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
  List<Needs>? needs;
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

  PatientId({
      // this.holderSsnEin,
      //   this.zipCode,
        this.hospital,
        // this.clients,
        // this.ntdata,
        this.needs,
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
        hospital!.add(new Hospital.fromJson(v));
      });
    }

    if (json['needs'] != null) {
      needs = <Needs>[];
      json['needs'].forEach((v) {
        needs!.add(new Needs.fromJson(v));
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

    if (this.needs != null) {
      data['needs'] = this.needs!.map((v) => v.toJson()).toList();
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

class Needs {
  String? lastUpdate;
  String? type;
  String? plannedKcal;
  String? plannedPtn;
  String? achievementKcal;
  String? achievementProtein;
  // Null? isSecond;
  CalculatedParameters? calculatedParameters;

  Needs(
      {this.lastUpdate,
        this.type,
        this.plannedKcal,
        this.plannedPtn,
        this.achievementKcal,
        this.achievementProtein,
        // this.isSecond,
        this.calculatedParameters});

  Needs.fromJson(Map<String, dynamic> json) {
    lastUpdate = json['lastUpdate'];
    type = json['type'];
    plannedKcal = json['planned_kcal'];
    plannedPtn = json['planned_ptn'];
    achievementKcal = json['achievement_kcal'];
    achievementProtein = json['achievement_protein'];
    // isSecond = json['isSecond'];
    calculatedParameters = json['calculatedParameters'] != null
        ? new CalculatedParameters.fromJson(json['calculatedParameters'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lastUpdate'] = this.lastUpdate;
    data['type'] = this.type;
    data['planned_kcal'] = this.plannedKcal;
    data['planned_ptn'] = this.plannedPtn;
    data['achievement_kcal'] = this.achievementKcal;
    data['achievement_protein'] = this.achievementProtein;
    // data['isSecond'] = this.isSecond;
    if (this.calculatedParameters != null) {
      data['calculatedParameters'] = this.calculatedParameters!.toJson();
    }
    return data;
  }
}

class CalculatedParameters {
  String? protienPerML;
  String? kclPerML;
  String? curruntWork;

  CalculatedParameters({this.protienPerML, this.kclPerML, this.curruntWork});

  CalculatedParameters.fromJson(Map<String, dynamic> json) {
    protienPerML = json['protien_perML'];
    kclPerML = json['kcl_perML'];
    curruntWork = json['curruntWork'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['protien_perML'] = this.protienPerML;
    data['kcl_perML'] = this.kclPerML;
    data['curruntWork'] = this.curruntWork;
    return data;
  }
}