abstract class Failure {
  Failure._();
  String get message;

  factory Failure.unmappedFailure(dynamic error) = UnmappedFailure;
}

class UnmappedFailure extends Failure {
  UnmappedFailure(this.value) : super._();

  final dynamic value;

  @override
  String get message => "An unexpected error has occurece: ${value.toString}";
}
