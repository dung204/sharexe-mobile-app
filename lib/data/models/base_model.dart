abstract class BaseModel {
  const BaseModel({
    required this.id,
    required this.createdAt,
    this.createdBy,
    this.lastModifiedAt,
    this.lastModifiedBy,
    this.deletedAt,
  });

  final String id;
  final DateTime createdAt;
  final String? createdBy;
  final DateTime? lastModifiedAt;
  final String? lastModifiedBy;
  final DateTime? deletedAt;
}
