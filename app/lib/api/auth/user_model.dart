import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jio_fashion_hack/api/store/store_model.dart';

class UserModel {
  String id;
  late String firstName;
  late String lastName;
  late DocumentReference storeRef;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.storeRef,
  });

  String get fullName {
    return '$firstName $lastName';
  }

  String get storeId {
    return storeRef.id;
  }

  static Future<UserModel?> fetchUser(String id) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('users').doc(id).get();

      Map<String, dynamic> data = snapshot.data()!;

      return UserModel(
          id: snapshot.id,
          firstName: data['firstName'],
          lastName: data['lastName'],
          storeRef: data['storeRef']);
    } catch (error) {
      print('Could not retrieve user');
      print(error);
      return null;
    }
  }

  static Future<UserModel?> fetchCurrentUser() async {
    return fetchUser(FirebaseAuth.instance.currentUser!.uid);
  }

  Future<StoreModel?> getStore() {
    return StoreModel.fetchStore(storeId);
  }
}
