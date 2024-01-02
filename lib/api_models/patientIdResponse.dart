class PatientApiResponse {
  bool? success;
  String? message;
  // List<Null>? records;
  Data? data;

  PatientApiResponse({this.success, this.message, this.data});

  PatientApiResponse.fromJson(Map<String, dynamic> json) {
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
  // List<Null>? schedules;
  // List<Null>? diagnosis;
  // List<Null>? palcare;
  List<Status>? status;
  List<Needs>? needs;
  List<Anthropometry>? anthropometry;
  // List<Ntdata>? ntdata;
  // List<Null>? vigilance;
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
  // List<Null>? enteralFormula;
  List<ParenteralFormula>? parenteralFormula;
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
        // this.schedules,
        // this.diagnosis,
        // this.palcare,
        this.status,
        this.needs,
        this.anthropometry,
        // this.ntdata,
        // this.vigilance,
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
        // this.enteralFormula,
        this.parenteralFormula,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];

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

    if (json['status'] != null) {
      status = <Status>[];
      json['status'].forEach((v) {
        status!.add(new Status.fromJson(v));
      });
    }
    if (json['needs'] != null) {
      needs = <Needs>[];
      json['needs'].forEach((v) {
        needs!.add(new Needs.fromJson(v));
      });
    }
    if (json['anthropometry'] != null) {
      anthropometry = <Anthropometry>[];
      json['anthropometry'].forEach((v) {
        anthropometry!.add(new Anthropometry.fromJson(v));
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
    if (json['parenteral_formula'] != null) {
      parenteralFormula = <ParenteralFormula>[];
      json['parenteral_formula'].forEach((v) {
        parenteralFormula!.add(new ParenteralFormula.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
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
    if (this.status != null) {
      data['status'] = this.status!.map((v) => v.toJson()).toList();
    }
    if (this.needs != null) {
      data['needs'] = this.needs!.map((v) => v.toJson()).toList();
    }
    if (this.anthropometry != null) {
      data['anthropometry'] =
          this.anthropometry!.map((v) => v.toJson()).toList();
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
    if (this.parenteralFormula != null) {
      data['parenteral_formula'] =
          this.parenteralFormula!.map((v) => v.toJson()).toList();
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
});}

class Status {
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

  Status(
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

  Status.fromJson(Map<String, dynamic> json) {
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
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
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
  String? status;
  String? score;
  bool? uNINTENTIONALWEIGHT;
  String? espenOutput;
  String? lastUpdate;
  String? updatedBy;

  Result(
      {this.status,
        this.score,
        this.uNINTENTIONALWEIGHT,
        this.espenOutput,
        this.lastUpdate,
        this.updatedBy});

  Result.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    score = json['score'];
    uNINTENTIONALWEIGHT = json['UNINTENTIONALWEIGHT'];
    espenOutput = json['espen_output'];
    lastUpdate = json['lastUpdate'];
    updatedBy = json['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['score'] = this.score;
    data['UNINTENTIONALWEIGHT'] = this.uNINTENTIONALWEIGHT;
    data['espen_output'] = this.espenOutput;
    data['lastUpdate'] = this.lastUpdate;
    data['updated_by'] = this.updatedBy;
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
  bool? isSecond;
  CalculatedParameters? calculatedParameters;

  Needs(
      {this.lastUpdate,
        this.type,
        this.plannedKcal,
        this.plannedPtn,
        this.achievementKcal,
        this.achievementProtein,
        this.isSecond,
        this.calculatedParameters});

  Needs.fromJson(Map<String, dynamic> json) {
    lastUpdate = json['lastUpdate'];
    type = json['type'];
    plannedKcal = json['planned_kcal'];
    plannedPtn = json['planned_ptn'];
    achievementKcal = json['achievement_kcal'];
    achievementProtein = json['achievement_protein'];
    isSecond = json['isSecond'];
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
    data['isSecond'] = this.isSecond;
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

class Anthropometry {
  String? weightType;
  String? weightMeasuredReported;
  String? weightMeasuredReportedLBS;
  String? ac;
  String? acInch;
  String? mUAC;
  String? mUACInch;
  String? cALF;
  String? cALFInch;
  String? tST;
  String? tSTInch;
  String? mamc;
  String? mamcper;
  String? estimatedWeight;
  String? estimatedWeightLBS;
  String? edema;
  String? edemaLBS;
  // List<Null>? edemaData;
  String? ascities;
  String? ascitiesLBS;
  // List<Null>? ascitiesData;
  String? amputation;
  String? amputationLBS;
  bool? wantDiscountOnWeightFromAmputation;
  String? amputationPer;
  // List<Null>? amputationData;
  String? discountedWeight;
  String? discountedWeightLBS;
  String? heightType;
  String? heightMeasuredReported;
  String? heightMeasuredReportedInch;
  double? heightMeasuredReportedMeter;
  String? kneeHeight;
  String? kneeHeightInch;
  String? armSpan;
  String? armSpanInch;
  String? estimatedHeight;
  String? estimatedHeightInches;
  String? bmi;
  String? idealBodyWeight;
  String? idealBodyWeightLBS;
  String? adjustedBodyWeight;
  String? adjustedBodyWeightLBS;
  String? lastUpdate;
  String? updatedBy;

  Anthropometry(
      {this.weightType,
        this.weightMeasuredReported,
        this.weightMeasuredReportedLBS,
        this.ac,
        this.acInch,
        this.mUAC,
        this.mUACInch,
        this.cALF,
        this.cALFInch,
        this.tST,
        this.tSTInch,
        this.mamc,
        this.mamcper,
        this.estimatedWeight,
        this.estimatedWeightLBS,
        this.edema,
        this.edemaLBS,
        // this.edemaData,
        this.ascities,
        this.ascitiesLBS,
        // this.ascitiesData,
        this.amputation,
        this.amputationLBS,
        this.wantDiscountOnWeightFromAmputation,
        this.amputationPer,
        // this.amputationData,
        this.discountedWeight,
        this.discountedWeightLBS,
        this.heightType,
        this.heightMeasuredReported,
        this.heightMeasuredReportedInch,
        this.heightMeasuredReportedMeter,
        this.kneeHeight,
        this.kneeHeightInch,
        this.armSpan,
        this.armSpanInch,
        this.estimatedHeight,
        this.estimatedHeightInches,
        this.bmi,
        this.idealBodyWeight,
        this.idealBodyWeightLBS,
        this.adjustedBodyWeight,
        this.adjustedBodyWeightLBS,
        this.lastUpdate,
        this.updatedBy});

  Anthropometry.fromJson(Map<String, dynamic> json) {
    weightType = json['weightType'];
    weightMeasuredReported = json['weightMeasuredReported'];
    weightMeasuredReportedLBS = json['weightMeasuredReportedLBS'];
    ac = json['ac'];
    acInch = json['ac_inch'];
    mUAC = json['MUAC'];
    mUACInch = json['MUAC_inch'];
    cALF = json['CALF'];
    cALFInch = json['CALF_inch'];
    tST = json['TST'];
    tSTInch = json['TST_inch'];
    mamc = json['mamc'];
    mamcper = json['mamcper'];
    estimatedWeight = json['estimatedWeight'];
    estimatedWeightLBS = json['estimatedWeightLBS'];
    edema = json['edema'];
    edemaLBS = json['edema_LBS'];

    ascities = json['ascities'];
    ascitiesLBS = json['ascities_LBS'];
    amputation = json['amputation'];
    amputationLBS = json['amputation_LBS'];
    wantDiscountOnWeightFromAmputation =
    json['wantDiscountOnWeightFromAmputation'];
    amputationPer = json['amputationPer'];
    discountedWeight = json['discountedWeight'];
    discountedWeightLBS = json['discountedWeightLBS'];
    heightType = json['heightType'];
    heightMeasuredReported = json['heightMeasuredReported'];
    heightMeasuredReportedInch = json['heightMeasuredReported_inch'];
    heightMeasuredReportedMeter = json['heightMeasuredReportedMeter'];
    kneeHeight = json['kneeHeight'];
    kneeHeightInch = json['kneeHeight_inch'];
    armSpan = json['armSpan'];
    armSpanInch = json['armSpan_inch'];
    estimatedHeight = json['estimatedHeight'];
    estimatedHeightInches = json['estimatedHeightInches'];
    bmi = json['bmi'];
    idealBodyWeight = json['idealBodyWeight'];
    idealBodyWeightLBS = json['idealBodyWeightLBS'];
    adjustedBodyWeight = json['adjustedBodyWeight'];
    adjustedBodyWeightLBS = json['adjustedBodyWeightLBS'];
    lastUpdate = json['lastUpdate'];
    updatedBy = json['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['weightType'] = this.weightType;
    data['weightMeasuredReported'] = this.weightMeasuredReported;
    data['weightMeasuredReportedLBS'] = this.weightMeasuredReportedLBS;
    data['ac'] = this.ac;
    data['ac_inch'] = this.acInch;
    data['MUAC'] = this.mUAC;
    data['MUAC_inch'] = this.mUACInch;
    data['CALF'] = this.cALF;
    data['CALF_inch'] = this.cALFInch;
    data['TST'] = this.tST;
    data['TST_inch'] = this.tSTInch;
    data['mamc'] = this.mamc;
    data['mamcper'] = this.mamcper;
    data['estimatedWeight'] = this.estimatedWeight;
    data['estimatedWeightLBS'] = this.estimatedWeightLBS;
    data['edema'] = this.edema;
    data['edema_LBS'] = this.edemaLBS;
    data['amputation'] = this.amputation;
    data['amputation_LBS'] = this.amputationLBS;
    data['wantDiscountOnWeightFromAmputation'] =
        this.wantDiscountOnWeightFromAmputation;
    data['amputationPer'] = this.amputationPer;
    data['discountedWeight'] = this.discountedWeight;
    data['discountedWeightLBS'] = this.discountedWeightLBS;
    data['heightType'] = this.heightType;
    data['heightMeasuredReported'] = this.heightMeasuredReported;
    data['heightMeasuredReported_inch'] = this.heightMeasuredReportedInch;
    data['heightMeasuredReportedMeter'] = this.heightMeasuredReportedMeter;
    data['kneeHeight'] = this.kneeHeight;
    data['kneeHeight_inch'] = this.kneeHeightInch;
    data['armSpan'] = this.armSpan;
    data['armSpan_inch'] = this.armSpanInch;
    data['estimatedHeight'] = this.estimatedHeight;
    data['estimatedHeightInches'] = this.estimatedHeightInches;
    data['bmi'] = this.bmi;
    data['idealBodyWeight'] = this.idealBodyWeight;
    data['idealBodyWeightLBS'] = this.idealBodyWeightLBS;
    data['adjustedBodyWeight'] = this.adjustedBodyWeight;
    data['adjustedBodyWeightLBS'] = this.adjustedBodyWeightLBS;
    data['lastUpdate'] = this.lastUpdate;
    data['updated_by'] = this.updatedBy;
    return data;
  }
}


class CutomizedData {
  String? minEnergy;
  String? maxEnergy;
  String? minProtien;
  String? maxProtien;
  String? minEnergyValue;
  String? maxEnergyValue;
  String? minProtienValue;
  String? manProtienValue;
  String? lastUpdate;
  String? condition;

  CutomizedData(
      {this.minEnergy,
        this.maxEnergy,
        this.minProtien,
        this.maxProtien,
        this.minEnergyValue,
        this.maxEnergyValue,
        this.minProtienValue,
        this.manProtienValue,
        this.lastUpdate,
        this.condition});

  CutomizedData.fromJson(Map<String, dynamic> json) {
    minEnergy = json['min_energy'];
    maxEnergy = json['max_energy'];
    minProtien = json['min_protien'];
    maxProtien = json['max_protien'];
    minEnergyValue = json['min_energy_value'];
    maxEnergyValue = json['max_energy_value'];
    minProtienValue = json['min_protien_value'];
    manProtienValue = json['man_protien_value'];
    lastUpdate = json['lastUpdate'];
    condition = json['condition'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['min_energy'] = this.minEnergy;
    data['max_energy'] = this.maxEnergy;
    data['min_protien'] = this.minProtien;
    data['max_protien'] = this.maxProtien;
    data['min_energy_value'] = this.minEnergyValue;
    data['max_energy_value'] = this.maxEnergyValue;
    data['min_protien_value'] = this.minProtienValue;
    data['man_protien_value'] = this.manProtienValue;
    data['lastUpdate'] = this.lastUpdate;
    data['condition'] = this.condition;
    return data;
  }
}

class ParenteralData {
  String? lastUpdate;
  int? teamStatus;
  bool? tabStatus;
  ReadyToUse? readyToUse;
  Manipulated? manipulated;
  NonNutritional? nonNutritional;
  ReducedJustification? reducedJustification;

  ParenteralData(
      {this.lastUpdate,
        this.teamStatus,
        this.tabStatus,
        this.readyToUse,
        this.manipulated,
        this.nonNutritional,
        this.reducedJustification});

  ParenteralData.fromJson(Map<String, dynamic> json) {
    lastUpdate = json['lastUpdate'];
    teamStatus = json['team_status'];
    tabStatus = json['tab_status'];
    readyToUse = json['ready_to_use'] != null
        ? new ReadyToUse.fromJson(json['ready_to_use'])
        : null;
    manipulated = json['manipulated'] != null
        ? new Manipulated.fromJson(json['manipulated'])
        : null;
    nonNutritional = json['non_nutritional'] != null
        ? new NonNutritional.fromJson(json['non_nutritional'])
        : null;
    reducedJustification = json['reduced_justification'] != null
        ? new ReducedJustification.fromJson(json['reduced_justification'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lastUpdate'] = this.lastUpdate;
    data['team_status'] = this.teamStatus;
    data['tab_status'] = this.tabStatus;
    if (this.readyToUse != null) {
      data['ready_to_use'] = this.readyToUse!.toJson();
    }
    if (this.manipulated != null) {
      data['manipulated'] = this.manipulated!.toJson();
    }
    if (this.nonNutritional != null) {
      data['non_nutritional'] = this.nonNutritional!.toJson();
    }
    if (this.reducedJustification != null) {
      data['reduced_justification'] = this.reducedJustification!.toJson();
    }
    return data;
  }
}

class ReadyToUse {
  String? lastUpdate;
  String? title;
  String? titleId;
  String? bagPerDay;
  String? bagsFromAdmin;
  String? startTime;
  String? startDate;
  String? hrInfusion;
  String? totalVol;
  String? totalCal;
  String? currentWork;
  TotalMacro? totalMacro;
  RelativeMacro? relativeMacro;

  ReadyToUse(
      {this.lastUpdate,
        this.title,
        this.titleId,
        this.bagPerDay,
        this.bagsFromAdmin,
        this.startTime,
        this.startDate,
        this.hrInfusion,
        this.totalVol,
        this.totalCal,
        this.currentWork,
        this.totalMacro,
        this.relativeMacro});

  ReadyToUse.fromJson(Map<String, dynamic> json) {
    lastUpdate = json['lastUpdate'];
    title = json['title'];
    titleId = json['title_id'];
    bagPerDay = json['bag_per_day'];
    bagsFromAdmin = json['bags_from_admin'];
    startTime = json['start_time'];
    startDate = json['start_date'];
    hrInfusion = json['hr_infusion'];
    totalVol = json['total_vol'];
    totalCal = json['total_cal'];
    currentWork = json['current_work'];
    totalMacro = json['total_macro'] != null
        ? new TotalMacro.fromJson(json['total_macro'])
        : null;
    relativeMacro = json['relative_macro'] != null
        ? new RelativeMacro.fromJson(json['relative_macro'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lastUpdate'] = this.lastUpdate;
    data['title'] = this.title;
    data['title_id'] = this.titleId;
    data['bag_per_day'] = this.bagPerDay;
    data['bags_from_admin'] = this.bagsFromAdmin;
    data['start_time'] = this.startTime;
    data['start_date'] = this.startDate;
    data['hr_infusion'] = this.hrInfusion;
    data['total_vol'] = this.totalVol;
    data['total_cal'] = this.totalCal;
    data['current_work'] = this.currentWork;
    if (this.totalMacro != null) {
      data['total_macro'] = this.totalMacro!.toJson();
    }
    if (this.relativeMacro != null) {
      data['relative_macro'] = this.relativeMacro!.toJson();
    }
    return data;
  }
}

class TotalMacro {
  String? protein;
  String? liquid;
  String? glucose;

  TotalMacro({this.protein, this.liquid, this.glucose});

  TotalMacro.fromJson(Map<String, dynamic> json) {
    protein = json['protein'];
    liquid = json['liquid'];
    glucose = json['glucose'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['protein'] = this.protein;
    data['liquid'] = this.liquid;
    data['glucose'] = this.glucose;
    return data;
  }
}

class RelativeMacro {
  String? liquid;
  String? glucose;

  RelativeMacro({this.liquid, this.glucose});

  RelativeMacro.fromJson(Map<String, dynamic> json) {
    liquid = json['liquid'];
    glucose = json['glucose'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['liquid'] = this.liquid;
    data['glucose'] = this.glucose;
    return data;
  }
}

class Manipulated {
  String? lastUpdate;
  String? startTime;
  String? startDate;
  String? hrInfusion;
  String? totalVol;
  String? totalCal;
  String? currentWork;
  TotalMacro? totalMacro;
  RelativeMacro? relativeMacro;

  Manipulated(
      {this.lastUpdate,
        this.startTime,
        this.startDate,
        this.hrInfusion,
        this.totalVol,
        this.totalCal,
        this.currentWork,
        this.totalMacro,
        this.relativeMacro});

  Manipulated.fromJson(Map<String, dynamic> json) {
    lastUpdate = json['lastUpdate'];
    startTime = json['start_time'];
    startDate = json['start_date'];
    hrInfusion = json['hr_infusion'];
    totalVol = json['total_vol'];
    totalCal = json['total_cal'];
    currentWork = json['current_work'];
    totalMacro = json['total_macro'] != null
        ? new TotalMacro.fromJson(json['total_macro'])
        : null;
    relativeMacro = json['relative_macro'] != null
        ? new RelativeMacro.fromJson(json['relative_macro'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lastUpdate'] = this.lastUpdate;
    data['start_time'] = this.startTime;
    data['start_date'] = this.startDate;
    data['hr_infusion'] = this.hrInfusion;
    data['total_vol'] = this.totalVol;
    data['total_cal'] = this.totalCal;
    data['current_work'] = this.currentWork;
    if (this.totalMacro != null) {
      data['total_macro'] = this.totalMacro!.toJson();
    }
    if (this.relativeMacro != null) {
      data['relative_macro'] = this.relativeMacro!.toJson();
    }
    return data;
  }
}

class NonNutritional {
  String? propofol;
  String? glucose;
  String? citrate;
  String? total;

  NonNutritional({this.propofol, this.glucose, this.citrate, this.total});

  NonNutritional.fromJson(Map<String, dynamic> json) {
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

class ParenteralDetails {
  String? lastUpdate;
  // Null? updatedBy;
  int? teamStatus;
  bool? tabStatus;
  ReadyToUse? readyToUse;
  Manipulated? manipulated;
  NonNutritional? nonNutritional;

  ParenteralDetails(
      {this.lastUpdate,
        // this.updatedBy,
        this.teamStatus,
        this.tabStatus,
        this.readyToUse,
        this.manipulated,
        this.nonNutritional});

  ParenteralDetails.fromJson(Map<String, dynamic> json) {
    lastUpdate = json['lastUpdate'];
    // updatedBy = json['updated_by'];
    teamStatus = json['team_status'];
    tabStatus = json['tab_status'];
    readyToUse = json['ready_to_use'] != null
        ? new ReadyToUse.fromJson(json['ready_to_use'])
        : null;
    manipulated = json['manipulated'] != null
        ? new Manipulated.fromJson(json['manipulated'])
        : null;
    nonNutritional = json['non_nutritional'] != null
        ? new NonNutritional.fromJson(json['non_nutritional'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lastUpdate'] = this.lastUpdate;
    // data['updated_by'] = this.updatedBy;
    data['team_status'] = this.teamStatus;
    data['tab_status'] = this.tabStatus;
    if (this.readyToUse != null) {
      data['ready_to_use'] = this.readyToUse!.toJson();
    }
    if (this.manipulated != null) {
      data['manipulated'] = this.manipulated!.toJson();
    }
    if (this.nonNutritional != null) {
      data['non_nutritional'] = this.nonNutritional!.toJson();
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

class ParenteralFormula {
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

  ParenteralFormula(
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

  ParenteralFormula.fromJson(Map<String, dynamic> json) {
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
  String? type;
  String? startInterval;
  String? endInterval;
  String? date;
  String? time;
  String? lastUpdate;
  String? formulaName;
  String? expectedVol;
  String? infusedVol;

  Formula(
      {this.type,
        this.startInterval,
        this.endInterval,
        this.date,
        this.time,
        this.lastUpdate,
        this.formulaName,
        this.expectedVol,
        this.infusedVol});

  Formula.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    startInterval = json['start_interval'];
    endInterval = json['end_interval'];
    date = json['date'];
    time = json['time'];
    lastUpdate = json['lastUpdate'];
    formulaName = json['formula_name'];
    expectedVol = json['expected_vol'];
    infusedVol = json['infused_vol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['start_interval'] = this.startInterval;
    data['end_interval'] = this.endInterval;
    data['date'] = this.date;
    data['time'] = this.time;
    data['lastUpdate'] = this.lastUpdate;
    data['formula_name'] = this.formulaName;
    data['expected_vol'] = this.expectedVol;
    data['infused_vol'] = this.infusedVol;
    return data;
  }
}