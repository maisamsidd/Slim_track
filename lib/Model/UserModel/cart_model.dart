class CartModel {
  String? title;
  double? price;
  int? quantity;
  String? image;
  double? fixedPrice;
  String? subtitle;

  CartModel(
      {this.title,
      this.price,
      this.quantity,
      this.image,
      this.fixedPrice,
      this.subtitle});

  CartModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
    quantity = json['quantity'];
    image = json['image'];
    fixedPrice = json['fixedPrice'];
    subtitle = json['subtitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['image'] = this.image;
    data['fixedPrice'] = this.fixedPrice;
    data['subtitle'] = this.subtitle;
    return data;
  }
}
