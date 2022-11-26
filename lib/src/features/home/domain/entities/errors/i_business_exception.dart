abstract class IBusinessException {
  final String? message;
  final StackTrace? stackTrace;

  IBusinessException([this.message, this.stackTrace]);
}

class ArgumentsException extends IBusinessException {
  ArgumentsException([
    super.message = 'Error from ArgumentsException',
    super.stackTrace,
  ]);
}

class RepositoryException extends IBusinessException {
  RepositoryException([
    super.message = 'Error from RepositoryException',
    super.stackTrace,
  ]);
}

class AdapterException extends RepositoryException {
  AdapterException([
    super.message = 'Error from AdapterException',
    super.stackTrace,
  ]);
}
