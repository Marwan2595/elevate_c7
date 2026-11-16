import 'package:elevate_c7/features/home/domain/entities/product_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'brand_model.dart';
import 'category_model.dart';
import 'subcategory_model.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  @JsonKey(name: "sold")
  int? sold;
  @JsonKey(name: "images")
  List<String>? images;
  @JsonKey(name: "subcategory")
  List<Subcategory>? subcategory;
  @JsonKey(name: "ratingsQuantity")
  int? ratingsQuantity;
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "slug")
  String? slug;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "quantity")
  int? quantity;
  @JsonKey(name: "price")
  int? price;
  @JsonKey(name: "imageCover")
  String? imageCover;
  @JsonKey(name: "category")
  Category? category;
  @JsonKey(name: "brand")
  Brand? brand;
  @JsonKey(name: "ratingsAverage")
  double? ratingsAverage;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "id")
  String? productId;

  ProductModel({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.productId,
  });

  ProductEntity toDomain() {
    return ProductEntity(
      id: id ?? "",
      title: title ?? '',
      description: description ?? '',
      price: price?.toDouble() ?? 0.0,
      imageUrl: imageCover ?? '',
      rating: ratingsAverage,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
