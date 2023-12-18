import 'package:firebase_auth/firebase_auth.dart';

String currentUserID = FirebaseAuth.instance.currentUser!.uid;
String? chosenAge;
String? chosenCountry;
String? chosenGender;
String fcmServerToken = "key=AAAAowGINGY:APA91bHjrVr3giU4YEnB3V-0n7gRyem_3waWliU1rzHkKM1Oux61MJnOnBv8nBHtJeoF8M4JbF58Spu5dO_kHY9WSZ4IU_V4-IjSJT6RdavqyWnkFDWie3TaoUhTAGsM4thjteoDZ2_t";
