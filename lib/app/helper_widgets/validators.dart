class Validators {
  String? validateFirstName(String? name) {
    if ((name ?? "").trim().isEmpty) {
      return "First name can't be empty";
    }
    if ((name ?? "").trim().length < 3) {
      return "First name should have minimum 3 characters";
    }
    if ((name ?? "").trim().length > 30) {
      return "First name should have maximum 30 characters";
    }
    return null;
  }

  String? validateName(String? name) {
    if ((name ?? "").trim().isEmpty) {
      return "Patient name can't be empty";
    }
    if ((name ?? "").trim().length < 3) {
      return "Patient name should have minimum 8 characters";
    }
    if ((name ?? "").trim().length > 30) {
      return "Patient name should have maximum 30 characters";
    }
    return null;
  }

  String? validateLastName(String? name) {
    if ((name ?? "").trim().isNotEmpty) {
      if ((name ?? "").trim().length < 3) {
        return "Last name should have minimum 3 characters";
      }
      if ((name ?? "").trim().length > 30) {
        return "Last name should have maximum 30 characters";
      }
    }
    return null;
  }

  String? validateEmailForm(String? email) {
    if ((email ?? "").trim().isEmpty) return "Enter email";
    return validateEmail(email ?? "") ? null : "Enter a valid email";
  }

  String? validatePhone(String? phone) {
    if ((phone ?? "").trim().isEmpty) return "Phone number can't be empty";
    if ((phone ?? "").trim().length < 10) {
      return "Phone number should be 10 digits";
    }
    if ((phone ?? "").trim().length > 15) {
      return "Phone number should have maximum 15 digits";
    }
    return null;
  }

  validateEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(email.trim())) {
      return false;
    } else {
      return true;
    }
  }

  String? validatePassword(String? value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
    if (value!.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Password must be 6 characters which contains\nat least one upper case, one lower case, one digit\nand one special character';
      } else {
        return null;
      }
    }
  }

  String? validateNewPassword(String? value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
    if (value!.isEmpty) {
      return 'Please enter new password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Password must be 6 characters which contains\nat least one upper case, one lower case, one digit\nand one special character';
      } else {
        return null;
      }
    }
  }

  String? validateOldPassword(String? value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
    if (value!.isEmpty) {
      return 'Please enter old password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Password must be 6 characters which contains\nat least one upper case, one lower case, one digit\nand one special character';
      } else {
        return null;
      }
    }
  }

  String? validateChangePass(String? value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
    if (value!.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Password must be 6 characters which\ncontains at least one upper case, one\nlower case, one digit and one special\ncharacter';
      } else {
        return null;
      }
    }
  }

  String? validateLoginPass(String? password) {
    if ((password ?? "").trim().isEmpty) {
      return "Please enter password";
    } else {
      return null;
    }
  }

  String? validateConfirmPassword(String confirmPassword, String? newPassword) {
    if (confirmPassword.trim().isEmpty) {
      return "Confirm password can't be empty";
    } else if (confirmPassword.trim() != newPassword?.trim()) {
      return " Confirm password doesn't match";
    }
    return null;
  }

  String? otherField(String? pwd, error) {
    if (pwd!.trim().isEmpty) return error;
    return null;
  }

  String? birthDayField(String? pwd) {
    if (pwd!.trim().isEmpty) return "Enter your birthday";
    return null;
  }

  String? completeAddress(String? pwd) {
    if ((pwd ?? "").trim().isEmpty) return "Complete address can't be empty";
    return null;
  }

  String? placeValidate(String? pwd) {
    if ((pwd ?? "").trim().isEmpty) return "Place name can't be empty";
    return null;
  }

  String? validateIssue(String? name) {
    if ((name ?? "").trim().isEmpty) {
      return "Please describe your issue.";
    }
    return null;
  }
}
