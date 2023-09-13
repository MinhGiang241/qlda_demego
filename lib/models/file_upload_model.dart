// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FileUploadModel {
  String? id;
  String? name;
  FileUploadModel({
    this.id,
    this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'file_id': id,
      'name': name,
    };
  }

  factory FileUploadModel.fromMap(Map<String, dynamic> map) {
    return FileUploadModel(
      id: map['file_id'] != null ? map['file_id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FileUploadModel.fromJson(String source) =>
      FileUploadModel.fromMap(json.decode(source) as Map<String, dynamic>);

  FileUploadModel copyWith({
    String? id,
    String? name,
  }) {
    return FileUploadModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
