import 'dart:convert';
ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));
String productModelToJson(ProductModel data) => json.encode(data.toJson());
class ProductModel {
  ProductModel({
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

  ProductModel.fromJson(dynamic json) {
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
/*
[
{
        "id": 4,
        "variations": [
            {
                "id": 1,
                "sale_price": 350,
                "variation_name": "Extra Cheese",
                "featured_image": "https://admin.kushinirestaurant.com/media/images/products/featured_image/12347.jpg",
                "stock": 0,
                "created": "2024-06-29T10:39:41.612200+05:30",
                "show_status": false,
                "showing_order": 3,
                "product": 4
            },
            {
                "id": 2,
                "sale_price": 250,
                "variation_name": "Veg Toppings",
                "featured_image": "https://admin.kushinirestaurant.com/media/images/products/featured_image/190.jpg",
                "stock": 0,
                "created": "2024-06-29T10:39:59.267160+05:30",
                "show_status": false,
                "showing_order": 4,
                "product": 4
            },
            {
                "id": 3,
                "sale_price": 270,
                "variation_name": "Mixed Vegetables",
                "featured_image": "https://admin.kushinirestaurant.com/media/images/products/featured_image/38482.jpg",
                "stock": 0,
                "created": "2024-06-29T10:40:19.005158+05:30",
                "show_status": false,
                "showing_order": 5,
                "product": 4
            }
        ],
        "in_wishlist": false,
        "avg_rating": 0,
        "images": [
            "https://admin.kushinirestaurant.com/media/images/products/additional_image/top-view-big-meat-slice-raw-meat-with-pepper-dark-surfa_Trgr5WW.jpg"
        ],
        "variation_exists": true,
        "sale_price": 350,
        "addons": [
            {
                "id": 2,
                "price": 25,
                "name": "Ginger",
                "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                "featured_image": "https://admin.kushinirestaurant.com/media/images/products/additional_image/ginger-root-compressed.jpg",
                "stock": 0,
                "is_active": true,
                "tax_rate": 1
            },
            {
                "id": 1,
                "price": 20,
                "name": "garlic",
                "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                "featured_image": "https://admin.kushinirestaurant.com/media/images/products/additional_image/garlic-paste-black-compressed.jpg",
                "stock": 0,
                "is_active": true,
                "tax_rate": 1
            },
            {
                "id": 3,
                "price": 60,
                "name": "Chicken Masala",
                "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                "featured_image": "https://admin.kushinirestaurant.com/media/images/products/additional_image/flat-lay-white-bowls-with-spices-compressed.jpg",
                "stock": 0,
                "is_active": true,
                "tax_rate": 1
            },
            {
                "id": 4,
                "price": 10,
                "name": "Curry Leaves",
                "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                "featured_image": "https://admin.kushinirestaurant.com/media/images/products/additional_image/modern-kitchen-composition-with-healthy-ingredients-compressed.jpg",
                "stock": 0,
                "is_active": true,
                "tax_rate": 1
            }
        ],
        "available": true,
        "available_from": "01:38 AM",
        "available_to": "11:38 PM",
        "name": "Beef Boneless",
        "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        "caption": "Beef Boneless",
        "featured_image": "https://admin.kushinirestaurant.com/media/images/products/additional_image/top-view-big-meat-slice-raw-meat-with-pepper-dark-surfa_Trgr5WW.jpg",
        "mrp": 350,
        "stock": 0,
        "is_active": true,
        "discount": "14.00",
        "created_date": "2024-06-29T10:38:47.360021+05:30",
        "product_type": "Non-Veg",
        "showing_order": null,
        "variation_name": "weight",
        "category": 2,
        "tax_rate": 2
    },
]
 */