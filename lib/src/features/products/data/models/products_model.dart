import 'package:ecommerce_sample/src/features/products/domain/entities/product_entity.dart';

class ProductModel {
  const ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  final int id;
  final String title;
  final String description;
  final num price;
  final num discountPercentage;
  final num rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<dynamic> images;

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      price: map['price'] as num,
      discountPercentage: map['discountPercentage'] as num,
      rating: map['rating'] as num,
      stock: map['stock'] as int,
      brand: map['brand'] as String,
      category: map['category'] as String,
      thumbnail: map['thumbnail'] as String,
      images: map['images'] as List<dynamic>,
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      title: title,
      description: description,
      price: price,
      discountPercentage: discountPercentage,
      rating: rating,
      stock: stock,
      brand: brand,
      category: category,
      thumbnail: thumbnail,
      images: images.map((e) => e as String).toList(),
    );
  }
}






//Product Model example
// {
//   "id": 1,
//   "title": "iPhone 9",
//   "description": "An apple mobile which is nothing like apple",
//   "price": 549,
//   "discountPercentage": 12.96,
//   "rating": 4.69,
//   "stock": 94,
//   "brand": "Apple",
//   "category": "smartphones",
//   "thumbnail": "https://cdn.dummyjson.com/product-images/1/thumbnail.jpg",
//   "images": [
//     "https://cdn.dummyjson.com/product-images/1/1.jpg",
//     "https://cdn.dummyjson.com/product-images/1/2.jpg",
//     "https://cdn.dummyjson.com/product-images/1/3.jpg",
//     "https://cdn.dummyjson.com/product-images/1/4.jpg",
//     "https://cdn.dummyjson.com/product-images/1/thumbnail.jpg"
//   ]
// }