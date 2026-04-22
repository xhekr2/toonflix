import 'package:flutter/material.dart';
import 'package:webtoon_app/screens/detail_screen.dart';

class WebtoonWidget extends StatelessWidget {
  final String title, thumb, id;
  const WebtoonWidget({super.key, required this.title, required this.thumb, required this.id,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
        Navigator.push(context, MaterialPageRoute(builder: (context) {return DetailScreen(title: title,thumb: thumb,id: id,);},fullscreenDialog: true,));
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    offset: Offset(10, 10),
                    color: Colors.black.withAlpha(150),
                  )
                ],
              ),
              width: 250,
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                thumb,
                headers: const {
                  'User-Agent':
                  'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36',
                  'Referer': 'https://comic.naver.com',
                },),
            ),
          ),
          SizedBox(height: 10,),
          Text(title, style: TextStyle(fontSize: 22,)),
        ],
      ),
    );
  }
}
