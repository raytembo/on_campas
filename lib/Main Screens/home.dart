import 'package:flutter/material.dart';
import 'package:on_campus/Auth/login.dart';
import 'package:on_campus/components/sports_tile.dart';
import 'package:on_campus/components/news_tile.dart';
import 'package:on_campus/components/post_tile.dart';
import 'package:on_campus/others/posts.dart';
import 'package:on_campus/themes/global_color.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final news_stream =Supabase.instance.client.from('news').stream(primaryKey: ['id']);
  final post_stream =Supabase.instance.client.from('posts').stream(primaryKey: ['id']);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            "Socials",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: mainColor,
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
             const SizedBox(height: 20,),
             const Text("Latest",style:
                  TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: mainColor
                  ),
            ),
            StreamBuilder<List<Map<String, dynamic>>>(
              stream: news_stream,
              builder: (context, snapshot){
                if(!snapshot.hasData){
                  return const Center(child: CircularProgressIndicator(),);
                }
                final news = snapshot.data!;
                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: NewsTile(
                              postheadline: news[index]['headline'],
                              postimageurl: "",
                              readmore: "Read More"),
                        );
                      }),
                );
              },
            ),
            const SizedBox(height: 20,),
            const SportsTile(),
            const SizedBox(height: 20,),
            StreamBuilder<List<Map<String, dynamic>>>(
              stream: post_stream,
              builder: (context, snapshot){
                if(!snapshot.hasData){
                  return const Center(child: CircularProgressIndicator(),);
                }
                final posts = snapshot.data!;
                return SizedBox(
                  height: 380,
                  width: 380,
                  child: ListView.builder(
                      itemCount:2,
                      itemBuilder: (context, index){
                        return const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: PostTile(),
                        );
                      }),
                );
              },
            ),
           GestureDetector(
             onTap: (){
               Navigator.of(context).push(MaterialPageRoute(
                   builder: (context) => const PostPage()));
             },
             child: const Text(
                 "See More",
                 style: TextStyle(
                 color: mainColor,
                 fontWeight: FontWeight.bold
                 ),
             ),
           ),
          ],
        ),
      ),
    );
  }
}

