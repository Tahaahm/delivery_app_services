// ignore_for_file: unnecessary_this, prefer_initializing_formals

class Products {
  int? typeId;
  int? offset;
  late List<ProductsModel> _products;
  List<ProductsModel> get product => _products;

  Products({required typeId, required offset, required products}) {
    this._products = product;
    this.offset = offset;
    this.typeId = typeId;
  }

  Products.fromJson(Map<String, dynamic> json) {
    typeId = json['type_id'];
    offset = json['offset'];
    if (json['products'] != null) {
      _products = <ProductsModel>[];
      json['products'].forEach((v) {
        _products.add(ProductsModel.fromJson(v));
      });
    }
  }
}

class ProductsModel {
  int? id;
  String? name;
  String? image;
  String? description;
  double? price;
  String? descriptions;
  String? size;
  String? weight;
  int? time;

  ProductsModel(
      {this.id,
      this.name,
      this.image,
      this.description,
      this.price,
      this.descriptions,
      this.size,
      this.weight,
      this.time});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    price = json['price'];
    descriptions = json['descriptions'];
    size = json['size'];
    weight = json['weight'];
    time = json['time'];
  }
  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      'name': this.name,
      "image": this.image,
      "price": this.price,
      "description": this.description,
      'descriptions': this.descriptions,
      "size": this.size,
      "weight": this.weight,
      "time": this.time,
    };
  }
}
