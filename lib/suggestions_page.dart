import 'package:flutter/material.dart';

class SuggestionsPage extends StatelessWidget {
  final double calories;

  SuggestionsPage({required this.calories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diet Suggestions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Your daily caloric intake is $calories calories.',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showDietOptions(context);
              },
              child: Text('Get Diet Plan'),
            ),
          ],
        ),
      ),
    );
  }

  void _showDietOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Diet Plan'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Do you want to gain or lose weight?'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _showDietPlan(context, 'gain');
                },
                child: Text('Gain Weight'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _showDietPlan(context, 'lose');
                },
                child: Text('Lose Weight'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDietPlan(BuildContext context, String goal) {
    String dietPlan;
    if (goal == 'gain') {
      dietPlan = 'Increase your intake of protein-rich foods like halal meat, chicken, beans, and nuts. Include calorie-dense foods like avocados, nuts, and whole grains. Drink shakes or smoothies with fruits and protein powder.';
    } else {
      dietPlan = 'Reduce your intake of high-calorie foods. Focus on eating more vegetables, fruits, and lean proteins like chicken and fish. Avoid sugary drinks and snacks. Drink plenty of water.';
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Diet Plan for ${goal == 'gain' ? 'Gaining Weight' : 'Losing Weight'}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(dietPlan),
              SizedBox(height: 20),
              Text(
                'Note: Follow the diet plans by consulting with nutritionists or doctors or trainers.',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
