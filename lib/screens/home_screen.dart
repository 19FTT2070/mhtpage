import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_test_part/components/action_button.dart';
import 'package:mental_health_test_part/components/box.dart';
import 'package:mental_health_test_part/models/question.dart';
import 'package:mental_health_test_part/screens/mental_health_test_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
       child: Box(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Get to know yourself better',
            style: TextStyle(
              fontSize: 25,
            ),
            ),
            SizedBox(height: 50),
           StreamBuilder<QuerySnapshot>(
             stream: FirebaseFirestore.instance
                 .collection('questions')
                 .snapshots(),
             builder: (context, snapshot) {
               if (!snapshot.hasData) {
                 return Center(child: CircularProgressIndicator(),
                 );
               }

               final questionDocs = snapshot.data!.docs;

               final questions = questionDocs
                   .map((e) => Question.fromQueryDocumentSnapshot(e))
                   .toList();

               return ActionButton(
                 onTap: () {
                   Navigator.of(context).push(
                     MaterialPageRoute(
                       builder: (context) => MhtScreen(
                         questions: questions,
                       ),
                     ),
                   );
                 },
                 title: 'Next',
               );
             },
           ),
          ],
        ),
       ),
      ),
    );
  }
}