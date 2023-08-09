// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Chair {
  String title;
  String discription;
  String image;
  String id;
  num price;
  Chair({
    required this.title,
    required this.discription,
    required this.image,
    required this.id,
    required this.price,
  });

  Chair copyWith({
    String? title,
    String? discription,
    String? image,
    String? id,
    num? price,
  }) {
    return Chair(
      title: title ?? this.title,
      discription: discription ?? this.discription,
      image: image ?? this.image,
      id: id ?? this.id,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'discription': discription,
      'image': image,
      'id': id,
      'price': price,
    };
  }

  factory Chair.fromMap(Map<String, dynamic> map) {
    return Chair(
      title: map['title'] as String,
      discription: map['discription'] as String,
      image: map['image'] as String,
      id: map['id'] as String,
      price: map['price'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory Chair.fromJson(String source) =>
      Chair.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Chair(title: $title, discription: $discription, image: $image, id: $id, price: $price)';
  }

  @override
  bool operator ==(covariant Chair other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.discription == discription &&
        other.image == image &&
        other.id == id &&
        other.price == price;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        discription.hashCode ^
        image.hashCode ^
        id.hashCode ^
        price.hashCode;
  }
}
