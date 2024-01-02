class listResponse {
  bool? success;
  String? message;
  List<Data>? data;

  listResponse({this.success, this.message, this.data});

  listResponse.fromJson(Map<String, dynamic> json) {
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
  List<Users>? users;
  List<Admin>? admin;
  // List<Null>? reportList;
  List<String>? licenses;
  String? zipCode;
  String? workdays;
  int? availableLicense;
  bool? isBlocked;
  String? sId;
  String? name;
  String? hospitalgroup;
  String? country;
  String? state;
  String? city;
  String? street;
  String? number;
  int? remdomId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  Subscription? subscription;

  Data(
      {this.users,
        this.admin,
        // this.reportList,
        this.licenses,
        this.zipCode,
        this.workdays,
        this.availableLicense,
        this.isBlocked,
        this.sId,
        this.name,
        this.hospitalgroup,
        this.country,
        this.state,
        this.city,
        this.street,
        this.number,
        this.remdomId,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.subscription});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(new Users.fromJson(v));
      });
    }
    if (json['admin'] != null) {
      admin = <Admin>[];
      json['admin'].forEach((v) {
        admin!.add(new Admin.fromJson(v));
      });
    }

    licenses = json['licenses'].cast<String>();
    zipCode = json['zipCode'];
    workdays = json['workdays'];
    availableLicense = json['availableLicense'];
    isBlocked = json['isBlocked'];
    sId = json['_id'];
    name = json['name'];
    hospitalgroup = json['hospitalgroup'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    street = json['street'];
    number = json['number'];
    remdomId = json['remdomId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    subscription = json['subscription'] != null
        ? new Subscription.fromJson(json['subscription'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v.toJson()).toList();
    }
    if (this.admin != null) {
      data['admin'] = this.admin!.map((v) => v.toJson()).toList();
    }

    data['licenses'] = this.licenses;
    data['zipCode'] = this.zipCode;
    data['workdays'] = this.workdays;
    data['availableLicense'] = this.availableLicense;
    data['isBlocked'] = this.isBlocked;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['hospitalgroup'] = this.hospitalgroup;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['street'] = this.street;
    data['number'] = this.number;
    data['remdomId'] = this.remdomId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.subscription != null) {
      data['subscription'] = this.subscription!.toJson();
    }
    return data;
  }
}

class Users {
  String? holderSsnEin;
  String? zipCode;
  List<Hospital>? hospital;
  // List<Null>? clients;
  // List<Null>? ntdata;
  // List<Null>? needs;
  // Null? admissionTime;
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
  // List<Null>? payments;
  // List<Null>? badges;
  // List<Null>? schedules;
  // List<Null>? diagnosis;
  // List<Null>? palcare;
  // List<Null>? status;
  // List<Null>? anthropometry;
  // List<Null>? vigilance;
  String? sId;
  String? email;
  String? usertype;
  String? lang;
  String? createdAt;
  String? updatedAt;
  String? stripeCustomerId;
  String? subscriptionId;
  // Null? deviceId;
  // Null? deviceToken;
  String? city;
  String? country;
  String? name;
  String? number;
  String? phone;
  String? state;
  String? street;
  String? cpnj;
  String? licenseExpDate;

  Users(
      {this.holderSsnEin,
        this.zipCode,
        this.hospital,
        // this.clients,
        // this.ntdata,
        // this.needs,
        // this.admissionTime,
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
        // this.payments,
        // this.badges,
        // this.schedules,
        // this.diagnosis,
        // this.palcare,
        // this.status,
        // this.anthropometry,
        // this.vigilance,
        this.sId,
        this.email,
        this.usertype,
        this.lang,
        this.createdAt,
        this.updatedAt,
        this.stripeCustomerId,
        this.subscriptionId,
        // this.deviceId,
        // this.deviceToken,
        this.city,
        this.country,
        this.name,
        this.number,
        this.phone,
        this.state,
        this.street,
        this.cpnj,
        this.licenseExpDate});

