class PatientModel{
  late String _patientID;
  late String _name;
  late int _age;
  String? _bloodGroup;
  String? _height;
  String? _weight;
  late String _contactNum;
  late String _email;
  String? _address;
  late String _emergencyContact;
  List<String>? _malignancyIDs;
  List<String>? _medicalHistoryIDs;
  List<String>? _doctorIDs;
  late String _cancerType;
  late String _cancerStage;
  late DateTime _creationDate;
  late String _qrCode;

  PatientModel({
    required String patientID,
    required name,
    required age,
    bloodGroup,
    height,
    weight,
    required contactNum,
    required email,
    required address,
    required emergencyContact,
    malignancyIds,
    medicalHistoryIDs,
    doctorIDs,
    cancerType,
    cancerStage,
    required creationDate,
    required qrCode,
  }) {
    _patientID = patientID;
    _name = name;
    _age = age;
    _bloodGroup = bloodGroup;
    _height = height;
    _weight = weight;
    _contactNum = contactNum;
    _email = email;
    _address = address;
    _emergencyContact = emergencyContact;
    _malignancyIDs = malignancyIds;
    _medicalHistoryIDs = medicalHistoryIDs;
    _doctorIDs = doctorIDs;
    _cancerType = cancerType;
    _cancerStage = cancerStage;
    _creationDate = creationDate;
    _qrCode = qrCode;
  }

  String get patientId => _patientID;


  set patientId(String value) {
    _patientID = value;
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
    value != null?
    _bloodGroup = value:_bloodGroup = "Not Set";
  }

  String? get height => _height;

  set height(String? value) {
    value != null?
    _height = value:_height = "Not Set";
  }

  String? get weight => _weight;

  set weight(String? value) {
    value != null?
    _weight = value:_weight = "Not Set";
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
    value != null?
    _address = value:_address = "Not Set";
  }

  String get emergencyContact => _emergencyContact;

  set emergencyContact(String value) {
    _emergencyContact = value;
  }

  List<String>? get malignancyIDs => _malignancyIDs;

  set malignancyIDs(List<String>? value) {
    value != null?
    _malignancyIDs = value:_malignancyIDs = [];
  }

  List<String>? get medicalHistoryIDs => _medicalHistoryIDs;

  set medicalHistoryIDs(List<String>? value) {
    value != null?
    _medicalHistoryIDs = value:_medicalHistoryIDs = [];
  }

  List<String>? get doctorIDs => _doctorIDs;

  set doctorIDs(List<String>? value) {
    value != null?
    _doctorIDs = value:_doctorIDs = [];
  }

  String get cancerType => _cancerType;

  set cancerType(String value) {
    _cancerType = value;
  }

  String get cancerStage => _cancerStage;

  set cancerStage(String value) {
    _cancerStage = value;
  }

  DateTime get creationDate => _creationDate;

  set creationDate(DateTime value) {
    _creationDate = value;
  }

  String get qrCode => _qrCode;

  set qrCode(String value) {
    _qrCode = value;
  }

  PatientModel.fromJson(Map<String, dynamic> json) {
    _patientID = json["patientId"];
    _name = json["name"];
    _age = json["age"];
    _bloodGroup = json["bloodGroup"];
    _height = json["height"];
    _weight = json["weight"];
    _contactNum = json["contactNum"];
    _email = json["email"];
    _address = json["address"];
    _emergencyContact = json["emergencyContact"];
    _malignancyIDs = json["malignancyId"];
    _medicalHistoryIDs = json["medicalHistoryIDs"];
    _doctorIDs = json["doctorIDs"];
    _cancerType = json["cancerType"];
    _cancerStage = json["cancerStage"];
    _creationDate = json["creationDate"];
    _qrCode = json["qrCode"];
  }

  Map<String, dynamic> toJson() {
    return {
      "patientID": _patientID,
      "name": _name,
      "age": _age,
      "bloodGroup": _bloodGroup,
      "height": _height,
      "weight": _weight,
      "contactNum": _contactNum,
      "email": _email,
      "address": _address,
      "emergencyContact": _emergencyContact,
      "malignancyIDs": _malignancyIDs,
      "medicalHistoryIDs": _medicalHistoryIDs,
      "doctorIDs": _doctorIDs,
      "creationDate": _creationDate,
      "cancerType":_cancerType,
      "cancerStage":_cancerStage,
      "qrCode": _qrCode
    };
  }
}