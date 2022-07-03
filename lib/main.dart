import 'package:flutter/material.dart';

import 'model/question.dart';

void main() {
  runApp(new MaterialApp(home: Quizapp(),));
}

class Quizapp extends StatefulWidget {
  const Quizapp({Key? key}) : super(key: key);

  @override
  State<Quizapp> createState() => _QuizappState();
}

class _QuizappState extends State<Quizapp> {
  int i=0;
  List q=[
    Question.name("The Chicago Bulls won six championship in the 1990's.",true),
    Question.name("Peter Guber is the current owner of the Golden State Warriors.", true),
    Question.name("The Golden State Warriors get in 1940.", false),
    Question.name("Los Angeles Laker hold 17 NBA championships.", true),
    Question.name("LeBron James is the highest paid player of 2021.", true),
    Question.name("LeBron James won the first MVP award.", false),
    Question.name("Manute Bol was the tallest player in NBA history.", true),
    Question.name("Tyrone \"Muggsy\" Bogues was the shortest player in NBA history.", true),
    Question.name("Dwight Howard holds the records for most \"slam duncks\" in the NBA.", true),
    Question.name("Chicago Bulls hold 10 NBA Championships.", false),
    Question.name("There are 30 teams in NBA.", true),
    Question.name("Jeremy Lin scored 89 points with the New York Knicks in their first three starts in early 2021.", true),
    Question.name("Ricky Rubio made his NBA debut in 2011.",true),
    Question.name("Micheal Jordan made his NBA debut in 1984.", true),
    Question.name("The first NBA all-star game played in 1951.", true),
    Question.name("The NBA established in 1930", true),
    Question.name("Chicago Bulls was the first team to join the NBA.", false),
    Question.name("Shaquille O'Neal currently holds his doctarate.", true),
    Question.name("James Wiseman is the youngest player to play in the NBA", true),
    Question.name("A jump shot worth 2-points", false),
    Question.name("The Minneapolis Lakers was the original name of the Los Angeles Lakers.", true),
    Question.name("Tacko Fall is the tallest defensive player in the NBA.", true)

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NBA",style: TextStyle(
          color: Colors.red.shade900,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w900
        ),),
        centerTitle: true,
        backgroundColor: Colors.blue.shade800,

      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Center(
                child: Image.asset("images/logo.png",
                width: 500,
                height: 180,
                repeat: ImageRepeat.repeat,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(14.4),
                  border: Border.all(color: Colors.blue.shade800, style: BorderStyle.solid)
                ),
                height: 120.0,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child:Text(q[i].qt,style:
                      TextStyle(
                        fontSize: 18,
                        color: Colors.red.shade900,
                        
                      ),) ,
                  ),

                )

              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(onPressed: ()=> check(true),
                  icon: Icon(Icons.check_circle,size: 20,),
                  label: Text("True"),

                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue.shade900,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic
                    )
                  )
                ),
                ElevatedButton.icon(onPressed: ()=> check(false),
                  icon: Icon(Icons.cancel,size: 20,),
                  label: Text("False"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue.shade900,
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic
                        )
                    )
                ),
                ElevatedButton.icon(onPressed: ()=> next(),
                  icon: Icon(Icons.arrow_forward,size: 28,),
                  label: Text(""),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue.shade900,
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic
                        )
                    )

                )
              ],
            ),


            Spacer(),
          ],
        ),
      ),
    );
  }

  check(bool u) {
    if(u==q[i].k){
      final snackBar=SnackBar(
          content: Text("Correct!!",style: TextStyle(color: Colors.white),)
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else
      {
        final snackBar=SnackBar(
          content: Text("Incorrect!!",style: TextStyle(color: Colors.white),)
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
  }

  next() {
    setState(() {
      i=(i+1)%q.length;
    });
  }
}

