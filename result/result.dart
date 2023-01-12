// Test
void main(List<String> args) {
  var process = Process();

  print(process.run().isSuccess);
  print(process.run().validationErrors[0].property);
}

class Process {
  Result<String> run() {
    return Result.invalid(ValidationError("_field name", "message error"));
  }
}

class ValidationError {
  String property;
  String message;

  ValidationError(this.property, this.message);
}

class Result<T> {
  T? data;
  List<String> errors = [];
  List<ValidationError> validationErrors = [];

  bool get isSuccess => errors.isEmpty && validationErrors.isEmpty;

  // ignore: unused_element
  // Result._() {}

  Result(T? value) {
    this.data = value;
  }

  static Result<T> success<T>(T value) {
    return Result<T>(value);
  }

  static Result<T> error<T>(String error) {
    var result = Result<T>(null);
    result.errors = [error];
    return result;
  }

  static Result<T> setErrors<T>(List<String> errors) {
    var result = Result<T>(null);
    result.errors = errors;
    return result;
  }

  static Result<T> invalid<T>(ValidationError validationError) {
    var result = Result<T>(null);
    result.validationErrors = [validationError];
    return result;
  }

  static Result<T> invalids<T>(List<ValidationError> validationErrors) {
    var result = Result<T>(null);
    result.validationErrors = validationErrors;
    return result;
  }
}
