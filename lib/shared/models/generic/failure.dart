abstract class Failure {
  Failure._();
  String get message;

  factory Failure(e) {
    switch (e.runtimeType) {
      case NotionError:
        return NotionError(e);
      default:
        return UnmappedFailure(e);
    }
  }
}

class UnmappedFailure extends Failure {
  final dynamic value;

  UnmappedFailure(this.value) : super._();

  @override
  String get message => "An unexpected error has occurece: ${value.toString}";
}

class NotionError extends Failure {
  final dynamic value;

  NotionError(this.value) : super._();

  @override
  String get message => "Error in integration with Notion: ${value.toString()}";
}
