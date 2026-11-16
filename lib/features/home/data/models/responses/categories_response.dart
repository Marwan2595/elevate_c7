import 'package:elevate_c7/features/home/data/models/dto/category_model.dart';
import 'package:elevate_c7/config/models/metadata_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'categories_response.g.dart';

@JsonSerializable()
class CategoryResponse {
  @JsonKey(name: "results")
  final int? results;
  @JsonKey(name: "metadata")
  final Metadata? metadata;
  @JsonKey(name: "data")
  final List<Category>? data;

  CategoryResponse({this.results, this.metadata, this.data});

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}
