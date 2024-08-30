class CartModel {
  String? title;
  double? price;
  int? quantity;
  String? image;
  String? subtitle ;
  double? fixedPrice;
  

  

  CartModel({this.title, this.price, this.quantity, this.image, this.subtitle, required fixedPrice});

  CartModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
    quantity = json['quantity'];
    image = json['image'];
    subtitle = json['subtitle'];
    fixedPrice = json['fixedPrice'];

  }

  String? get id => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['price'] = price;
    data['quantity'] = quantity;
    data['image'] = image;
    data['subtitle'] = subtitle;
    data['fixedPrice'] = fixedPrice;

    return data;
  }
}
