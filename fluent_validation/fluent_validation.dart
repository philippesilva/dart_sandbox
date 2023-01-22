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

class Item {
  String property;
  ValidationType type;
  String message;
  Function function;

  Item(this.property, this.type, this.message, this.function);
}

class Validation {
  static bool isEmail(String email) {
    return true;
  }
}

class FluentValidation<T> {
  List<Item> _items = [];

  RuleFor<T>(String property, ValidationType type, String messageError) {
    _items.add(Item(property, type, messageError, (){});
  }

  RuleForMust(String property, Function function, String messageError) {
    return this;
  }

  ValidationResult validate<T>(T value) {
    return ValidationResult();
  }
}

class UserValidator extends FluentValidation<User> {
  UserValidator() {
    RuleFor("name", ValidationType.notEmpty, "Not empty");
    RuleFor("name", ValidationType.notNull, "Not null");
    RuleForMust("name", () {}, "Default");
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
