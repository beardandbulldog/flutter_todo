import 'package:flutter/material.dart';
import 'package:todo/homepage.dart';

class SlidingCardsView extends StatefulWidget {
  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.70,
      child: PageView(
        controller: pageController,
        children: <Widget>[
          SlidingCard(),
        ],
      ),
    );
  }
}

class SlidingCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(50.0,),
            boxShadow: [
              BoxShadow(
                color: Color(0x40A16A62),
                blurRadius: 40.0,
                spreadRadius: 0.0,
                offset: Offset(
                  0.0,
                  20.0,
                ),
              )
            ]
        ),
      margin: EdgeInsets.only(left: 12, top: 24, right: 12, bottom: 50),
      child:
        CardContent(),

    );
  }

}


class CardContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Material(
        type: MaterialType.card,
        borderRadius: BorderRadius.all(Radius.circular(25)),
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage(),),
              );
            },
          child: Column (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                      Padding(
                        padding: const EdgeInsets.only(left: 24, top: 12, right: 24, ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Hero(
                                  tag: 'dayCard',
                                  child: Text('Wednesday', style: Theme
                                    .of(context)
                                    .textTheme
                                    .headline4),
                              ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: Text('10|02', style: Theme
                                      .of(context)
                                      .textTheme
                                      .overline),
                                ),
                              ),
                            ]
                        ),
                      ),
                  Divider (color: Color(0x4D000000),),
                    Hero(
                        tag: 'dayCardBackground',
                        child: Material(
                          type: MaterialType.card,
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                          elevation: 0,
                                 child:
                                 Placeholder(),
                    ),
                    ),
                   Hero(
                     tag: 'addIcon',
                     child: Material(

                     //borderRadius: BorderRadius.only(bottomRight: ra bottomLeft: ,),
                     elevation: 4,

                     child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.add_circle,
                            color: Color(0xFF2D6567),
                            size:36.0,
                            semanticLabel: 'Text to announce in accessibility modes',
                          ),
                        ),

                      ],
                    ),
                   ),
    ),
                ]
          ),
        ),

    );
  }
}

