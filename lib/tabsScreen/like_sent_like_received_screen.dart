import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LikeSentLikeReceivedScreen extends StatefulWidget {
  const LikeSentLikeReceivedScreen({super.key});

  @override
  State<LikeSentLikeReceivedScreen> createState() =>
      _LikeSentLikeReceivedScreen();
}

class _LikeSentLikeReceivedScreen extends State<LikeSentLikeReceivedScreen> {
  bool isLikeSentClicked = true;
  List<String> likeSentList = [];
  List<String> likeReceivedList = [];
  List likeList = [];

  getLikedListKeys() async {
    if (isLikeSentClicked) {
      // favoriteSent
      var likeSentDocument = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserID)
          .collection("likeSent")
          .get();

      for (int i = 0; i < likeSentDocument.docs.length; i++) {
        likeSentList.add(likeSentDocument.docs[i].id);
      }
      print("likeSentList" + likeSentList.toString());
      getKeysDataFromUserCollection(likeSentList);
    } else {
      // favoriteReceived
      var likeReceivedDocument = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserID)
          .collection("likeReceived")
          .get();

      for (int i = 0; i < likeReceivedDocument.docs.length; i++) {
        likeReceivedList.add(likeReceivedDocument.docs[i].id);
      }

      print("likeReceivedList" + likeReceivedList.toString());

      getKeysDataFromUserCollection(likeReceivedList);
    }
  }

  getKeysDataFromUserCollection(List<String> keysList) async {
    var allUsersDocument =
        await FirebaseFirestore.instance.collection("users").get();

    for (int i = 0; i < allUsersDocument.docs.length; i++) {
      for (int k = 0; k < keysList.length; k++) {
        if (((allUsersDocument.docs[i].data() as dynamic)["uid"]) ==
            keysList[k]) {
          likeList.add(allUsersDocument.docs[i].data());
        }
      }
    }

    setState(() {
      likeList;
    });

    print("likeList" + likeList.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLikedListKeys();
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
                  onPressed: () {
                    likeSentList.clear();
                    likeSentList = [];
                    likeReceivedList.clear();
                    likeReceivedList = [];
                    likeList.clear();
                    likeList = [];

                    setState(() {
                      isLikeSentClicked = true;
                    });
                    getLikedListKeys();
                  },
                  child: Text(
                    "My Likes ",
                    style: TextStyle(
                        color: isLikeSentClicked ? Colors.grey : Colors.white,
                        fontWeight: isLikeSentClicked
                            ? FontWeight.normal
                            : FontWeight.bold,
                        fontSize: 14),
                  )),
              const Text(
                "   |   ",
                style: TextStyle(color: Colors.grey),
              ),
              TextButton(
                  onPressed: () {
                    likeSentList.clear();
                    likeSentList = [];
                    likeReceivedList.clear();
                    likeReceivedList = [];
                    likeList.clear();
                    likeList = [];

                    setState(() {
                      isLikeSentClicked = false;
                    });
                    getLikedListKeys();
                  },
                  child: Text(
                    "Liked Me ",
                    style: TextStyle(
                        color: isLikeSentClicked ? Colors.white : Colors.grey,
                        fontWeight: isLikeSentClicked
                            ? FontWeight.bold
                            : FontWeight.normal,
                        fontSize: 14),
                  )),
            ],
          ),
          centerTitle: true,
        ),
        body: likeList.isEmpty
            ? Center(
                child: Icon(
                  Icons.person_off_sharp,
                  color: Colors.white,
                  size: 60.sp,
                ),
              )
            : GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(8.w),
                children: List.generate(likeList.length, (index) {
                  return GridTile(
                      child: Padding(
                    padding: EdgeInsets.all(2.0.w),
                    child: Card(
                      color: Colors.blue.shade200,
                      child: GestureDetector(
                        onTap: () {},
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      likeList[index]["imageProfile"]),
                                  fit: BoxFit.cover)),
                          child: Padding(
                            padding: EdgeInsets.all(8.0.w),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Spacer(),
                                  // name - age
                                  Text(
                                    likeList[index]['name'].toString() +
                                        " ◉ " +
                                        likeList[index]["age"].toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis),
                                    maxLines: 2,
                                  ),

                                  SizedBox(
                                    height: 5.h,
                                  ),

                                  // icon-city-country
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.grey,
                                        size: 16.sp,
                                      ),
                                      Expanded(
                                        child: Text(
                                          likeList[index]['city'].toString() +
                                              ", " +
                                              likeList[index]["country"]
                                                  .toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.sp,
                                              overflow: TextOverflow.ellipsis),
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
