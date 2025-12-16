import 'package:flutter/material.dart';

class MyName  extends StatelessWidget {
  const MyName ({super.key});

  @override
    Widget build(BuildContext context) {
    return Scaffold(body: myBody(),);
  }
Widget myBody(){
  return Container(
    padding: EdgeInsets.only(left: 20,right: 20),
    child: SafeArea(
        //padding: const EdgeInsets.all(30),
        child: ListView( 
         //crossAxisAlignment: CrossAxisAlignment.start,
         children: [
            item1(),
            item2(),
            item3(),
            item4(),
            item5(),
          ],
        ),
      ),
  );
  }
}
   Widget item1(){
    return SizedBox(
      width: 100,
      height: 100,
      child: Padding(padding: const EdgeInsets.all(10),
         child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(onPressed: ()=>{}, icon: Icon(Icons.notifications)),
              IconButton(onPressed: ()=>{}, icon: Icon(Icons.extension)),
              SizedBox()
            ],
          ),
      ),
    );
}
Widget item2(){
  return SizedBox(
    height: 130,
    child: Padding(padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome,", style: TextStyle(color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold,),),
            Text("Charlie", style: TextStyle(color: Colors.black, fontSize: 35, fontWeight: FontWeight.normal,),),
        ],
      )
    ),
  );
}
Widget item3(){
  return SizedBox(
    height: 140,
    child: Padding(padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
              hintText: 'Search',
            ),
          ),
        ],
      ),
    ),
  );
}
Widget item4(){
  return Padding(padding: const EdgeInsets.all(10),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Saved Places", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold,),)
      ],
    ),
  );
}
Widget item5(){
  return SizedBox(
    width: 100,
    child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        childAspectRatio: 3 / 2,
        physics: NeverScrollableScrollPhysics(),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,// 2 cột
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10), // bo tròn 10px
            child: Image.asset("assets/1.png", fit: BoxFit.cover),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10), // bo tròn 10px
            child: Image.asset("assets/2.png", fit: BoxFit.cover),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10), // bo tròn 10px
            child: Image.asset("assets/3.png", fit: BoxFit.cover),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10), // bo tròn 10px
            child: Image.asset("assets/4.png", fit: BoxFit.cover),
          ),
                    ClipRRect(
            borderRadius: BorderRadius.circular(10), // bo tròn 10px
            child: Image.asset("assets/4.png", fit: BoxFit.cover),
          ),
                    ClipRRect(
            borderRadius: BorderRadius.circular(10), // bo tròn 10px
            child: Image.asset("assets/4.png", fit: BoxFit.cover),
          ),
                    ClipRRect(
            borderRadius: BorderRadius.circular(10), // bo tròn 10px
            child: Image.asset("assets/4.png", fit: BoxFit.cover),
          ),
                    ClipRRect(
            borderRadius: BorderRadius.circular(10), // bo tròn 10px
            child: Image.asset("assets/4.png", fit: BoxFit.cover),
          ),
        ],
      ),
  );
} 