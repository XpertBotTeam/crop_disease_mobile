// To parse this JSON data, do
//
//     final disease = diseaseFromJson(jsonString);

import 'dart:convert';

Disease diseaseFromJson(String str) => Disease.fromJson(json.decode(str));

String diseaseToJson(Disease data) => json.encode(data.toJson());

class Disease {
  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;


  Disease({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,


  });

  factory Disease.fromJson(Map<String, dynamic> json) => Disease(
    currentPage: json["current_page"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "links": List<dynamic>.from(links.map((x) => x.toJson())),
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class Datum {
  int id;
  String name;
  String description;
  String causalAgent;
  String transmission;
  String prevention;
  String symptoms;
  String diagnosis;
  String treatment;
  DateTime createdAt;
  DateTime updatedAt;
  List<Photo> photos;

  Datum({
    required this.id,
    required this.name,
    required this.description,
    required this.causalAgent,
    required this.transmission,
    required this.prevention,
    required this.symptoms,
    required this.diagnosis,
    required this.treatment,
    required this.createdAt,
    required this.updatedAt,
    required this.photos,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    causalAgent: json["causal_agent"],
    transmission: json["transmission"],
    prevention: json["prevention"],
    symptoms: json["symptoms"],
    diagnosis: json["diagnosis"],
    treatment: json["treatment"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "causal_agent": causalAgent,
    "transmission": transmission,
    "prevention": prevention,
    "symptoms": symptoms,
    "diagnosis": diagnosis,
    "treatment": treatment,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
  };
}
class Photo {
  int id;
  String caption;
  DateTime createdAt;
  DateTime updatedAt;
  String plantName;
  String imageUrl;
  String name;
  Pivot pivot;

  Photo({
    required this.id,
    required this.caption,
    required this.createdAt,
    required this.updatedAt,
    required this.plantName,
    required this.imageUrl,
    required this.name,
    required this.pivot,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    id: json["id"],
    caption: json["caption"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    plantName: json["plantName"],
    imageUrl: json["image_url"],
    name: json["name"],
    pivot: Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "caption": caption,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "plantName": plantName,
    "image_url": imageUrl,
    "name": name,
    "pivot": pivot.toJson(),
  };
}

class Pivot {
  int diseaseId;
  int photoId;

  Pivot({
    required this.diseaseId,
    required this.photoId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    diseaseId: json["disease_id"],
    photoId: json["photo_id"],
  );

  Map<String, dynamic> toJson() => {
    "disease_id": diseaseId,
    "photo_id": photoId,
  };
}
class Link {
  String? url;
  String label;
  bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "label": label,
    "active": active,
  };
}



