import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract class FirebaseService {
  bool get isSignedIn;
}

@LazySingleton(as: FirebaseService)
class FirebaseServiceImpl implements FirebaseService {
  FirebaseServiceImpl(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  @override
  bool get isSignedIn => _firebaseAuth.currentUser != null;
}
