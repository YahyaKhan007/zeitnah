class AppointmentModel {
  String? uid;
  String? acceptedBy;
  String? clinicId;
  DateTime? startTime;
  DateTime? endTime;
  String? notificationStatus;
  List<String>? cancelBy;
  String? workerName;
  int? priorityTime;

  AppointmentModel({
    required this.acceptedBy,
    required this.endTime,
    required this.clinicId,
    required this.uid,
    required this.startTime,
    required this.notificationStatus,
    required this.cancelBy,
    required this.workerName,
    required this.priorityTime,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      AppointmentModel(
        acceptedBy: json["acceptedBy"],
        clinicId: json["clinicId"],
        uid: json["uid"],
        endTime: DateTime.parse(json["endTime"]),
        startTime: DateTime.parse(json["startTime"]),
        notificationStatus: json["notificationStatus"],
        cancelBy: List<String>.from(json["cancelBy"].map((x) => x)),
        workerName: json["workerName"],
        priorityTime: json["priorityTime"],
      );

  Map<String, dynamic> toJson() => {
        "acceptedBy": acceptedBy,
        "clinicId": clinicId,
        "uid": uid,
        "endTime": endTime?.toIso8601String(),
        "startTime": startTime?.toIso8601String(),
        "notificationStatus": notificationStatus,
        "cancelBy": List<dynamic>.from(cancelBy!.map((x) => x)),
        "workerName": workerName,
        "priorityTime": priorityTime,
      };
}
