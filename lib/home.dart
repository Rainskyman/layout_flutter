import 'dart:math';

import 'package:demo1/layout.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List imgs=[
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2785879835,2974355904&fm=11&gp=0.jpg',
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1841906735,3645667206&fm=26&gp=0.jpg',
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1255632579,1714788604&fm=26&gp=0.jpg',
    'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1930662946,3376692344&fm=26&gp=0.jpg',
    'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3385138246,1740869554&fm=26&gp=0.jpg',
    'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=32359593,2223379531&fm=26&gp=0.jpg',
    'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1570076121,1688910740&fm=26&gp=0.jpg',
    'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2723419866,1790299639&fm=26&gp=0.jpg',
    'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2937520943,363776159&fm=26&gp=0.jpg',
    'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2803988245,695884414&fm=26&gp=0.jpg',
    'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2755822797,2464578585&fm=11&gp=0.jpg',
    'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2525097005,2287712743&fm=26&gp=0.jpg',
  ];
  @override
  void initState() { 
    super.initState();
    this.split=generate_splite();
  }
  List split=[];
  List getImgs(split_index){//得到每一行布局的图片
    int startIndex=0;
    for (int i=0;i<split_index;i++) {
      startIndex+=split[i];
    }
    return imgs.sublist(startIndex,startIndex+split[split_index]);
  }
  List generate_splite(){//分割成每一行的图片张数
    int total=imgs.length;
    int sum=0;
    List arr=[];
    var random=Random();
    while(true){
      int num=random.nextInt(3)+1;
      if(sum+num<total){
        arr.add(num);
        sum+=num;
      }else{
        arr.add(total-sum);
        break;
      }
    }
    return arr;
  }
  @override
  Widget build(BuildContext context) {
    generate_splite();
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo'),
      ),
      body: ListView.builder(
        itemCount: split.length,
        itemBuilder: (BuildContext context, int index) {
        return Layout(imgs:getImgs(index));
        },
      ),
    );
  }
}