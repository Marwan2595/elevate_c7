import 'package:json_annotation/json_annotation.dart';
import 'metadata_model.dart';
import 'product_model.dart';

part 'products_response.g.dart';

@JsonSerializable()
class ProductsResponse {
  @JsonKey(name: "results")
  int? count;
  @JsonKey(name: "metadata")
  Metadata? metadata;
  @JsonKey(name: "data")
  List<ProductModel>? data;

  ProductsResponse({this.count, this.metadata, this.data});

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);
}
