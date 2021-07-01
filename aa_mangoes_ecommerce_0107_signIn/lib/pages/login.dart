import 'package:aa_mangoes_ecommerce/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aa_mangoes_ecommerce/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences preferences;
  bool loading = false, isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });

    preferences = await SharedPreferences.getInstance();
    isLoggedIn = await googleSignIn.isSignedIn();

    if (isLoggedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }

    setState(() {
      loading = false;
    });
  }

  Future handleSignIn() async {
    preferences = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
    });

    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final UserCredential authResult =
        await firebaseAuth.signInWithCredential(credential);
    final User firebaseUser = authResult.user;
    if (firebaseUser != null) {
      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection("users")
          .where("id", isEqualTo: firebaseUser.uid)
          .get();
      final List<DocumentSnapshot> documents = result.docs;
      if (documents.length == 0) {
        //  insert the user to our collection
        FirebaseFirestore.instance
            .collection("users")
            .doc(firebaseUser.uid)
            .set({
          "id" : firebaseUser.uid,
          "username": firebaseUser.displayName,
          "profilePicture": firebaseUser.photoURL
        });

        await preferences.setString("id", firebaseUser.uid);
        await preferences.setString("username", firebaseUser.displayName);
        await preferences.setString("photoUrl", firebaseUser.photoURL);
      }else{
        await preferences.setString("id", documents[0]['id']);
        await preferences.setString("username", documents[0]['username']);
        await preferences.setString("photoUrl", documents[0]['photoUrl']);
      }

      Fluttertoast.showToast(msg: "Login Successful");
      setState(() {
        loading = false;
      });
      Navigator.pushReplacement(

          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
  Fluttertoast.showToast(msg: "Login failed");
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        backgroundColor: Colors.white,

        centerTitle: true,

        title: new Text(

          "Login",

          style: TextStyle(color: Colors.red.shade900),

        ),

      ),

      body: Stack(

        children: <Widget>[

          Visibility(

              visible: loading ?? true,

              child: Center(

                child: Container(

                  alignment: Alignment.center,

                  color: Colors.white.withOpacity(0.9),

                  child: CircularProgressIndicator(

                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),

                  ),

                ),

              ))

        ],

      ),

      bottomNavigationBar: Container(

        child: Padding(

          padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0, bottom: 8.0),

          child: TextButton(
              //style: ButtonStyle(foregroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) => Colors.red)),
              onPressed: () {

                handleSignIn();

              },

              child: Text(

                "Sign in / Sign up with google",

                style: TextStyle(color: Colors.red),

              )),

        ),

      ),

    );

  }
}