class ProductDataModel {
  List<Data>? data;
  Meta? meta;

  ProductDataModel({this.data, this.meta});

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? description;
  Category? category;
  String? imageUrl;
  List<Prices>? prices;

  Data(
      {this.id,
      this.name,
      this.description,
      this.category,
      this.imageUrl,
      this.prices});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    imageUrl = json['imageUrl'];
    if (json['prices'] != null) {
      prices = <Prices>[];
      json['prices'].forEach((v) {
        prices!.add(Prices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['imageUrl'] = imageUrl;
    if (prices != null) {
      data['prices'] = prices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  String? slug;

  Category({this.id, this.slug});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    return data;
  }
}

class Prices {
  String? value;
  String? currency;

  Prices({this.value, this.currency});

  Prices.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['currency'] = currency;
    return data;
  }
}

class Meta {
  int? page;
  int? size;
  int? count;

  Meta({this.page, this.size, this.count});

  Meta.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    size = json['size'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['size'] = size;
    data['count'] = count;
    return data;
  }
}
