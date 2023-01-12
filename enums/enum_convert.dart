class EnumConvert {
  static bool _isEnumItem(enumItem) {
    final split_enum = enumItem.toString().split('.');

    print("split_enum: $split_enum");
    return split_enum.length > 1 &&
        split_enum[0] == enumItem.runtimeType.toString();
  }

  static String convertToString(dynamic enumItem) {
    assert(enumItem != null);
    assert(_isEnumItem(enumItem),
        '$enumItem of type ${enumItem.runtimeType.toString()} is not an enum item');
    final _tmp = enumItem.toString().split('.')[1];
    return _tmp;
  }
}

//Teste
void main(List<String> args) {
  var temp = EnumConvert.convertToString(File.Open);
  print(temp);
}

enum File { Read, Open }
