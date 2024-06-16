import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  const PostTile({super.key});

  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 150,
        width: 350,
        color: Colors.grey,
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(children: [
                  CircleAvatar(
                    child: Icon(Icons.account_circle_sharp),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left:8.0),
                    child: Text("username"),
                  )
                ],),
                 Icon(Icons.more_horiz)
              ],),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(right: 200.0),
                child: Text("This is a Post",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Row(children:[
                    Icon(Icons.favorite_border),
                    SizedBox(width: 10,),
                    Text("0"),
                    SizedBox(width: 10,),
                    Icon(Icons.comment),
                    SizedBox(width: 10,),
                    Text("0"),
                    SizedBox(width: 10,),
                    Icon(Icons.repeat),
                    SizedBox(width: 10,),
                    Text("0"),
                    SizedBox(width: 10,),
                  ]),
                  SizedBox(width:60,),
                  Text("Category")

                ],
              ),
            ],),
        ),
      
      ),
    );
  }
}
