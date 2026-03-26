import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

abstract class FirebaseService {
  bool get isSignedIn;
  Future<UserCredential> signInWithGoogle();
  Future<UserCredential> signUpWithEmailAndPassword(
    String email,
    String password,
  );
  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<void> signOut();
}

@LazySingleton(as: FirebaseService)
class FirebaseServiceImpl implements FirebaseService {
  FirebaseServiceImpl(this._firebaseAuth, this._googleSignIn);

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  @override
  bool get isSignedIn => _firebaseAuth.currentUser != null;

  @override
  Future<UserCredential> signInWithGoogle() async {
    final googleUser = await _googleSignIn.authenticate();

    final googleAuth = googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    return await _firebaseAuth.signInWithCredential(credential);
  }

  @override
  Future<UserCredential> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signOut() {
    return Future.wait([_firebaseAuth.signOut(), _googleSignIn.signOut()]);
  }
}
