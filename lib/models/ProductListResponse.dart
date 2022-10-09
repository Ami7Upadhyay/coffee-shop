/// product_data : [{"name":"New Delicacies","quantity":3,"products":[{"image":"delicacies1","price":"5","product_name":"Cookies"},{"image":"delicacies2","price":"6","product_name":"Croissant"},{"image":"delicacies3","price":"4","product_name":"Croissant"}]},{"name":"Hot Coffee","quantity":4,"products":[{"image":"coffee1","price":"7","product_name":"Black Coffee"},{"image":"coffee2","price":"12","product_name":"Pure Coffee"},{"image":"coffee3","price":"9","product_name":"Milk Coffee"},{"image":"coffee4","price":"9","product_name":"Moka Coffee"}]},{"name":"Cakes And Delicacies","quantity":4,"products":[{"image":"cake1","price":"6","product_name":"Cream Cake"},{"image":"cake2","price":"5","product_name":"Chocolate Croissant"},{"image":"cake3","price":"15","product_name":"Pancake"},{"image":"cake4","price":"12","product_name":"Milk Cake"}]}]

class ProductListResponse {
  ProductListResponse({
    List<ProductData>? productData,
  }) {
    _productData = productData;
  }

  ProductListResponse.fromJson(dynamic json) {
    if (json['product_data'] != null) {
      _productData = [];
      json['product_data'].forEach((v) {
        _productData?.add(ProductData.fromJson(v));
      });
    }
  }
  List<ProductData>? _productData;
  ProductListResponse copyWith({
    List<ProductData>? productData,
  }) =>
      ProductListResponse(
        productData: productData ?? _productData,
      );
  List<ProductData>? get productData => _productData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_productData != null) {
      map['product_data'] = _productData?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// name : "New Delicacies"
/// quantity : 3
/// products : [{"image":"delicacies1","price":"5","product_name":"Cookies"},{"image":"delicacies2","price":"6","product_name":"Croissant"},{"image":"delicacies3","price":"4","product_name":"Croissant"}]

class ProductData {
  ProductData({
    String? name,
    num? quantity,
    List<Products>? products,
  }) {
    _name = name;
    _quantity = quantity;
    _products = products;
  }

  ProductData.fromJson(dynamic json) {
    _name = json['name'];
    _quantity = json['quantity'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
  }
  String? _name;
  num? _quantity;
  List<Products>? _products;
  ProductData copyWith({
    String? name,
    num? quantity,
    List<Products>? products,
  }) =>
      ProductData(
        name: name ?? _name,
        quantity: quantity ?? _quantity,
        products: products ?? _products,
      );
  String? get name => _name;
  num? get quantity => _quantity;
  List<Products>? get products => _products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['quantity'] = _quantity;
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// image : "delicacies1"
/// price : "5"
/// product_name : "Cookies"

class Products {
  Products({
    String? image,
    String? price,
    String? productName,
  }) {
    _image = image;
    _price = price;
    _productName = productName;
  }

  Products.fromJson(dynamic json) {
    _image = json['image'];
    _price = json['price'];
    _productName = json['product_name'];
  }
  String? _image;
  String? _price;
  String? _productName;
  Products copyWith({
    String? image,
    String? price,
    String? productName,
  }) =>
      Products(
        image: image ?? _image,
        price: price ?? _price,
        productName: productName ?? _productName,
      );
  String? get image => _image;
  String? get price => _price;
  String? get productName => _productName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = _image;
    map['price'] = _price;
    map['product_name'] = _productName;
    return map;
  }
}
