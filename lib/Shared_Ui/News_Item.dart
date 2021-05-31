import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsappdio/Screens/wev_view.dart';

Widget newsItem(dynamic articles, context) {
  var height=MediaQuery.of(context).size.height;
  var width=MediaQuery.of(context).size.width;

  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WebViewScreen(articles["url"])));
    },
    child: Card(
      elevation: 30,
      child: Container(
        padding:  EdgeInsets.all(8.0),
        
        child: Row(
          children: [
            Container(
              height:height/6.7,
              width: height/6.7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(articles["urlToImage"] == null
                          ? "https://cdn.ready-market.com/101/06f9410c//Templates/pic/m/000_ok_671157243_thumb_889826365_thumb.jpg?v=ef0177ea"
                          : articles["urlToImage"]))),
            ),
            SizedBox(width: height/50),
            Container(
              padding: EdgeInsets.all(8),
              height: height/6.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(articles["title"],
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodyText1),
                    width: width*.5,
                  ),
                  Text(publishedTime(articles["publishedAt"]),
                      style: TextStyle(fontSize: 16, color: Colors.orange)),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

publishedTime(String articles) {
  Duration timeAgo = DateTime.now().difference(DateTime.parse(articles));
  String time = " ${timeAgo.inHours}:${timeAgo.inMinutes % 60}  hours ago";
  return time;
}
