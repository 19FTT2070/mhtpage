import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mental_health_test_part/components/box.dart';
import 'package:mental_health_test_part/models/question.dart';

class MhtScreen extends StatefulWidget {
  const MhtScreen({Key? key,
    required this.questions,
  }) : super(key: key);

  final List<Question> questions;

  @override
  _MhtScreenState createState() => _MhtScreenState();
}

class _MhtScreenState extends State<MhtScreen> {
  int _currentIndex = 0;
  String _selectedOption = '';

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.questions[_currentIndex];
    return Scaffold(
      body: Box(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              SizedBox(height: 20),
              Text(
                'Question',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10),
              Text(
                currentQuestion.question,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              Spacer(),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final option = currentQuestion.options[index];
                    return OptionTile(
                      isSelected: option == _selectedOption,
                      option: option,
                      highlightOption: currentQuestion.highlightOption,
                      onTap: () {
                        setState(() {
                          _selectedOption = option;
                        });

                        if (option == currentQuestion.highlightOption)

                        Future.delayed(Duration(milliseconds: 200), () {
                          if (_currentIndex == widget.questions.length - 1)
                          setState(() {
                            _currentIndex++;
                            _selectedOption = '';
                          });
                        });
                      },
                    );
                  },
                  itemCount: currentQuestion.options.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
  class OptionTile extends StatelessWidget {
  const OptionTile({
  Key? key,
  required this.isSelected,
  required this.option,
  required this.highlightOption,
  required this.onTap,
  }) : super(key: key);

  final bool isSelected;
  final String option;
  final String highlightOption;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      child: ListTile(
        onTap: () => onTap(),
        title: Text(
          option,
          style: TextStyle(
            fontSize: 18,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Color get cardColor {
    if (!isSelected) return Colors.white;

    if (option == highlightOption) {
      return Colors.teal;
    }

    return Colors.teal;
  }
  }