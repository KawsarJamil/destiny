import 'package:destiny/story_brain.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Destiny",
    debugShowCheckedModeBanner: false,
    home: Myhome(),
  ));
}

class Myhome extends StatefulWidget {
  const Myhome({Key? key}) : super(key: key);

  @override
  _MyhomeState createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  StoryBrain storyBrain = StoryBrain();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("images/background.png"),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    storyBrain.getstory().storyTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      storyBrain.nextStory(1);
                    });
                  },
                  child: Text(
                    storyBrain.getstory().choice1,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    // minimumSize: Size(double.infinity, 80),
                    padding: EdgeInsets.symmetric(
                      vertical: 24,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Visibility(
                visible: storyBrain.buttonShouldBeVisible(),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(2);
                      });
                    },
                    child: Text(
                      storyBrain.getstory().choice2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      //minimumSize: Size(double.infinity, 80),
                      padding: EdgeInsets.symmetric(
                        vertical: 24,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
