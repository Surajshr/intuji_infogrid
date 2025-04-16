class FieldErrorResponseModel {
  List<Errors>? errors;

  FieldErrorResponseModel({this.errors});

  FieldErrorResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['errors'] != null) {
      errors = <Errors>[];
      json['errors'].forEach((v) {
        errors!.add(Errors.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (errors != null) {
      data['errors'] = errors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Errors {
  String? message;
  String? field;

  Errors({this.message, this.field});

  Errors.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    field = json['field'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['field'] = field;
    return data;
  }
}
