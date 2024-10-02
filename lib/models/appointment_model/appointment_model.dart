class AppointmentModel {
  String? uid;
  String? acceptedBy;
  String? clinicId;
  DateTime? startTime;
  DateTime? createdDate;
  DateTime? endTime;
  String? notificationStatus;
  List<String>? patientsIds;
  String? workerName;
  int? priorityTime;

  AppointmentModel({
    required this.acceptedBy,
    required this.endTime,
    required this.createdDate,
    required this.clinicId,
    required this.uid,
    required this.startTime,
    required this.notificationStatus,
    required this.patientsIds,
    required this.workerName,
    required this.priorityTime,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      AppointmentModel(
        acceptedBy: json["acceptedBy"],
        clinicId: json["clinicId"],
        uid: json["uid"],
        endTime: DateTime.parse(json["endTime"]),
        createdDate: DateTime.parse(json["createdDate"]),
        startTime: DateTime.parse(json["startTime"]),
        notificationStatus: json["notificationStatus"],
        patientsIds: List<String>.from(json["patientsIds"].map((x) => x)),
        workerName: json["workerName"],
        priorityTime: json["priorityTime"],
      );

  Map<String, dynamic> toJson() => {
        "acceptedBy": acceptedBy,
        "clinicId": clinicId,
        "uid": uid,
        "endTime": endTime?.toIso8601String(),
        "startTime": startTime?.toIso8601String(),
        "createdDate": createdDate?.toIso8601String(),
        "notificationStatus": notificationStatus,
        "patientsIds": List<dynamic>.from(patientsIds!.map((x) => x)),
        "workerName": workerName,
        "priorityTime": priorityTime,
      };
}
