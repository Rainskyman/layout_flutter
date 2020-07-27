import 'dart:math';

import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  final imgs;
  const Layout({Key key,this.imgs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.width * (2 / 3);
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border.symmetric(vertical: BorderSide(color: Colors.white))
      ),
      child: getLayout()
    );
  }

  Widget getLayout(){//由图片张数得到相应的布局
    switch(this.imgs.length){
      case 1:return one();
      case 2:return Random().nextBool()?two():two_2();
      case 3:return Random().nextBool()?three():three_2();//有多种的就随机
    }
    return one();
  }

  Widget square(src){//正方形
    return AspectRatio(
      aspectRatio: 1/1,
      child: Container(child: img(src),),
    );
  }
  Widget img(src){//图片
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Image.network(src,fit: BoxFit.cover),
    );
  }
  Widget spacing({direction='w'}){//分割线
    return direction=='h'?Container(height: 2,color: Colors.white):Container(width: 2,color: Colors.white);
  }

  Widget one(){//1布局
    return Container(color:Colors.red,child: img(imgs[0]),);
  }

  Widget two(){//2布局
    return Row(
      children: <Widget>[
        square(imgs[0]),
        spacing(),
        Expanded(
          child: Container(child: img(imgs[1]),),
        )
      ],
    );
  }
  Widget two_2(){//2.2布局
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(child: img(imgs[1]),),
        ),
        spacing(),
        square(imgs[0]),
      ],
    );
  }
  Widget three(){//3布局
    return Row(
      children: <Widget>[
        square(imgs[0]),
        spacing(),
        Expanded(
          child: Column(
            children: <Widget>[
              Expanded(
                child: img(imgs[1]),
              ),
              spacing(direction: 'h'),
              Expanded(
                child: img(imgs[2]),
              )
              //square(imgs[1]),square(imgs[2]),
            ],
          ),
        )
      ],
    );
  }
  Widget three_2(){//3.2布局
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(child: img(imgs[0]),)
        ),
        spacing(),
        Expanded(
          child: Container(child: img(imgs[1]),)
        ),
        spacing(),
        Expanded(
          child: Container(child: img(imgs[2]),)
        )
      ],
    );
  }
}
