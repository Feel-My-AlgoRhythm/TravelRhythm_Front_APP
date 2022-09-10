class RegionModel {
  List<RegionContent>? regionContent;

  RegionModel({this.regionContent});

  RegionModel.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      regionContent = <RegionContent>[];
      json['content'].forEach((v) {
        regionContent!.add(RegionContent.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (regionContent != null) {
      data['content'] = regionContent!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RegionContent {
  int? id;
  String? regionCode;
  String? regionName;

  RegionContent({this.id, this.regionCode, this.regionName});

  RegionContent.fromJson(Map<String, dynamic> json) {
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
