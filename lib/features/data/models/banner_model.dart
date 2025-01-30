import 'dart:convert';
BannerModel bannerModelFromJson(String str) => BannerModel.fromJson(json.decode(str));
String bannerModelToJson(BannerModel data) => json.encode(data.toJson());
class BannerModel {
  BannerModel({
      this.id, 
      this.product, 
      this.category, 
      this.name, 
      this.image, 
      this.showingOrder, 
      this.isActive,});

  BannerModel.fromJson(dynamic json) {
    id = json['id'];
    product = json['product'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    name = json['name'];
    image = json['image'];
    showingOrder = json['showing_order'];
    isActive = json['is_active'];
  }
  int? id;
  dynamic product;
  Category? category;
  String? name;
  String? image;
  int? showingOrder;
  bool? isActive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['product'] = product;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    map['name'] = name;
    map['image'] = image;
    map['showing_order'] = showingOrder;
    map['is_active'] = isActive;
    return map;
  }

}

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));
String categoryToJson(Category data) => json.encode(data.toJson());
class Category {
  Category({
      this.id, 
      this.name, 
      this.image, 
      this.isActive, 
      this.showingOrder, 
      this.slug, 
      this.products, 
      this.hexcode1, 
      this.hexcode2,});

  Category.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    isActive = json['is_active'];
    showingOrder = json['showing_order'];
    slug = json['slug'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
    hexcode1 = json['hexcode_1'];
    hexcode2 = json['hexcode_2'];
  }
  int? id;
  String? name;
  String? image;
  bool? isActive;
  int? showingOrder;
  String? slug;
  List<Products>? products;
  dynamic hexcode1;
  dynamic hexcode2;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['is_active'] = isActive;
    map['showing_order'] = showingOrder;
    map['slug'] = slug;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['hexcode_1'] = hexcode1;
    map['hexcode_2'] = hexcode2;
    return map;
  }

}

Products productsFromJson(String str) => Products.fromJson(json.decode(str));
String productsToJson(Products data) => json.encode(data.toJson());
class Products {
  Products({
      this.id, 
      this.variations, 
      this.inWishlist, 
      this.avgRating, 
      this.images, 
      this.variationExists, 
      this.salePrice, 
      this.addons, 
      this.available, 
      this.availableFrom, 
      this.availableTo, 
      this.name, 
      this.description, 
      this.caption, 
      this.featuredImage, 
      this.mrp, 
      this.stock, 
      this.isActive, 
      this.discount, 
      this.createdDate, 
      this.productType, 
      this.showingOrder, 
      this.variationName, 
      this.category, 
      this.taxRate,});

  Products.fromJson(dynamic json) {
    id = json['id'];
    if (json['variations'] != null) {
      variations = [];
      json['variations'].forEach((v) {
        variations?.add(Variations.fromJson(v));
      });
    }
    inWishlist = json['in_wishlist'];
    avgRating = json['avg_rating'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    variationExists = json['variation_exists'];
    salePrice = json['sale_price'];
    if (json['addons'] != null) {
      addons = [];
      json['addons'].forEach((v) {
        addons?.add(Addons.fromJson(v));
      });
    }
    available = json['available'];
    availableFrom = json['available_from'];
    availableTo = json['available_to'];
    name = json['name'];
    description = json['description'];
    caption = json['caption'];
    featuredImage = json['featured_image'];
    mrp = json['mrp'];
    stock = json['stock'];
    isActive = json['is_active'];
    discount = json['discount'];
    createdDate = json['created_date'];
    productType = json['product_type'];
    showingOrder = json['showing_order'];
    variationName = json['variation_name'];
    category = json['category'];
    taxRate = json['tax_rate'];
  }
  int? id;
  List<Variations>? variations;
  bool? inWishlist;
  int? avgRating;
  List<String>? images;
  bool? variationExists;
  int? salePrice;
  List<Addons>? addons;
  bool? available;
  String? availableFrom;
  String? availableTo;
  String? name;
  String? description;
  String? caption;
  String? featuredImage;
  int? mrp;
  int? stock;
  bool? isActive;
  String? discount;
  String? createdDate;
  String? productType;
  dynamic showingOrder;
  String? variationName;
  int? category;
  int? taxRate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (variations != null) {
      map['variations'] = variations?.map((v) => v.toJson()).toList();
    }
    map['in_wishlist'] = inWishlist;
    map['avg_rating'] = avgRating;
    map['images'] = images;
    map['variation_exists'] = variationExists;
    map['sale_price'] = salePrice;
    if (addons != null) {
      map['addons'] = addons?.map((v) => v.toJson()).toList();
    }
    map['available'] = available;
    map['available_from'] = availableFrom;
    map['available_to'] = availableTo;
    map['name'] = name;
    map['description'] = description;
    map['caption'] = caption;
    map['featured_image'] = featuredImage;
    map['mrp'] = mrp;
    map['stock'] = stock;
    map['is_active'] = isActive;
    map['discount'] = discount;
    map['created_date'] = createdDate;
    map['product_type'] = productType;
    map['showing_order'] = showingOrder;
    map['variation_name'] = variationName;
    map['category'] = category;
    map['tax_rate'] = taxRate;
    return map;
  }

}

Addons addonsFromJson(String str) => Addons.fromJson(json.decode(str));
String addonsToJson(Addons data) => json.encode(data.toJson());
class Addons {
  Addons({
      this.id, 
      this.price, 
      this.name, 
      this.description, 
      this.featuredImage, 
      this.stock, 
      this.isActive, 
      this.taxRate,});

  Addons.fromJson(dynamic json) {
    id = json['id'];
    price = json['price'];
    name = json['name'];
    description = json['description'];
    featuredImage = json['featured_image'];
    stock = json['stock'];
    isActive = json['is_active'];
    taxRate = json['tax_rate'];
  }
  int? id;
  int? price;
  String? name;
  String? description;
  String? featuredImage;
  int? stock;
  bool? isActive;
  int? taxRate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['price'] = price;
    map['name'] = name;
    map['description'] = description;
    map['featured_image'] = featuredImage;
    map['stock'] = stock;
    map['is_active'] = isActive;
    map['tax_rate'] = taxRate;
    return map;
  }

}

Variations variationsFromJson(String str) => Variations.fromJson(json.decode(str));
String variationsToJson(Variations data) => json.encode(data.toJson());
class Variations {
  Variations({
      this.id, 
      this.salePrice, 
      this.variationName, 
      this.featuredImage, 
      this.stock, 
      this.created, 
      this.showStatus, 
      this.showingOrder, 
      this.product,});

  Variations.fromJson(dynamic json) {
    id = json['id'];
    salePrice = json['sale_price'];
    variationName = json['variation_name'];
    featuredImage = json['featured_image'];
    stock = json['stock'];
    created = json['created'];
    showStatus = json['show_status'];
    showingOrder = json['showing_order'];
    product = json['product'];
  }
  int? id;
  int? salePrice;
  String? variationName;
  String? featuredImage;
  int? stock;
  String? created;
  bool? showStatus;
  int? showingOrder;
  int? product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['sale_price'] = salePrice;
    map['variation_name'] = variationName;
    map['featured_image'] = featuredImage;
    map['stock'] = stock;
    map['created'] = created;
    map['show_status'] = showStatus;
    map['showing_order'] = showingOrder;
    map['product'] = product;
    return map;
  }

}