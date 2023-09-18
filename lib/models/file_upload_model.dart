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

class ResponseFileUpload {
  List<ResponseFile>? files;
  dynamic status;
  String? message;
  dynamic data;
  String? name;

  ResponseFileUpload({this.files});

  ResponseFileUpload.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json['data'];
    name = json['name'];
    files = json["files"] == null
        ? null
        : (json["files"] as List).map((e) => ResponseFile.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (files != null) {
      data["files"] = files?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class ResponseFile {
  String? name;
  int? size;
  double? lastModify;
  String? folder;
  String? url;
  String? mediaPath;
  String? mime;
  String? mediaText;
  Anchor? anchor;

  ResponseFile({
    this.name,
    this.size,
    this.lastModify,
    this.folder,
    this.url,
    this.mediaPath,
    this.mime,
    this.mediaText,
    this.anchor,
  });

  ResponseFile.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    size = json["size"];
    lastModify = json["lastModify"];
    folder = json["folder"];
    url = json["url"];
    mediaPath = json["mediaPath"];
    mime = json["mime"];
    mediaText = json["mediaText"];
    anchor = json["anchor"] == null ? null : Anchor.fromJson(json["anchor"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["size"] = size;
    data["lastModify"] = lastModify;
    data["folder"] = folder;
    data["url"] = url;
    data["mediaPath"] = mediaPath;
    data["mime"] = mime;
    data["mediaText"] = mediaText;
    if (anchor != null) {
      data["anchor"] = anchor?.toJson();
    }
    return data;
  }
}

class Anchor {
  double? x;
  double? y;

  Anchor({this.x, this.y});

  Anchor.fromJson(Map<String, dynamic> json) {
    x = json["x"];
    y = json["y"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["x"] = x;
    data["y"] = y;
    return data;
  }
}
