import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseFunctions {
  static CollectionReference<UserModel> createUsersCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
          fromFirestore: (snap, op) {
            return UserModel.fromJson(snap.data()!);
          },
          toFirestore: (model, option) {
            return model.toJson();
          },
        );
  }

  static CollectionReference<EventModel> createEventsCollection() {
    return FirebaseFirestore.instance
        .collection("Events")
        .withConverter<EventModel>(
          fromFirestore: (snap, op) {
            return EventModel.fromJson(snap.data()!);
          },
          toFirestore: (model, option) {
            return model.toJson();
          },
        );
  }

  static void addEvent(EventModel model) {
    var collection = createEventsCollection();
    var docRef = collection.doc();
    model.id = docRef.id;
    docRef.set(model);
  }

  static updateEvent(EventModel model) {
    var collection = createEventsCollection();

    collection.doc(model.id).update(model.toJson());
  }

  static Stream<QuerySnapshot<EventModel>> getfavEvents() {
    var collection = createEventsCollection();

    return collection
        .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where("isFavorite", isEqualTo: true)
        .snapshots();
  }

  static Stream<QuerySnapshot<EventModel>> getEvents(String id) {
    var collection = createEventsCollection();
    if (id == "all") {
      return collection
          .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots();
    }
    return collection
        .where("category", isEqualTo: id)
        .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }

  static void addUserToDatabase(UserModel user) {
    var collection = createUsersCollection();
    var docRef = collection.doc(user.id);
    docRef.set(user);
  }

  static Future<UserModel?> readUser(String userId) async {
    var collection = createUsersCollection();
    DocumentSnapshot<UserModel> model = await collection.doc(userId).get();

    return model.data();
  }

  static void login(
    String username,
    String password,
    Function onSuccess,
    Function onError,
  ) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: username,
        password: password,
      );
      onSuccess();
      // if (credential.user!.emailVerified) {
      //   // go to home

      //   onSuccess();
      // } else {
      //   onError("Please verify your mail , check mailbox ");
      // }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      onError(e.message);
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  static void register(
    String name,
    String email,
    String password,
    Function onSuccess,
    Function onError,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      credential.user!.sendEmailVerification();

      addUserToDatabase(
        UserModel(
          id: credential.user!.uid,
          name: name,
          email: email,
          createdAt: DateTime.now().toString(),
        ),
      );
      onSuccess();
    } on FirebaseAuthException catch (e) {
      onError(e.message);
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      onError(e.toString());
      print(e.toString());
    }
  }

  static void signInWithGoogle(Function onSuccess, Function onError) async {
    try {
      await GoogleSignIn.instance.initialize(
        clientId:
            "195288375780-k7t321lnf8t8i05lmk8vlp11p6os46gt.apps.googleusercontent.com",
      );
      final GoogleSignInAccount googleUser = await GoogleSignIn.instance
          .authenticate();
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      final user = userCredential.user;
      if (user == null) return;

      if (userCredential.additionalUserInfo!.isNewUser) {
        addUserToDatabase(
          UserModel(
            id: user.uid,
            name: user.displayName ?? '',
            email: user.email ?? '',
            createdAt: DateTime.now().toString(),
          ),
        );
      }

      onSuccess();
    } catch (e) {
      onError(e.toString());
    }
  }
}
