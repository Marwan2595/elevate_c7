import 'package:json_annotation/json_annotation.dart';
import '../../../../../config/models/metadata_model.dart';
import '../dto/product_model.dart';

part 'products_response.g.dart';

@JsonSerializable()
class ProductsResponse {
  @JsonKey(name: "results")
  int? count;
  @JsonKey(name: "metadata")
  Metadata? metadata;
  @JsonKey(name: "data")
  List<ProductModel>? productsList;

  ProductsResponse({this.count, this.metadata, this.productsList});

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);
}
