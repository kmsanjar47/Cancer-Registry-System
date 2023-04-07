class DepartmentModel {
  late String _departmentID;
  late String _departmentName;
  late String _headOfDeptID;
  List<String> _doctorIDs = [];
  late DateTime _creationDate;

  DepartmentModel(
      {required String departmentID,
      required String departmentName,
      required String headOfDeptID,
      required List<String> doctorIDs,
      required DateTime creationDate}) {
    _departmentID = departmentID;
    _departmentName = departmentName;
    _doctorIDs = doctorIDs;
    _headOfDeptID = headOfDeptID;
    _creationDate = creationDate;
  }

  String get departmentID => _departmentID;

  set departmentID(String value) {
    _departmentID = value;
  }

  String get departmentName => _departmentName;

  set departmentName(String value) {
    _departmentName = value;
  }

  String get headOfDeptID => _headOfDeptID;

  set headOfDeptID(String value) {
    _headOfDeptID = value;
  }

  List<String> get doctorIDs => _doctorIDs;

  set doctorIDs(List<String> value) {
    _doctorIDs = value;
  }

  DateTime get creationDate => _creationDate;

  set creationDate(DateTime value) {
    _creationDate = value;
  }

  DepartmentModel.fromJson(Map<String, dynamic> json) {
    _departmentID = json["departmentID"];
    _departmentName = json["departmentName"];
    _doctorIDs = json["doctorIDs"];
    _headOfDeptID = json["headOfDeptID"];
    _creationDate = json["creationDate"];
  }

  Map<String, dynamic> toJson() {
    return {
      "departmentID": _departmentID,
      "departmentName": _departmentName,
      "doctorIDs": _doctorIDs,
      "headOfDeptID": _headOfDeptID,
      "creationDate": _creationDate
    };
  }
}
