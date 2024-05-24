import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../modules/web_view.dart';

Widget buildArticleItem(list,context) {
  return InkWell(
    onTap: (){
      // Navigator.push(context, MaterialPageRoute(builder: (context)=> WebViewScreen(url: list['url'],)));
    },
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: 120,
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image:list['urlToImage']==null? const AssetImage("assets/img.png"):NetworkImage('${list['urlToImage']}')as ImageProvider)),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                    '${list['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('${list['publishedAt']}',style: const TextStyle(color: Colors.grey),),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget buildDivider() {
  return Container(
    width: double.infinity,
    height: 1,
    color: Colors.blueGrey,
  );
}

Widget articleBuilder(list,context)=>ConditionalBuilder(
  condition: list.isNotEmpty,
  builder: (context) => ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) => buildArticleItem(list[index],context),
      separatorBuilder: (context, index) => buildDivider()),
  fallback: (context) => const Center(
    child: CircularProgressIndicator(),
  ),
);
