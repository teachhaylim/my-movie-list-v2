import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.dto.freezed.dart';
part 'pagination.dto.g.dart';

@Freezed(genericArgumentFactories: true)
// @freezed
class PaginationDto<T> with _$PaginationDto<T> {
  factory PaginationDto({
    @JsonKey(name: 'total_pages') required int totalPages,
    @JsonKey(name: 'total_results') required int totalResults,
    required List<T> results,
    required int page,
  }) = _PaginationDto;

  factory PaginationDto.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) => _$PaginationDtoFromJson(json, fromJsonT);
}
