class Product {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<ProductModel> _products;

  List<ProductModel> get products => _products;

  Product({
    required totalSize,
    required typeId,
    required offset,
    required products,
  }) {
    _totalSize = totalSize;
    _typeId = typeId;
    _offset = offset;
    _products = products;
  }

  Product.fromJson(Map<String, dynamic> json) {
    _totalSize = json['count'];
    _typeId = json['type_id'];
    _offset = json['offset'];
    if (json['products'] != null) {
      _products = <ProductModel>[];
      json['products'].forEach((v) {
        _products.add(ProductModel.fromJson(v));
      });
    }
  }
}

class ProductModel {
  int? id;
  String? name;
  String? description;
  String? s_description;
  int? price;
  int? stock;
  int? stars;
  String? img;
  String? createdAt;
  String? updatedAt;
  int? typeId;
  ProductModel({
    required this.id,
    this.name,
    this.description,
    this.s_description,
    this.stock,
    this.price,
    this.stars,
    this.img,
    this.createdAt,
    this.updatedAt,
    this.typeId,
  });


  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      s_description: json['short_description'],
      price: json['price'] is int
          ? json['price']
          : (json['price'] as num)?.toInt(),
      stars: json['stars'],
      img: json['img'],
      stock: json['stock'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      typeId: json['type_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "price": price,
      "stock": stock,
      "img": img,
      "stars": stars,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
  }
}
