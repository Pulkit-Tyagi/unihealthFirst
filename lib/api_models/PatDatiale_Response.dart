class patientidapi {
  bool? success;
  String? message;
  // List<Null>? records;
  Data? data;

  patientidapi({this.success, this.message, this.data});

  patientidapi.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  List<Hospital>? hospital;
  // List<Null>? clients;
  bool? forgotPassword;
  bool? isBlocked;
  bool? isClientBlocked;
  bool? isAdminBlocked;
  bool? isUserBlocked;
  bool? isPatientBlocked;
  bool? discharge;
  bool? died;
  bool? isNotificationBlocked;
  String? scheduleDate;
  List<Ntdata>? ntdata;
  String? name;
  String? gender;
  String? city;
  String? state;
  String? street;
  String? dob;
  WardId? wardId;
  BedId? bedId;
  MedicalId? medicalId;
  String? admissionDate;
  String? admissionTime;
  String? usertype;
  String? createdAt;
  String? updatedAt;
  List<EnteralFormula>? enteralFormula;
  // List<Null>? parenteralFormula;
  int? iV;

  Data(
      {this.sId,
        this.hospital,
        // this.clients,
        this.forgotPassword,
        this.isBlocked,
        this.isClientBlocked,
        this.isAdminBlocked,
        this.isUserBlocked,
        this.isPatientBlocked,
        this.discharge,
        this.died,
        this.isNotificationBlocked,
        this.scheduleDate,
        this.ntdata,
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
        this.admissionTime,
        this.usertype,
        this.createdAt,
        this.updatedAt,
        this.enteralFormula,
        // this.parenteralFormula,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    if (json['hospital'] != null) {
      hospital = <Hospital>[];
      json['hospital'].forEach((v) {
        hospital!.add(new Hospital.fromJson(v));
      });
    }
    forgotPassword = json['forgotPassword'];
    isBlocked = json['isBlocked'];
    isClientBlocked = json['isClientBlocked'];
    isAdminBlocked = json['isAdminBlocked'];
    isUserBlocked = json['isUserBlocked'];
    isPatientBlocked = json['isPatientBlocked'];
    discharge = json['discharge'];
    died = json['died'];
    isNotificationBlocked = json['isNotificationBlocked'];
    scheduleDate = json['scheduleDate'];
    if (json['ntdata'] != null) {
      ntdata = <Ntdata>[];
      json['ntdata'].forEach((v) {
        ntdata!.add(new Ntdata.fromJson(v));
      });
    }
    name = json['name'];
    gender = json['gender'];
    city = json['city'];
    state = json['state'];
    street = json['street'];
    dob = json['dob'];
    wardId =
    json['wardId'] != null ? new WardId.fromJson(json['wardId']) : null;
    bedId = json['bedId'] != null ? new BedId.fromJson(json['bedId']) : null;
    medicalId = json['medicalId'] != null
        ? new MedicalId.fromJson(json['medicalId'])
        : null;
    admissionDate = json['admissionDate'];
    admissionTime = json['admissionTime'];
    usertype = json['usertype'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['enteral_formula'] != null) {
      enteralFormula = <EnteralFormula>[];
      json['enteral_formula'].forEach((v) {
        enteralFormula!.add(new EnteralFormula.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.hospital != null) {
      data['hospital'] = this.hospital!.map((v) => v.toJson()).toList();
    }
    data['forgotPassword'] = this.forgotPassword;
    data['isBlocked'] = this.isBlocked;
    data['isClientBlocked'] = this.isClientBlocked;
    data['isAdminBlocked'] = this.isAdminBlocked;
    data['isUserBlocked'] = this.isUserBlocked;
    data['isPatientBlocked'] = this.isPatientBlocked;
    data['discharge'] = this.discharge;
    data['died'] = this.died;
    data['isNotificationBlocked'] = this.isNotificationBlocked;
    data['scheduleDate'] = this.scheduleDate;
    if (this.ntdata != null) {
      data['ntdata'] = this.ntdata!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['city'] = this.city;
    data['state'] = this.state;
    data['street'] = this.street;
    data['dob'] = this.dob;
    if (this.wardId != null) {
      data['wardId'] = this.wardId!.toJson();
    }
    if (this.bedId != null) {
      data['bedId'] = this.bedId!.toJson();
    }
    if (this.medicalId != null) {
      data['medicalId'] = this.medicalId!.toJson();
    }
    data['admissionDate'] = this.admissionDate;
    data['admissionTime'] = this.admissionTime;
    data['usertype'] = this.usertype;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.enteralFormula != null) {
      data['enteral_formula'] =
          this.enteralFormula!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Hospital {
  String? sId;
  String? name;
  String? admissionDate;
  String? diagnosis;


  Hospital(
      {this.sId,
        this.name,
        this.admissionDate,
        this.diagnosis,
        });

  Hospital.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    admissionDate = json['admissionDate'];
    diagnosis = json['diagnosis'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['admissionDate'] = this.admissionDate;
    data['diagnosis'] = this.diagnosis;
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
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
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
  NonNutritional? nonNutritional;
  String? lastUpdate;
  String? updatedBy;
  EnteralData? enteralData;

  Result(
      {this.nonNutritional, this.lastUpdate, this.updatedBy, this.enteralData});

  Result.fromJson(Map<String, dynamic> json);
}

class NonNutritional {
  String? propofol;
  String? glucose;
  String? citrate;
  String? total;
  String? lastUpdate;

  NonNutritional(
      {this.propofol, this.glucose, this.citrate, this.total, this.lastUpdate});

  NonNutritional.fromJson(Map<String, dynamic> json) {
    propofol = json['propofol'];
    glucose = json['glucose'];
    citrate = json['citrate'];
    total = json['total'];
    lastUpdate = json['lastUpdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['propofol'] = this.propofol;
    data['glucose'] = this.glucose;
    data['citrate'] = this.citrate;
    data['total'] = this.total;
    data['lastUpdate'] = this.lastUpdate;
    return data;
  }
}

class EnteralData {
  String? lastUpdate;
  List<LastSelected>? lastSelected;
  int? teamIndex;
  int? tabIndex;
  EnData? enData;
  CaloriesData? caloriesData;
  ReducedJustification? reducedJustification;
  IndustrializedData? industrializedData;
  ManipulatedData? manipulatedData;
  List<IndustDetailsData>? industDetailsData;
  EnteralData(

      {

        this

            .

        lastUpdate,
        this.lastSelected,
        this.teamIndex,
        this.tabIndex,
        this.enData,
        this.caloriesData,
        this.reducedJustification,
        this.industrializedData,
        this.

        manipulatedData

        ,

        this

            .

        industDetailsData

        ,
      }

      );
}

class LastSelected {
  String? index;
  String? date;

  LastSelected({this.index, this.date});

  LastSelected.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['date'] = this.date;
    return data;
  }
}

class EnData {
  String? kcal;
  String? protein;
  String? fiber;
  String? fiberModule;
  String? proteinModule;
  ProteinModuleDetail? proteinModuleDetail;
  ProteinModuleDetail? fiberModuleDetail;

  EnData(
      {this.kcal,
        this.protein,
        this.fiber,
        this.fiberModule,
        this.proteinModule,
        this.proteinModuleDetail,
        this.fiberModuleDetail});

  EnData.fromJson(Map<String, dynamic> json) {
    kcal = json['kcal'];
    protein = json['protein'];
    fiber = json['fiber'];
    fiberModule = json['fiber_module'];
    proteinModule = json['protein_module'];
    proteinModuleDetail = json['proteinModuleDetail'] != null
        ? new ProteinModuleDetail.fromJson(json['proteinModuleDetail'])
        : null;
    fiberModuleDetail = json['fiberModuleDetail'] != null
        ? new ProteinModuleDetail.fromJson(json['fiberModuleDetail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kcal'] = this.kcal;
    data['protein'] = this.protein;
    data['fiber'] = this.fiber;
    data['fiber_module'] = this.fiberModule;
    data['protein_module'] = this.proteinModule;
    if (this.proteinModuleDetail != null) {
      data['proteinModuleDetail'] = this.proteinModuleDetail!.toJson();
    }
    if (this.fiberModuleDetail != null) {
      data['fiberModuleDetail'] = this.fiberModuleDetail!.toJson();
    }
    return data;
  }
}

class ProteinModuleDetail {
  bool? isDeleted;

  ProteinModuleDetail(
      {
        this.isDeleted});

  ProteinModuleDetail.fromJson(Map<String, dynamic> json) {

    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    return data;
  }
}

class CaloriesData {
  String? propofol;
  String? glucose;
  String? citrate;
  String? total;

  CaloriesData({this.propofol, this.glucose, this.citrate, this.total});

  CaloriesData.fromJson(Map<String, dynamic> json) {
    propofol = json['propofol'];
    glucose = json['glucose'];
    citrate = json['citrate'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['propofol'] = this.propofol;
    data['glucose'] = this.glucose;
    data['citrate'] = this.citrate;
    data['total'] = this.total;
    return data;
  }
}

class ReducedJustification {
  String? lastUpdate;
  String? justification;
  String? surgeryPostOp;
  List<SurgeryPostOpList>? surgeryPostOpList;

  ReducedJustification(
      {this.lastUpdate,
        this.justification,
        this.surgeryPostOp,
        this.surgeryPostOpList});

  ReducedJustification.fromJson(Map<String, dynamic> json) {
    lastUpdate = json['lastUpdate'];
    justification = json['justification'];
    surgeryPostOp = json['surgery_postOp'];
    if (json['surgery_postOpList'] != null) {
      surgeryPostOpList = <SurgeryPostOpList>[];
      json['surgery_postOpList'].forEach((v) {
        surgeryPostOpList!.add(new SurgeryPostOpList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lastUpdate'] = this.lastUpdate;
    data['justification'] = this.justification;
    data['surgery_postOp'] = this.surgeryPostOp;
    if (this.surgeryPostOpList != null) {
      data['surgery_postOpList'] =
          this.surgeryPostOpList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SurgeryPostOpList {
  String? lastUpdate;
  String? surgeryPostOp;
  String? type;

  SurgeryPostOpList({this.lastUpdate, this.surgeryPostOp, this.type});

  SurgeryPostOpList.fromJson(Map<String, dynamic> json) {
    lastUpdate = json['lastUpdate'];
    surgeryPostOp = json['surgery_postOp'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lastUpdate'] = this.lastUpdate;
    data['surgery_postOp'] = this.surgeryPostOp;
    data['type'] = this.type;
    return data;
  }
}

class IndustrializedData {
  String? id;
  String? title;
  String? startTime;
  String? startDate;
  String? mlHr;
  String? hrDay;
  String? currentWork;
  String? secondIntervalMlExpected;
  String? firstIntervalMlExpected;
  bool? islastPresent;
  String? lastUpdate;
  EnData? enData;

  IndustrializedData(
      {this.id,
        this.title,
        this.startTime,
        this.startDate,
        this.mlHr,
        this.hrDay,
        this.currentWork,
        this.secondIntervalMlExpected,
        this.firstIntervalMlExpected,
        this.islastPresent,
        this.lastUpdate,
        this.enData});

  IndustrializedData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    startTime = json['start_time'];
    startDate = json['start_date'];
    mlHr = json['ml_hr'];
    hrDay = json['hr_day'];
    currentWork = json['current_work'];
    secondIntervalMlExpected = json['second_interval_mlExpected'];
    firstIntervalMlExpected = json['first_interval_mlExpected'];
    islastPresent = json['islastPresent'];
    lastUpdate = json['lastUpdate'];
    enData =
    json['en_data'] != null ? new EnData.fromJson(json['en_data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['start_time'] = this.startTime;
    data['start_date'] = this.startDate;
    data['ml_hr'] = this.mlHr;
    data['hr_day'] = this.hrDay;
    data['current_work'] = this.currentWork;
    data['second_interval_mlExpected'] = this.secondIntervalMlExpected;
    data['first_interval_mlExpected'] = this.firstIntervalMlExpected;
    data['islastPresent'] = this.islastPresent;
    data['lastUpdate'] = this.lastUpdate;
    if (this.enData != null) {
      data['en_data'] = this.enData!.toJson();
    }
    return data;
  }
}


class ManipulatedData {
  String? id;
  String? title;
  String? mlDose;
  String? currentWork;
  // List<Null>? dosesData;
  String? lastUpdate;
  EnData? enData;

  ManipulatedData(
      {this.id,
        this.title,
        this.mlDose,
        this.currentWork,
        // this.dosesData,
        this.lastUpdate,
        this.enData});

  ManipulatedData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    mlDose = json['ml_dose'];
    currentWork = json['current_work'];
    lastUpdate = json['lastUpdate'];
    enData =
    json['en_data'] != null ? new EnData.fromJson(json['en_data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['ml_dose'] = this.mlDose;
    data['current_work'] = this.currentWork;
    data['lastUpdate'] = this.lastUpdate;
    if (this.enData != null) {
      data['en_data'] = this.enData!.toJson();
    }
    return data;
  }
}

class IndustDetailsData {
  String? id;
  String? title;
  String? startTime;
  String? startDate;
  String? mlHr;
  String? hrDay;
  String? currentWork;
  String? lastUpdate;
  EnData? enData;

  IndustDetailsData(
      {this.id,
        this.title,
        this.startTime,
        this.startDate,
        this.mlHr,
        this.hrDay,
        this.currentWork,
        this.lastUpdate,
        this.enData});

  IndustDetailsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    startTime = json['start_time'];
    startDate = json['start_date'];
    mlHr = json['ml_hr'];
    hrDay = json['hr_day'];
    currentWork = json['current_work'];
    lastUpdate = json['lastUpdate'];
    enData =
    json['en_data'] != null ? new EnData.fromJson(json['en_data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['start_time'] = this.startTime;
    data['start_date'] = this.startDate;
    data['ml_hr'] = this.mlHr;
    data['hr_day'] = this.hrDay;
    data['current_work'] = this.currentWork;
    data['lastUpdate'] = this.lastUpdate;
    if (this.enData != null) {
      data['en_data'] = this.enData!.toJson();
    }
    return data;
  }
}


class WardId {
  List<Hospital>? hospital;
  bool? isBlocked;
  bool? isNotification;
  bool? isActive;
  String? sId;
  String? wardname;
  String? userId;
  String? hospitalId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  WardId(
      {this.hospital,
        this.isBlocked,
        this.isNotification,
        this.isActive,
        this.sId,
        this.wardname,
        this.userId,
        this.hospitalId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  WardId.fromJson(Map<String, dynamic> json) {
    if (json['hospital'] != null) {
      hospital = <Hospital>[];
      json['hospital'].forEach((v) {
        hospital!.add(new Hospital.fromJson(v));
      });
    }
    isBlocked = json['isBlocked'];
    isNotification = json['isNotification'];
    isActive = json['isActive'];
    sId = json['_id'];
    wardname = json['wardname'];
    userId = json['userId'];
    hospitalId = json['hospitalId'];
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
    data['isNotification'] = this.isNotification;
    data['isActive'] = this.isActive;
    data['_id'] = this.sId;
    data['wardname'] = this.wardname;
    data['userId'] = this.userId;
    data['hospitalId'] = this.hospitalId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
class BedId {
  String? patientId;
  bool? isActive;
  bool? active;
  bool? isBlocked;
  String? sId;
  String? bedNumber;
  String? wardId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  BedId(
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

  BedId.fromJson(Map<String, dynamic> json) {
    patientId = json['patientId'];
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
    data['patientId'] = this.patientId;
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

class MedicalId {
  List<Hospital>? hospital;
  bool? isAdmin;
  bool? isBlocked;
  String? sId;
  String? division;
  List<String>? availableIn;
  String? hospitalId;
  String? hospitalname;
  String? createdAt;
  String? updatedAt;
  int? iV;

  MedicalId(
      {this.hospital,
        this.isAdmin,
        this.isBlocked,
        this.sId,
        this.division,
        this.availableIn,
        this.hospitalId,
        this.hospitalname,
        this.createdAt,
        this.updatedAt,
        this.iV});

  MedicalId.fromJson(Map<String, dynamic> json) {
    if (json['hospital'] != null) {
      hospital = <Hospital>[];
      json['hospital'].forEach((v) {
        hospital!.add(new Hospital.fromJson(v));
      });
    }
    isAdmin = json['isAdmin'];
    isBlocked = json['isBlocked'];
    sId = json['_id'];
    division = json['division'];
    availableIn = json['availableIn'].cast<String>();
    hospitalId = json['hospitalId'];
    hospitalname = json['hospitalname'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hospital != null) {
      data['hospital'] = this.hospital!.map((v) => v.toJson()).toList();
    }
    data['isAdmin'] = this.isAdmin;
    data['isBlocked'] = this.isBlocked;
    data['_id'] = this.sId;
    data['division'] = this.division;
    data['availableIn'] = this.availableIn;
    data['hospitalId'] = this.hospitalId;
    data['hospitalname'] = this.hospitalname;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class EnteralFormula {
  String? formulastatus;
  String? currentdate;
  String? hospitaldate;
  bool? isBlocked;
  String? sId;
  String? userId;
  List<Formula>? formula;
  String? createdAt;
  String? updatedAt;
  int? iV;

  EnteralFormula(
      {this.formulastatus,
        this.currentdate,
        this.hospitaldate,
        this.isBlocked,
        this.sId,
        this.userId,
        this.formula,
        this.createdAt,
        this.updatedAt,
        this.iV});

  EnteralFormula.fromJson(Map<String, dynamic> json) {
    formulastatus = json['formulastatus'];
    currentdate = json['currentdate'];
    hospitaldate = json['hospitaldate'];
    isBlocked = json['isBlocked'];
    sId = json['_id'];
    userId = json['userId'];
    if (json['formula'] != null) {
      formula = <Formula>[];
      json['formula'].forEach((v) {
        formula!.add(new Formula.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['formulastatus'] = this.formulastatus;
    data['currentdate'] = this.currentdate;
    data['hospitaldate'] = this.hospitaldate;
    data['isBlocked'] = this.isBlocked;
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    if (this.formula != null) {
      data['formula'] = this.formula!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Formula {
  String? date;
  String? time;
  String? startInterval;
  String? endInterval;
  String? lastUpdate;
  String? formulaName;
  String? expectedVol;
  String? infusedVol;
  String? type;

  Formula(
      {this.date,
        this.time,
        this.startInterval,
        this.endInterval,
        this.lastUpdate,
        this.formulaName,
        this.expectedVol,
        this.infusedVol,
        this.type});

  Formula.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    time = json['time'];
    startInterval = json['start_interval'];
    endInterval = json['end_interval'];
    lastUpdate = json['lastUpdate'];
    formulaName = json['formula_name'];
    expectedVol = json['expected_vol'];
    infusedVol = json['infused_vol'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['time'] = this.time;
    data['start_interval'] = this.startInterval;
    data['end_interval'] = this.endInterval;
    data['lastUpdate'] = this.lastUpdate;
    data['formula_name'] = this.formulaName;
    data['expected_vol'] = this.expectedVol;
    data['infused_vol'] = this.infusedVol;
    data['type'] = this.type;
    return data;
  }
}