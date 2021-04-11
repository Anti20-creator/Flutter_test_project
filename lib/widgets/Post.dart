import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  Post({this.img, this.creator, this.caption, this.likes, this.comments})
      : super(key: ObjectKey(img));

  final String img;
  final String creator;
  final String caption;
  final String likes;
  final String comments;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Column(
          children: [
            /*Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(7, 0, 0, 0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://scontent-vie1-1.cdninstagram.com/v/t51.2885-19/s150x150/140618278_446147656518800_7258687729872676543_n.jpg?_nc_ht=scontent-vie1-1.cdninstagram.com&_nc_ohc=_eQE5XlX35QAX8vLnyO&tp=1&oh=557fc1174795b91c91fce3fee225552f&oe=603FF3AD"),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(2, 0, 20, 0),
                  ),
                  Text("profileName", style: TextStyle(color: Colors.black)),
                  Spacer(flex: 4),
                  IconButton(
                      icon: Icon(Icons.more_vert_outlined, color: Colors.black),
                      onPressed: null)
                ],
              ),
            ),*/
            Container(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: NetworkImage(img),
                    ))),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                children: [
                  Text(
                    caption,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Spacer(),
                  IconButton(
                      icon: Icon(Icons.favorite_border, color: Colors.black),
                      onPressed: null),
                  Text(
                    likes,
                    style: TextStyle(color: Colors.black),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
                  IconButton(
                      icon: Icon(
                        Icons.comment,
                        color: Colors.black,
                      ),
                      onPressed: null),
                  Text(
                    comments,
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                creator,
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ));
  }
}
