class SourceModel {
  const SourceModel({required this.id, required this.name});

  final String? id;
  final String name;

  static SourceModel fromJson(Map<String, dynamic> json) {
    return SourceModel(id: json['id'] as String?, name: json['name'] as String);
  }
}
