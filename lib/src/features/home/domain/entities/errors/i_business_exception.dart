abstract class IBusinessException {
  final String? message;
  final StackTrace? stackTrace;

  IBusinessException([this.message, this.stackTrace]);
}

class ExternalException extends IBusinessException {
  ExternalException([
    super.message = 'Error from ExternalException',
    super.stackTrace,
  ]);
}
