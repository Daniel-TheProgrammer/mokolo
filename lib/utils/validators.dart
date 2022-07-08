class Validators {
  static String? txtvalidator(String value, String errMsg) {
    if (value.length < 3) {
      return errMsg;
    } else {
      return null;
    }
  }

  static String? emailValidator(String value) //Email Validation
  {
    var pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  static String? passwordvalidator(String value) {
    if (value.length < 8) {
      return "Invalid Pass word";
    } else {
      return null;
    }
  }
}
