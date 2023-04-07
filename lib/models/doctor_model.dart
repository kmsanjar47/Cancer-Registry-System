class DoctorModel {
  late String _doctorId;
  late String _name;
  late int _age;
  String? _bloodGroup;
  String? _height;
  String? _weight;
  late String _contactNum;
  late String _email;
  String? _address;
  late String _emergencyContact;
  late String _departmentId;
  List<String> _patientIDs = [];
  late DateTime _creationDate;
  late String _qrCode;

  DoctorModel({
    required String doctorId,
    required name,
    required age,
    bloodGroup,
    height,
    weight,
    required contactNum,
    required email,
    address,
    required emergencyContact,
    required departmentId,
    patientIDs,
    required creationDate,
    required qrCode,
  }) {
    _doctorId = doctorId;
    _name = name;
    _age = age;
    _bloodGroup = bloodGroup;
    _height = height;
    _weight = weight;
    _contactNum = contactNum;
    _email = email;
    _address = address;
    _emergencyContact = emergencyContact;
    _departmentId = departmentId;
    _patientIDs = patientIDs;
    _creationDate = creationDate;
    _qrCode = qrCode;
  }

  String get doctorId => _doctorId;

  set doctorId(String value) {
    _doctorId = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get age => _age;

  set age(int value) {
    _age = value;
  }

  String? get bloodGroup => _bloodGroup;

  set bloodGroup(String? value) {
    _bloodGroup = value;
  }

  String? get height => _height;

  set height(String? value) {
    _height = value;
  }

  String? get weight => _weight;

  set weight(String? value) {
    _weight = value;
  }

  String get contactNum => _contactNum;

  set contactNum(String value) {
    _contactNum = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String? get address => _address;

  set address(String? value) {
    _address = value;
  }

  String get emergencyContact => _emergencyContact;

  set emergencyContact(String value) {
    _emergencyContact = value;
  }

  String get departmentId => _departmentId;

  set departmentId(String value) {
    _departmentId = value;
  }

  List<String> get patientIDs => _patientIDs;

  set patientIDs(List<String> value) {
    _patientIDs = value;
  }

  DateTime get creationDate => _creationDate;

  set creationDate(DateTime value) {
    _creationDate = value;
  }

  String get QR => _qrCode;

  set QR(String value) {
    _qrCode = value;
  }

  DoctorModel.fromJson(Map<String, dynamic> json) {
    _doctorId = json["doctorId"];
    _name = json["name"];
    _age = json["age"];
    _bloodGroup = json["bloodGroup"];
    _height = json["height"];
    _weight = json["weight"];
    _contactNum = json["contactNum"];
    _email = json["email"];
    _address = json["address"];
    _emergencyContact = json["emergencyContact"];
    _departmentId = json["departmentId"];
    _patientIDs = json["patientIDs"];
    _creationDate = json["creationDate"];
    _qrCode = json["qrCode"];
  }

  Map<String, dynamic> toJson() {
    return {
      "doctorId": _doctorId,
      "name": _name,
      "age": _age,
      "bloodGroup": _bloodGroup,
      "height": _height,
      "weight": _weight,
      "contactNum": _contactNum,
      "email": _email,
      "address": _address,
      "emergencyContact": _emergencyContact,
      "departmentId": _departmentId,
      "patientIDs": _patientIDs,
      "creationDate": _creationDate,
      "qrCode": _qrCode
    };
  }
}
