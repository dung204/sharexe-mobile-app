abstract class BaseEntity {
  String get id;
  DateTime get createdAt;
  String? get createdBy;
  DateTime? get lastModifiedAt;
  String? get lastModifiedBy;
  DateTime? get deletedAt;
}
