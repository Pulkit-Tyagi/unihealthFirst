class SpecialtyResponse {
  bool? success;
  String? message;
  List<Data>? data;

  SpecialtyResponse({this.success, this.message, this.data});

  SpecialtyResponse.fromJson(Map<String, dynamic> json) {
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

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
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