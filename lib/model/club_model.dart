class ClubModel {
  int? count;
  Filters? filters;
  List<Teams>? teams;

  ClubModel({this.count, this.filters, this.teams});

  ClubModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    filters =
        json['filters'] != null ? new Filters.fromJson(json['filters']) : null;
    if (json['teams'] != null) {
      teams = <Teams>[];
      json['teams'].forEach((v) {
        teams!.add(new Teams.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.filters != null) {
      data['filters'] = this.filters!.toJson();
    }
    if (this.teams != null) {
      data['teams'] = this.teams!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Filters {
  int? limit;
  int? offset;
  String? permission;

  Filters({this.limit, this.offset, this.permission});

  Filters.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    offset = json['offset'];
    permission = json['permission'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    data['permission'] = this.permission;
    return data;
  }
}

class Teams {
  int? id;
  String? name;
  String? shortName;
  String? tla;
  String? crest;
  String? address;
  String? website;
  int? founded;
  String? clubColors;
  String? venue;
  String? lastUpdated;

  Teams(
      {this.id,
      this.name,
      this.shortName,
      this.tla,
      this.crest,
      this.address,
      this.website,
      this.founded,
      this.clubColors,
      this.venue,
      this.lastUpdated});

  Teams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortName = json['shortName'];
    tla = json['tla'];
    crest = json['crest'];
    address = json['address'];
    website = json['website'];
    founded = json['founded'];
    clubColors = json['clubColors'];
    venue = json['venue'];
    lastUpdated = json['lastUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['shortName'] = this.shortName;
    data['tla'] = this.tla;
    data['crest'] = this.crest;
    data['address'] = this.address;
    data['website'] = this.website;
    data['founded'] = this.founded;
    data['clubColors'] = this.clubColors;
    data['venue'] = this.venue;
    data['lastUpdated'] = this.lastUpdated;
    return data;
  }
}
