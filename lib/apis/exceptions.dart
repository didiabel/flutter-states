import 'dart:developer';

class AppException implements Exception {
  Object exception;

  AppException(this.exception) {
    log('$exception');
  }
}

class UnknownException extends AppException {
  UnknownException(super.exception);
}

class ServerErrorException extends AppException {
  ServerErrorException(super.exception);
}

class NotFoundException extends AppException {
  NotFoundException(super.exception);
}

class AlreadyExistsException extends AppException {
  AlreadyExistsException(super.exception);
}

class NetworkErrorException extends AppException {
  NetworkErrorException(super.exception);
}

class VariableTypeException extends AppException {
  VariableTypeException(super.exception);
}
