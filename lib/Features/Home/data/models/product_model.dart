

class ProductModel {
  final String title;
  final String? description;
  final double price;
  final int quantity;
  final double discount;
  //final bool isFeatured;
  //final String code;
  final String? image;
  //final int? sellingCount;
  //final String priceUnit;

  ProductModel({
    required this.title,
    this.description,
    //required this.code,
    required this.price,
    required this.quantity,
    required this.discount,
    //required this.isFeatured,
    //required this.priceUnit,
    this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json){
    return ProductModel(
      title: json["title"],
      description: json["description"],
      //code: json["code"],
      price: json["price"],
      quantity: json["quantity"],
      discount: json["discount"],
      //priceUnit: json["priceUnit"],
      image: json["image"],
    );
  }

}
