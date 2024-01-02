class CIDresponse {
  bool? _success;
  String? _message;
  List<Data>? _data;


  bool? get success => _success;
  set success(bool? success) => _success = success;
  String? get message => _message;
  set message(String? message) => _message = message;
  List<Data>? get data => _data;
  set data(List<Data>? data) => _data = data;

  CIDresponse.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _message = json['message'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this._success;
    data['message'] = this._message;

    return data;
  }
}

class Data {
  String? _cidname;
  bool? _isBlocked;
  String? _sId;
  //List<Null>? _availableIn;
  int? _iV;
  String? _createdAt;
  String? _updatedAt;


  String? get cidname => _cidname;
  set cidname(String? cidname) => _cidname = cidname;
  bool? get isBlocked => _isBlocked;
  set isBlocked(bool? isBlocked) => _isBlocked = isBlocked;
  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  //List<Null>? get availableIn => _availableIn;
 // set availableIn(List<Null>? availableIn) => _availableIn = availableIn;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  Data.fromJson(Map<String, dynamic> json) {
    _cidname = json['cidname'];
    _isBlocked = json['isBlocked'];
    _sId = json['_id'];
    // if (json['availableIn'] != null) {
    //   _availableIn = <Null>[];
    //   json['availableIn'].forEach((v) { _availableIn!.add(new Null.fromJson(v)); });
    // }
    _iV = json['__v'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cidname'] = this._cidname;
    data['isBlocked'] = this._isBlocked;
    data['_id'] = this._sId;
    // if (this._availableIn != null) {
    //   data['availableIn'] = this._availableIn!.map((v) => v.toJson()).toList();
    // }
    data['__v'] = this._iV;
    data['createdAt'] = this._createdAt;
    data['updatedAt'] = this._updatedAt;
    return data;
  }
}

