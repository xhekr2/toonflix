import 'package:flutter/material.dart';
import 'package:webtoon_app/models/webtoon_model.dart';
import 'package:webtoon_app/services/api_service.dart';
import 'package:webtoon_app/widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          'Webtoon',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder(future: webtoons, builder: (context, snapshot) {
        if(snapshot.hasData) {
          return Column(
            children: [SizedBox(height: 50,),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var webtoon = snapshot.data![index];
                    return WebtoonWidget(title: webtoon.title, thumb: webtoon.thumb, id: webtoon.id,);
                  },
                  separatorBuilder: (context, index) {return SizedBox(width: 40,);},
                ),
              ),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
