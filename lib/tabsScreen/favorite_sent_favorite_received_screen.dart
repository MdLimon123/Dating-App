import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteSentFavoriteReceivedScreen extends StatefulWidget {
  const FavoriteSentFavoriteReceivedScreen({super.key});


  @override
  State<FavoriteSentFavoriteReceivedScreen> createState() => _FavoriteSentFavoriteReceivedScreenState();
}

class _FavoriteSentFavoriteReceivedScreenState extends State<FavoriteSentFavoriteReceivedScreen> {

  bool isFavoriteSentClicked = true;
  List<String> favoriteSentList = [];
  List<String> favoriteReceivedList = [];
  List favoriteList = [];

  
  getFavoriteListKeys()async{

    if(isFavoriteSentClicked){

      // favoriteSent
      var favoriteSentDocument = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserID)
          .collection("favoriteSent").get();

      for(int i=0; i<favoriteSentDocument.docs.length; i++){

        favoriteSentList.add(favoriteSentDocument.docs[i].id);


      }
      print("favoriteSentList" +favoriteSentList.toString());
      getKeysDataFromUserCollection(favoriteSentList);

    }
    else{

      // favoriteReceived
      var favoriteReceivedDocument = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserID)
          .collection("favoriteReceived").get();

      for(int i=0; i<favoriteReceivedDocument.docs.length; i++){

        favoriteReceivedList.add(favoriteReceivedDocument.docs[i].id);


      }

      print("favoriteReceivedList" +favoriteReceivedList.toString());

      getKeysDataFromUserCollection(favoriteReceivedList);


    }


  }

  getKeysDataFromUserCollection(List<String> keysList)async{

    var allUsersDocument = await FirebaseFirestore.instance.collection("users").get();

 for(int i=0; i<allUsersDocument.docs.length; i++) {
   for (int k = 0; k < keysList.length; k++) {
     if (((allUsersDocument.docs[i].data() as dynamic)["uid"]) == keysList[k]) {
       favoriteList.add(allUsersDocument.docs[i].data());
     }
   }


 }

    setState(() {
      favoriteList;
    });

    print("favoriteList" + favoriteList.toString());

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFavoriteListKeys();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: (){

                  favoriteSentList.clear();
                  favoriteSentList = [];
                  favoriteReceivedList.clear();
                  favoriteReceivedList= [];
                  favoriteList.clear();
                  favoriteList = [];

                  setState(() {
                    isFavoriteSentClicked = true;
                  });
                  getFavoriteListKeys();
                },
                child: Text("My Favorites ",
                style: TextStyle(color: isFavoriteSentClicked? Colors.grey :Colors.white,
                fontWeight: isFavoriteSentClicked? FontWeight.normal: FontWeight.bold,
                fontSize: 14),)),
            const Text("   |   ",
            style: TextStyle(color: Colors.grey),),
            TextButton(
                onPressed: (){

                  favoriteSentList.clear();
                  favoriteSentList = [];
                  favoriteReceivedList.clear();
                  favoriteReceivedList= [];
                  favoriteList.clear();
                  favoriteList = [];

                  setState(() {
                    isFavoriteSentClicked = false;
                  });
                  getFavoriteListKeys();
                },
                child: Text("I'm their Favorite ",
                  style: TextStyle(color: isFavoriteSentClicked? Colors.white: Colors.grey,
                      fontWeight: isFavoriteSentClicked? FontWeight.bold: FontWeight.normal,
                      fontSize: 14),)),
          ],
        ),
        centerTitle: true,
      ),
      body: favoriteList.isEmpty? Center(
    child: Icon(Icons.person_off_sharp, color: Colors.white, size: 60.sp,),
    ):GridView.count(
          crossAxisCount:2,
        padding: EdgeInsets.all(8.w),
        children: List.generate(favoriteList.length, (index){
          return GridTile(child: Padding(
            padding: EdgeInsets.all(2.0.w),
            child: Card(
              color: Colors.blue.shade200,
              child: GestureDetector(
                onTap: (){

                },
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image:NetworkImage(favoriteList[index]["imageProfile"]),
                    fit: BoxFit.cover)
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0.w),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const Spacer(),
                          // name - age
                          Text(favoriteList[index]['name'].toString() + " ◉ " + favoriteList[index]["age"].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis
                            ),
                            maxLines: 2,

                          ),

                          SizedBox(height: 5.h,),

                          // icon-city-country
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined,color: Colors.grey,
                                  size: 16.sp,),
                              Expanded(
                                child: Text(favoriteList[index]['city'].toString() + ", " + favoriteList[index]["country"].toString(),
                                  style: TextStyle(
                                      color: Colors.white,

                                      fontSize: 14.sp,
                                      overflow: TextOverflow.ellipsis

                                  ),
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ));
        }),
      ));
  }
}
