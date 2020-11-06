import 'package:app_good_caloric_burn/models/exercise.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('User');
  final CollectionReference exerciseCollection =
      FirebaseFirestore.instance.collection('Exercises');

  Future updateUserData(
      int altura, int idade, String nome, double peso, bool sexo) async {
    return await userCollection.doc(uid).set({
      'altura': altura,
      'idade': idade,
      'nome': nome,
      'peso': peso,
      'sexo': sexo,
    });
  }

/*  
Future <List<Map<dynamic, dynamic>>> getCollection() async{
List<DocumentSnapshot> templist;
List<Map<dynamic, dynamic>> list = new List();
CollectionReference collectionRef = Firestore.instance.collection("path");
QuerySnapshot collectionSnapshot = await collectionRef.getDocuments();

templist = collectionSnapshot.documents; // <--- ERROR

list = templist.map((DocumentSnapshot docSnapshot){
  return docSnapshot.data;
}).toList();

return list;
} 
*/

  // Exercise list from snapshot
  List<Exercise> _exerciseListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Exercise(
        name: doc.data()['name'] ?? '',
        time: doc.data()['time'].toDouble() ?? 1,
        calories: doc.data()['calories'].toDouble() ?? 0,
      );
    }).toList();
  }

  // get Exercises stream
  Stream<List<Exercise>> get exercises {
    return exerciseCollection.snapshots().map(_exerciseListFromSnapshot);
  }
}
