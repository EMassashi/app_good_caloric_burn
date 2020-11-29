import 'package:app_good_caloric_burn/models/exercise.dart';
import 'package:app_good_caloric_burn/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  // collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('User');
  final CollectionReference exerciseCollection =
      FirebaseFirestore.instance.collection('Exercises');

  Future updateUserData(UserModel userData) async {
    return await userCollection.doc(uid).set({
      'altura': userData.altura,
      'idade': userData.idade,
      'nome': userData.nome,
      'peso': userData.peso,
      'sexo': userData.sexo,
      'lvlatividade': userData.lvlAtividade,
      'objetivo': userData.objetivo,
      'treinos': userData.treinos,
      'kcal': userData.kcal,
      'minutos': userData.time,
    });
  }

  // Exercise list from snapshot
  List<Exercise> _exerciseListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Exercise(
        name: doc.data()['name'] ?? '',
        time: doc.data()['time'].toDouble() ?? 1,
        calories: doc.data()['calories'].toDouble() ?? 0,
      );
    }).toList();
  }

  // userData from snapshot
  UserModel _userModelFromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      uid: uid,
      nome: snapshot.data()['nome'],
      altura: snapshot.data()['altura'],
      idade: snapshot.data()['idade'],
      lvlAtividade: snapshot.data()['lvlatividade'],
      peso: snapshot.data()['peso'],
      objetivo: snapshot.data()['objetivo'],
      sexo: snapshot.data()['sexo'],
      treinos: snapshot.data()['treinos'],
      kcal: snapshot.data()['kcal'],
      time: snapshot.data()['minutos'],
    );
  }

  // get Exercises stream
  Stream<List<Exercise>> get exercises {
    return exerciseCollection.snapshots().map(_exerciseListFromSnapshot);
  }

  // get user doc stream
  Stream<UserModel> get userData {
    return userCollection.doc(uid).snapshots().map(_userModelFromSnapshot);
  }
}
