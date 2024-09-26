class WorkerModel {
  final String name;

  WorkerModel({
    required this.name,
  });

  // Method to convert JSON into WorkerModel
  factory WorkerModel.fromJson(Map<String, dynamic> json) {
    return WorkerModel(
      name: json['name'] ?? '',
    );
  }

  // Method to convert WorkerModel into JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
