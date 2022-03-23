class RelationModel {
  String relation;
  int relationId;
  RelationModel(this.relation, this.relationId);
  @override
  bool operator ==(Object other) =>
      other is RelationModel &&
      other.relation == relation &&
      other.relationId == relationId;

  @override
  // TODO: implement hashCode
  int get hashCode => relation.hashCode;
}
