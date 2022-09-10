class PlaceModel {
  List<Content>? content;
  bool? empty;
  bool? first;
  bool? last;
  int? number;
  int? numberOfElements;
  int? size;
  Sort? sort;
  int? totalElements;
  int? totalPages;

  PlaceModel(
      {this.content,
        this.empty,
        this.first,
        this.last,
        this.number,
        this.numberOfElements,
        this.size,
        this.sort,
        this.totalElements,
        this.totalPages});

  PlaceModel.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(Content.fromJson(v));
      });
    }
    empty = json['empty'];
    first = json['first'];
    last = json['last'];
    number = json['number'];
    numberOfElements = json['numberOfElements'];
    size = json['size'];
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    totalElements = json['totalElements'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (content != null) {
      data['content'] = content!.map((v) => v.toJson()).toList();
    }
    data['empty'] = empty;
    data['first'] = first;
    data['last'] = last;
    data['number'] = number;
    data['numberOfElements'] = numberOfElements;
    data['size'] = size;
    if (sort != null) {
      data['sort'] = sort!.toJson();
    }
    data['totalElements'] = totalElements;
    data['totalPages'] = totalPages;
    return data;
  }
}

class Content {
  String? addressRoadName;
  int? bigCategoryId;
  String? bigCategoryName;
  int? id;
  String? name;
  String? naverId;
  int? placeDetailId;
  String? posExact;
  String? regionCode;
  int? regionId;
  String? regionName;
  int? smallCategoryId;
  String? smallCategoryName;
  String? x;
  String? y;

  Content(
      {this.addressRoadName,
        this.bigCategoryId,
        this.bigCategoryName,
        this.id,
        this.name,
        this.naverId,
        this.placeDetailId,
        this.posExact,
        this.regionCode,
        this.regionId,
        this.regionName,
        this.smallCategoryId,
        this.smallCategoryName,
        this.x,
        this.y});

  Content.fromJson(Map<String, dynamic> json) {
    addressRoadName = json['addressRoadName'];
    bigCategoryId = json['bigCategoryId'];
    bigCategoryName = json['bigCategoryName'];
    id = json['id'];
    name = json['name'];
    naverId = json['naverId'];
    placeDetailId = json['placeDetailId'];
    posExact = json['posExact'];
    regionCode = json['regionCode'];
    regionId = json['regionId'];
    regionName = json['regionName'];
    smallCategoryId = json['smallCategoryId'];
    smallCategoryName = json['smallCategoryName'];
    x = json['x'];
    y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['addressRoadName'] = addressRoadName;
    data['bigCategoryId'] = bigCategoryId;
    data['bigCategoryName'] = bigCategoryName;
    data['id'] = id;
    data['name'] = name;
    data['naverId'] = naverId;
    data['placeDetailId'] = placeDetailId;
    data['posExact'] = posExact;
    data['regionCode'] = regionCode;
    data['regionId'] = regionId;
    data['regionName'] = regionName;
    data['smallCategoryId'] = smallCategoryId;
    data['smallCategoryName'] = smallCategoryName;
    data['x'] = x;
    data['y'] = y;
    return data;
  }
}

class Sort {
  bool? empty;
  bool? sorted;
  bool? unsorted;

  Sort({this.empty, this.sorted, this.unsorted});

  Sort.fromJson(Map<String, dynamic> json) {
    empty = json['empty'];
    sorted = json['sorted'];
    unsorted = json['unsorted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['empty'] = empty;
    data['sorted'] = sorted;
    data['unsorted'] = unsorted;
    return data;
  }
}