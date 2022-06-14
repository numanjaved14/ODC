class Properties {
  List<Data>? data;
  bool? error;
  Null? message;

  Properties({this.data, this.error, this.message});

  Properties.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['error'] = this.error;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? url;
  String? description;
  String? image;
  String? imageThumb;
  List<String>? images;
  String? priceHtml;
  String? cityName;
  int? numberBedroom;
  int? numberBathroom;
  int? square;
  String? squareText;
  String? type;
  String? typeText;
  String? latitude;
  String? longitude;
  String? period;
  String? statusHtml;
  String? categoryName;
  String? mapIcon;

  Data(
      {this.id,
      this.name,
      this.url,
      this.description,
      this.image,
      this.imageThumb,
      this.images,
      this.priceHtml,
      this.cityName,
      this.numberBedroom,
      this.numberBathroom,
      this.square,
      this.squareText,
      this.type,
      this.typeText,
      this.latitude,
      this.longitude,
      this.period,
      this.statusHtml,
      this.categoryName,
      this.mapIcon});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    description = json['description'];
    image = json['image'];
    imageThumb = json['image_thumb'];
    images = json['images'].cast<String>();
    priceHtml = json['price_html'];
    cityName = json['city_name'];
    numberBedroom = json['number_bedroom'];
    numberBathroom = json['number_bathroom'];
    square = json['square'];
    squareText = json['square_text'];
    type = json['type'];
    typeText = json['type_text'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    period = json['period'];
    statusHtml = json['status_html'];
    categoryName = json['category_name'];
    mapIcon = json['map_icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    data['description'] = this.description;
    data['image'] = this.image;
    data['image_thumb'] = this.imageThumb;
    data['images'] = this.images;
    data['price_html'] = this.priceHtml;
    data['city_name'] = this.cityName;
    data['number_bedroom'] = this.numberBedroom;
    data['number_bathroom'] = this.numberBathroom;
    data['square'] = this.square;
    data['square_text'] = this.squareText;
    data['type'] = this.type;
    data['type_text'] = this.typeText;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['period'] = this.period;
    data['status_html'] = this.statusHtml;
    data['category_name'] = this.categoryName;
    data['map_icon'] = this.mapIcon;
    return data;
  }
}
