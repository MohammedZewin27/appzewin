class Validate {

  ///       validate Mobile
  static String? validateCode(String value) {
    String pattern = r'^(?:[+0]9)?[0-9]{5}$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'الكود فارغ';
    } else if (!regExp.hasMatch(value)) {
      return 'الكود ارقام فقط';
    }
    return null;
  }
  static String? validateMobile(String value, {required String isEmpty, required String validNumber}) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(patttern);
    if (value.isEmpty) {
      return isEmpty;
    } else if (!regExp.hasMatch(value)) {
      return validNumber;
    }
    return null;
  }
///         validate Email
  static String? validateEmail(String value, ) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if(value.isEmpty){
      return 'الايميل فارغ';
    }
    else if (!regex.hasMatch(value)) {
      return 'اكتب الايميل بطرقة صحيحة';
    } else {
      return null;
    }
  }


  /// validatePassword
 static String? validatePassword(String value) {
    RegExp regex =
    RegExp(r'^.{6,}$');
    if (value.isEmpty) {
      return 'كلمة المرور فارغه *';
    } else {
      if (!regex.hasMatch(value)) {
        return 'يجب ان تتكون من 6 ارقام او حروف على الأقل';
      } else {
        return null;
      }
    }
  }


}
