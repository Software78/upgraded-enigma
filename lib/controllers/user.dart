import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthStatus extends ChangeNotifier {
  GoogleSignIn googleSignIn = GoogleSignIn();
  bool isAuth = false;

  String photoUrl = GoogleSignIn().currentUser!.photoUrl.toString();

  Future<void> handleSignIn() async {
    try {
      await googleSignIn.signIn();
      var currentUser = googleSignIn.currentUser!.displayName;
      isAuth = !isAuth;

      notifyListeners();
      Fluttertoast.showToast(msg: 'signed in as $currentUser');
    } catch (error) {
      print(error);
    }
  }

  Future<void> handleSignOut() async {
    try {
      Fluttertoast.showToast(msg: 'signing out');
      await googleSignIn.signOut();
      isAuth = !isAuth;
      notifyListeners();

      Fluttertoast.showToast(msg: 'signed out');
    } catch (error) {
      print(error);
    }
  }

  // addBooltoSF() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setBool('isAuth', isAuth);
  // }

  // readBoolfromSF() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool? isAuth = prefs.getBool('isAuth');
  // }
}
