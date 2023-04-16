// To parse this JSON data, do
//
//     final loginModels = loginModelsFromJson(jsonString);

import 'dart:convert';

LoginModels loginModelsFromJson(String str) =>
    LoginModels.fromJson(json.decode(str));

String loginModelsToJson(LoginModels data) => json.encode(data.toJson());

class LoginModels {
  LoginModels({
    required this.status,
    required this.accessToken,
    required this.tokenType,
    required this.data,
  });

  Status status;
  String accessToken;
  String tokenType;
  Data data;

  factory LoginModels.fromJson(Map<String, dynamic> json) => LoginModels(
        status: Status.fromJson(json["status"]),
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status.toJson(),
        "access_token": accessToken,
        "token_type": tokenType,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.email,
    required this.hp,
    required this.firstname,
    required this.lastname,
    required this.grup,
    required this.tglLahir,
    required this.jenisKelamin,
    required this.referralCode,
    required this.status,
    required this.accountStatus,
    required this.officialRepresentative,
    required this.photo,
    this.toko,
    required this.createdAt,
    this.updatedAt,
    this.referredBy,
    this.statusBlokir,
  });

  int id;
  String email;
  String hp;
  String firstname;
  String lastname;
  String grup;
  DateTime tglLahir;
  Status jenisKelamin;
  String referralCode;
  Status status;
  Status accountStatus;
  Status officialRepresentative;
  Photo photo;
  dynamic toko;
  CreatedAt createdAt;
  dynamic updatedAt;
  dynamic referredBy;
  dynamic statusBlokir;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        hp: json["hp"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        grup: json["grup"],
        tglLahir: DateTime.parse(json["tgl_lahir"]),
        jenisKelamin: Status.fromJson(json["jenis_kelamin"]),
        referralCode: json["referral_code"],
        status: Status.fromJson(json["status"]),
        accountStatus: Status.fromJson(json["account_status"]),
        officialRepresentative:
            Status.fromJson(json["official_representative"]),
        photo: Photo.fromJson(json["photo"]),
        toko: json["toko"],
        createdAt: CreatedAt.fromJson(json["created_at"]),
        updatedAt: json["updated_at"],
        referredBy: json["referred_by"],
        statusBlokir: json["status_blokir"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "hp": hp,
        "firstname": firstname,
        "lastname": lastname,
        "grup": grup,
        "tgl_lahir":
            "${tglLahir.year.toString().padLeft(4, '0')}-${tglLahir.month.toString().padLeft(2, '0')}-${tglLahir.day.toString().padLeft(2, '0')}",
        "jenis_kelamin": jenisKelamin.toJson(),
        "referral_code": referralCode,
        "status": status.toJson(),
        "account_status": accountStatus.toJson(),
        "official_representative": officialRepresentative.toJson(),
        "photo": photo.toJson(),
        "toko": toko,
        "created_at": createdAt.toJson(),
        "updated_at": updatedAt,
        "referred_by": referredBy,
        "status_blokir": statusBlokir,
      };
}

class Status {
  Status({
    this.kode,
    required this.keterangan,
  });

  dynamic kode;
  String keterangan;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        kode: json["kode"],
        keterangan: json["keterangan"],
      );

  Map<String, dynamic> toJson() => {
        "kode": kode,
        "keterangan": keterangan,
      };
}

class CreatedAt {
  CreatedAt({
    required this.waktu,
    required this.waktuIndonesia,
  });

  DateTime waktu;
  String waktuIndonesia;

  factory CreatedAt.fromJson(Map<String, dynamic> json) => CreatedAt(
        waktu: DateTime.parse(json["waktu"]),
        waktuIndonesia: json["waktu_indonesia"],
      );

  Map<String, dynamic> toJson() => {
        "waktu": waktu.toIso8601String(),
        "waktu_indonesia": waktuIndonesia,
      };
}

class Photo {
  Photo({
    required this.id,
    required this.filename,
    required this.caption,
    required this.width,
    required this.height,
    required this.contentType,
    required this.storage,
    required this.uri,
  });

  int id;
  String filename;
  String caption;
  int width;
  int height;
  String contentType;
  String storage;
  String uri;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        filename: json["filename"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        contentType: json["content_type"],
        storage: json["storage"],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "filename": filename,
        "caption": caption,
        "width": width,
        "height": height,
        "content_type": contentType,
        "storage": storage,
        "uri": uri,
      };
}
