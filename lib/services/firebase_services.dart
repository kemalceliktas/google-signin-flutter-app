import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_first_app/provider/user_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseServices {

  final _auth = FirebaseAuth.instance;
  final _googleSingIn = GoogleSignIn(
    scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
  );

  signInWithGoogle() async {
   
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSingIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
         UserCredential userCredential =
          await _auth.signInWithCredential(authCredential);
          User? user = userCredential.user;
            if(userCredential.additionalUserInfo!.isNewUser){
            await  FirebaseFirestore.instance.collection("usersData").doc(user!.uid).set({
      "userName":user.displayName,
      "userEmail":user.email,
      "userImage":user.photoURL,
      
    });
            }

     


      }
    }on FirebaseAuthException catch (e){
      print(e.message);
      throw e;
    } 
    catch (e) {
      print(e.toString());
    }
  }

  signOut() async {
    await _auth.signOut();
    await _googleSingIn.signOut();
  }
}
