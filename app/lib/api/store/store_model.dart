import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jio_fashion_hack/api/store/counter_model.dart';

class StoreModel {
  String id;
  late String name;
  late GeoPoint location;
  late List<CounterModel> counters;

  StoreModel({
    required this.id,
    required this.name,
    required this.location,
    required this.counters,
  });

  static Future<StoreModel?> fetchStore(String id) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('stores').doc(id).get();

      if (!snapshot.exists) {
        return null;
      }

      Map<String, dynamic> data = snapshot.data()!;

      List<CounterModel> counters = (data['counters'] as List<dynamic>)
          .map((e) => CounterModel(
              id: e['id'],
              brandName: e['brandName'],
              currentCount: e['currentCount'],
              totalCount: e['totalCount']))
          .toList();

      return StoreModel(
        id: snapshot.id,
        name: data['name'],
        location: data['location'],
        counters: counters,
      );
    } catch (error) {
      print('Could not retrieve store.');
      print(error);
      return null;
    }
  }

  int get numberOfCounters {
    return counters.length;
  }

  int get totalProducts {
    int value = counters.first.totalCount;
    counters.skip(1).forEach((element) {
      value += element.totalCount;
    });
    return value;
  }

  int get currentProducts {
    int value = counters.first.currentCount;
    counters.skip(1).forEach((element) {
      value += element.currentCount;
    });
    return value;
  }
}
