enum ValidationType { email, notEmpty, notNull }

class ValidationError {
  String property;
  String message;

  ValidationError(this.property, this.message);
}

class ValidationResult {
  List<ValidationError> validationErrors = [];
  bool isValid = false;

  ValidationResult() {
    isValid = this.validationErrors.isEmpty;
  }
}

abstract class AbstractFluentValidation<T> {
  ValidationResult validate<T>(T value);
}

class FluentValidation<T> {
  RuleFor<T>(String property, ValidationType type, String messageError) {
    return this;
  }

  RuleForMust(String property, Function function, String messageError) {
    return this;
  }

  ValidationResult superValidate<T>() {
    RuleFor("nome", ValidationType.notEmpty, "Not empty");
    RuleFor("nome", ValidationType.notNull, "Not null");
    RuleForMust("nome", () {}, "Default");

    return ValidationResult();
  }
}

class UserValidator extends FluentValidation
    implements AbstractFluentValidation<User> {
  @override
  ValidationResult validate<T>(T value) {
    // Your code

    RuleFor("nome", ValidationType.notEmpty, "Not empty");
    RuleFor("nome", ValidationType.notNull, "Not null");
    RuleForMust("nome", () {}, "Default");

    // return default

    return this.superValidate();
  }
}

class User {
  String name;
  User(this.name);
}

void main(List<String> args) {
  var user = User("Philippe");

  print(UserValidator().validate(user));
}
