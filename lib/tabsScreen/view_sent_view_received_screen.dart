import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewSentViewReceivedScreen extends StatefulWidget {
  const ViewSentViewReceivedScreen({super.key});

  @override
  State<ViewSentViewReceivedScreen> createState() =>
      _ViewSentViewReceivedScreen();
}

class _ViewSentViewReceivedScreen extends State<ViewSentViewReceivedScreen> {
  bool isViewSentClicked = true;
  List<String> viewSentList = [];
  List<String> viewReceivedList = [];
  List viewList = [];

  getViewListKeys() async {
    if (isViewSentClicked) {
      // viewSentList
      var viewSentDocument = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserID)
          .collection("viewSent")
          .get();

      for (int i = 0; i < viewSentDocument.docs.length; i++) {
        viewSentList.add(viewSentDocument.docs[i].id);
      }
      print("viewSentList" + viewSentList.toString());
      getKeysDataFromUserCollection(viewSentList);
    } else {
      // viewReceived
      var viewReceivedDocument = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserID)
          .collection("viewReceived")
          .get();

      for (int i = 0; i < viewReceivedDocument.docs.length; i++) {
        viewReceivedList.add(viewReceivedDocument.docs[i].id);
      }

      print("viewReceivedList" + viewReceivedList.toString());

      getKeysDataFromUserCollection(viewReceivedList);
    }
  }

  getKeysDataFromUserCollection(List<String> keysList) async {
    var allUsersDocument =
        await FirebaseFirestore.instance.collection("users").get();

    for (int i = 0; i < allUsersDocument.docs.length; i++) {
      for (int k = 0; k < keysList.length; k++) {
        if (((allUsersDocument.docs[i].data() as dynamic)["uid"]) ==
            keysList[k]) {
          viewList.add(allUsersDocument.docs[i].data());
        }
      }
    }

    setState(() {
      viewList;
    });

    print("viewList" + viewList.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getViewListKeys();
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
                    viewSentList.clear();
                    viewSentList = [];
                    viewReceivedList.clear();
                    viewReceivedList = [];
                    viewList.clear();
                    viewList = [];

                    setState(() {
                      isViewSentClicked = true;
                    });
                    getViewListKeys();
                  },
                  child: Text(
                    "Profile i Viewed ",
                    style: TextStyle(
                        color: isViewSentClicked ? Colors.grey : Colors.white,
                        fontWeight: isViewSentClicked
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
                    viewSentList.clear();
                    viewSentList = [];
                    viewReceivedList.clear();
                    viewReceivedList = [];
                    viewList.clear();
                    viewList = [];

                    setState(() {
                      isViewSentClicked = false;
                    });
                    getViewListKeys();
                  },
                  child: Text(
                    "Viewed My Profile ",
                    style: TextStyle(
                        color: isViewSentClicked ? Colors.white : Colors.grey,
                        fontWeight: isViewSentClicked
                            ? FontWeight.bold
                            : FontWeight.normal,
                        fontSize: 14),
                  )),
            ],
          ),
          centerTitle: true,
        ),
        body: viewList.isEmpty
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
                children: List.generate(viewList.length, (index) {
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
                                      viewList[index]["imageProfile"]),
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
                                    viewList[index]['name'].toString() +
                                        " ◉ " +
                                        viewList[index]["age"].toString(),
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
                                          viewList[index]['city'].toString() +
                                              ", " +
                                              viewList[index]["country"]
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
