class RegionModel {
  List<Content>? content;

  RegionModel({this.content});

  RegionModel.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(Content.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (content != null) {
      data['content'] = content!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Content {
  int? id;
  String? regionCode;
  String? regionName;

  Content({this.id, this.regionCode, this.regionName});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    regionCode = json['regionCode'];
    regionName = json['regionName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['regionCode'] = regionCode;
    data['regionName'] = regionName;
    return data;
  }
}
