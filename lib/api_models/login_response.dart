class LoginApiResponse {
  bool? success;
  String? message;
  Data? data;

  LoginApiResponse({this.success, this.message, this.data});

  LoginApiResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {

  List<Hospital>? hospital;

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
  String? otp;
  String? accessToken;

  String? sId;
  String? name;
  String? email;
  String? usertype;
  String? phone;
  String? cpnj;
  String? country;
  String? state;
  String? city;
  String? street;
  String? number;
  String? lang;
  String? createdAt;
  String? updatedAt;


  Data(
      {
        this.hospital,

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
        this.otp,
        this.accessToken,


        this.sId,
        this.name,
        this.email,
        this.usertype,
        this.phone,
        this.cpnj,
        this.country,
        this.state,
        this.city,
        this.street,
        this.number,
        this.lang,
        this.createdAt,
        this.updatedAt,
  });

  Data.fromJson(Map<String, dynamic> json) {

    if (json['hospital'] != null) {
      hospital = <Hospital>[];
      json['hospital'].forEach((v) {
        hospital!.add(new Hospital.fromJson(v));
      });
    }


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
    otp = json['otp'];
    accessToken = json['accessToken'];

    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    usertype = json['usertype'];
    phone = json['phone'];
    cpnj = json['cpnj'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    street = json['street'];
    number = json['number'];
    lang = json['lang'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

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
    data['otp'] = this.otp;
    data['accessToken'] = this.accessToken;

    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['usertype'] = this.usertype;
    data['phone'] = this.phone;
    data['cpnj'] = this.cpnj;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['street'] = this.street;
    data['number'] = this.number;
    data['lang'] = this.lang;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;

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

class Badges {
  String? attributionname;
  List<Badges>? badges;
  List<Hospital>? hospital;
  String? remdomId;
  bool? checked;
  String? licenseExpDate;
  bool? isBlocked;
  String? sId;
  List<String>? availableIn;
  String? hospitalId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Badges(
      {this.attributionname,
        this.badges,
        this.hospital,
        this.remdomId,
        this.checked,
        this.licenseExpDate,
        this.isBlocked,
        this.sId,
        this.availableIn,
        this.hospitalId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Badges.fromJson(Map<String, dynamic> json) {
    attributionname = json['attributionname'];
    if (json['badges'] != null) {
      badges = <Badges>[];
      json['badges'].forEach((v) {
        badges!.add(new Badges.fromJson(v));
      });
    }
    if (json['hospital'] != null) {
      hospital = <Hospital>[];
      json['hospital'].forEach((v) {
        hospital!.add(new Hospital.fromJson(v));
      });
    }
    remdomId = json['remdomId'];
    checked = json['Checked'];
    licenseExpDate = json['licenseExpDate'];
    isBlocked = json['isBlocked'];
    sId = json['_id'];
    availableIn = json['availableIn'].cast<String>();
    hospitalId = json['hospitalId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attributionname'] = this.attributionname;
    if (this.badges != null) {
      data['badges'] = this.badges!.map((v) => v.toJson()).toList();
    }
    if (this.hospital != null) {
      data['hospital'] = this.hospital!.map((v) => v.toJson()).toList();
    }
    data['remdomId'] = this.remdomId;
    data['Checked'] = this.checked;
    data['licenseExpDate'] = this.licenseExpDate;
    data['isBlocked'] = this.isBlocked;
    data['_id'] = this.sId;
    data['availableIn'] = this.availableIn;
    data['hospitalId'] = this.hospitalId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