  Users.fromJson(Map<String, dynamic> json) {
    holderSsnEin = json['holderSsnEin'];
    zipCode = json['zipCode'];
    if (json['hospital'] != null) {
      hospital = <Hospital>[];
      json['hospital'].forEach((v) {
        hospital!.add(new Hospital.fromJson(v));
      });
    }
    // if (json['clients'] != null) {
    //   clients = <Null>[];
    //   json['clients'].forEach((v) {
    //     clients!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['ntdata'] != null) {
    //   ntdata = <Null>[];
    //   json['ntdata'].forEach((v) {
    //     ntdata!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['needs'] != null) {
    //   needs = <Null>[];
    //   json['needs'].forEach((v) {
    //     needs!.add(new Null.fromJson(v));
    //   });
    // }
    // admissionTime = json['admissionTime'];
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
    email = json['email'];
    usertype = json['usertype'];
    lang = json['lang'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    stripeCustomerId = json['stripeCustomerId'];
    subscriptionId = json['subscriptionId'];
    // deviceId = json['deviceId'];
    // deviceToken = json['deviceToken'];
    city = json['city'];
    country = json['country'];
    name = json['name'];
    number = json['number'];
    phone = json['phone'];
    state = json['state'];
    street = json['street'];
    cpnj = json['cpnj'];
    licenseExpDate = json['licenseExpDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['holderSsnEin'] = this.holderSsnEin;
    data['zipCode'] = this.zipCode;
    if (this.hospital != null) {
      data['hospital'] = this.hospital!.map((v) => v.toJson()).toList();
    }

    // data['admissionTime'] = this.admissionTime;
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
    data['email'] = this.email;
    data['usertype'] = this.usertype;
    data['lang'] = this.lang;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['stripeCustomerId'] = this.stripeCustomerId;
    data['subscriptionId'] = this.subscriptionId;
    // data['deviceId'] = this.deviceId;
    // data['deviceToken'] = this.deviceToken;
    data['city'] = this.city;
    data['country'] = this.country;
    data['name'] = this.name;
    data['number'] = this.number;
    data['phone'] = this.phone;
    data['state'] = this.state;
    data['street'] = this.street;
    data['cpnj'] = this.cpnj;
    data['licenseExpDate'] = this.licenseExpDate;
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

class Admin {
  // Null? holderSsnEin;
  // Null? zipCode;
  List<Hospital>? hospital;
  // List<Clients>? clients;
  // List<Null>? ntdata;
  // List<Null>? needs;
  // Null? admissionTime;
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
  String? licenseExpDate;
  String? country;
  String? state;
  String? city;
  String? street;
  String? number;
  String? lang;
  String? createdAt;
  String? updatedAt;
  String? deviceId;
  String? deviceToken;

  Admin(
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
        this.licenseExpDate,
        this.country,
        this.state,
        this.city,
        this.street,
        this.number,
        this.lang,
        this.createdAt,
        this.updatedAt,
        this.deviceId,
        this.deviceToken});

  Admin.fromJson(Map<String, dynamic> json) {
    // holderSsnEin = json['holderSsnEin'];
    // zipCode = json['zipCode'];
    if (json['hospital'] != null) {
      hospital = <Hospital>[];
      json['hospital'].forEach((v) {
        hospital!.add(new Hospital.fromJson(v));
      });
    }
    if (json['clients'] != null) {
      // clients = <Clients>[];
      json['clients'].forEach((v) {
        // clients!.add(new Clients.fromJson(v));
      });
    }
    if (json['ntdata'] != null) {
      // ntdata = <Null>[];
      json['ntdata'].forEach((v) {
        // ntdata!.add(new Null.fromJson(v));
      });
    }
    if (json['needs'] != null) {
      // needs = <Null>[];
      json['needs'].forEach((v) {
        // needs!.add(new Null.fromJson(v));
      });
    }
    // admissionTime = json['admissionTime'];
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
    licenseExpDate = json['licenseExpDate'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    street = json['street'];
    number = json['number'];
    lang = json['lang'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deviceId = json['deviceId'];
    deviceToken = json['deviceToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['holderSsnEin'] = this.holderSsnEin;
    // data['zipCode'] = this.zipCode;

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
    data['licenseExpDate'] = this.licenseExpDate;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['street'] = this.street;
    data['number'] = this.number;
    data['lang'] = this.lang;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deviceId'] = this.deviceId;
    data['deviceToken'] = this.deviceToken;
    return data;
  }
}

class Subscription {
  String? stripeCheckoutSessionId;
  String? checkoutInvoiceId;
  String? stripePlanId;
  String? stripeCustomerId;
  String? subscriptionId;
  int? amount;
  String? paymentMethod;
  String? subscriptionStartDate;
  String? subscriptionEndDate;
  String? paymentStatus;
  String? planInterval;
  String? currency;
  bool? isCancelled;
  // Null? cancelledTime;
  String? status;
  String? redirectTo;
  String? sId;
  String? hospitalId;
  String? userId;
  PlanId? planId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Subscription(
      {this.stripeCheckoutSessionId,
        this.checkoutInvoiceId,
        this.stripePlanId,
        this.stripeCustomerId,
        this.subscriptionId,
        this.amount,
        this.paymentMethod,
        this.subscriptionStartDate,
        this.subscriptionEndDate,
        this.paymentStatus,
        this.planInterval,
        this.currency,
        this.isCancelled,
        // this.cancelledTime,
        this.status,
        this.redirectTo,
        this.sId,
        this.hospitalId,
        this.userId,
        this.planId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Subscription.fromJson(Map<String, dynamic> json) {
    stripeCheckoutSessionId = json['stripeCheckoutSessionId'];
    checkoutInvoiceId = json['checkoutInvoiceId'];
    stripePlanId = json['stripePlanId'];
    stripeCustomerId = json['stripeCustomerId'];
    subscriptionId = json['subscriptionId'];
    amount = json['amount'];
    paymentMethod = json['paymentMethod'];
    subscriptionStartDate = json['subscriptionStartDate'];
    subscriptionEndDate = json['subscriptionEndDate'];
    paymentStatus = json['paymentStatus'];
    planInterval = json['planInterval'];
    currency = json['currency'];
    isCancelled = json['isCancelled'];
    // cancelledTime = json['cancelledTime'];
    status = json['status'];
    redirectTo = json['redirectTo'];
    sId = json['_id'];
    hospitalId = json['hospitalId'];
    userId = json['userId'];
    planId =
    json['planId'] != null ? new PlanId.fromJson(json['planId']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stripeCheckoutSessionId'] = this.stripeCheckoutSessionId;
    data['checkoutInvoiceId'] = this.checkoutInvoiceId;
    data['stripePlanId'] = this.stripePlanId;
    data['stripeCustomerId'] = this.stripeCustomerId;
    data['subscriptionId'] = this.subscriptionId;
    data['amount'] = this.amount;
    data['paymentMethod'] = this.paymentMethod;
    data['subscriptionStartDate'] = this.subscriptionStartDate;
    data['subscriptionEndDate'] = this.subscriptionEndDate;
    data['paymentStatus'] = this.paymentStatus;
    data['planInterval'] = this.planInterval;
    data['currency'] = this.currency;
    data['isCancelled'] = this.isCancelled;
    // data['cancelledTime'] = this.cancelledTime;
    data['status'] = this.status;
    data['redirectTo'] = this.redirectTo;
    data['_id'] = this.sId;
    data['hospitalId'] = this.hospitalId;
    data['userId'] = this.userId;
    if (this.planId != null) {
      data['planId'] = this.planId!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class PlanId {
  String? stripePlanId;
  String? name;
  String? interval;
  int? amount;
  int? numberOfLicense;
  String? currency;
  int? trialPeriodDays;
  bool? isDeleted;
  // Null? deletedAt;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  PlanId(
      {this.stripePlanId,
        this.name,
        this.interval,
        this.amount,
        this.numberOfLicense,
        this.currency,
        this.trialPeriodDays,
        this.isDeleted,
        // this.deletedAt,
        this.sId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  PlanId.fromJson(Map<String, dynamic> json) {
    stripePlanId = json['stripePlanId'];
    name = json['name'];
    interval = json['interval'];
    amount = json['amount'];
    numberOfLicense = json['numberOfLicense'];
    currency = json['currency'];
    trialPeriodDays = json['trialPeriodDays'];
    isDeleted = json['isDeleted'];
    // deletedAt = json['deletedAt'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stripePlanId'] = this.stripePlanId;
    data['name'] = this.name;
    data['interval'] = this.interval;
    data['amount'] = this.amount;
    data['numberOfLicense'] = this.numberOfLicense;
    data['currency'] = this.currency;
    data['trialPeriodDays'] = this.trialPeriodDays;
    data['isDeleted'] = this.isDeleted;
    // data['deletedAt'] = this.deletedAt;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}