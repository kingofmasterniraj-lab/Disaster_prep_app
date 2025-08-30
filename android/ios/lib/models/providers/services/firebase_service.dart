import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ----------------------
  // AUTHENTICATION
  // ----------------------

  // Sign up with email & password
  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential credential =
          await _auth.createUserWithEmailAndPassword(
              email: email, password: password);
      return credential.user;
    } catch (e) {
      print('Sign Up Error: $e');
      return null;
    }
  }

  // Sign in with email & password
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential credential =
          await _auth.signInWithEmailAndPassword(
              email: email, password: password);
      return credential.user;
    } catch (e) {
      print('Sign In Error: $e');
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Current user
  User? get currentUser => _auth.currentUser;

  // ----------------------
  // FIRESTORE DATABASE
  // ----------------------

  // Save user data
  Future<void> saveUserData(String uid, Map<String, dynamic> data) async {
    await _firestore.collection('users').doc(uid).set(data);
  }

  // Get user data
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(String uid) async {
    return await _firestore.collection('users').doc(uid).get();
  }

  // Update user data
  Future<void> updateUserData(String uid, Map<String, dynamic> data) async {
    await _firestore.collection('users').doc(uid).update(data);
  }

  // ----------------------
  // QUIZ / SCORE DATA
  // ----------------------
  Future<void> saveScore(String uid, int score) async {
    await _firestore.collection('scores').doc(uid).set({'score': score});
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getScore(String uid) async {
    return await _firestore.collection('scores').doc(uid).get();
  }

  // ----------------------
  // MESSAGES / ALERTS
  // ----------------------
  Future<void> sendAlert(String title, String message) async {
    await _firestore.collection('alerts').add({
      'title': title,
      'message': message,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> alertStream() {
    return _firestore.collection('alerts').orderBy('timestamp').snapshots();
  }
}
