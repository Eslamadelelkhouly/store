abstract class ErrorSignup {
  static String fetcherror({required String error}) {
    if (error == 'network-error') {
      return 'Network error occured';
    } else if (error == 'invalid-email') {
      return 'The email address is not valid';
    } else if (error == 'user-disabled') {
      return 'The user account has been disabled';
    } else if (error == 'user-not-found') {
      return 'No User Found';
    } else if (error == 'wrong-password') {
      return 'The password is not correct';
    }
    return 'Unknown error';
  }
}
