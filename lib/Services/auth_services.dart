import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  
  
  SignInWithGoogle() async{
    final _googlesignIn = GoogleSignIn(
    clientId: '858727164441-nfq6h357ki47tv7dnem04c0p6gqimfrl.apps.googleusercontent.com'
  );
    try {
      final GoogleSignInAccount? SignIn = await _googlesignIn.signIn();
      if(SignIn != null)
      {
        final GoogleSignInAuthentication googleSign = await SignIn.authentication;
        final AuthCredential auth = GoogleAuthProvider.credential(
          accessToken: googleSign.accessToken,
          idToken: googleSign.idToken
        );
        await _auth.signInWithCredential(auth);
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}