import 'package:flutter/material.dart';
import 'suggestions_page.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String gender = 'Male';
  double height = 170;
  double weight = 70;
  int age = 25;
  String heightUnit = 'cm';
  String weightUnit = 'kg';
  String activityLevel = 'Sedentary';
  double calories = 0.0;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Calorie Calculator',style: TextStyle(fontWeight: FontWeight.bold),)),
          backgroundColor: Colors.teal,
        ),
        body: Container(
          padding: EdgeInsets.all(8),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                  child: GenderDropdown(
                    gender: gender,
                    onChanged: (String? newValue) {
                      setState(() {
                        gender = newValue!;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: HeightInput(
                    height: height,
                    heightUnit: heightUnit,
                    onHeightChanged: (double newValue) {
                      setState(() {
                        height = newValue;
                      });
                    },
                    onHeightUnitChanged: (String? newValue) {
                      setState(() {
                        heightUnit = newValue!;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: WeightInput(
                    weight: weight,
                    weightUnit: weightUnit,
                    onWeightChanged: (double newValue) {
                      setState(() {
                        weight = newValue;
                      });
                    },
                    onWeightUnitChanged: (String? newValue) {
                      setState(() {
                        weightUnit = newValue!;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    initialValue: age.toString(),
                    decoration: InputDecoration(labelText: 'Age'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        age = int.tryParse(value) ?? age;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ActivityLevelDropdown(
                    activityLevel: activityLevel,
                    onChanged: (String? newValue) {
                      setState(() {
                        activityLevel = newValue!;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: _calculateCalories,
                    child: Text('Calculate'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Calories required per day: ${calories.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: calories > 0
                        ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SuggestionsPage(calories: calories),
                        ),
                      );
                    }
                        : null,
                    child: Text('Click for more suggestions'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      disabledBackgroundColor: Colors.blueGrey.shade100,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _calculateCalories() {
    // Calculate BMR based on gender, age, height, and weight
    double bmr;
    if (gender == 'Male') {
      bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
    } else {
      bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
    }

    // Adjust BMR based on activity level
    switch (activityLevel) {
      case 'Sedentary':
        calories = bmr * 1.2;
        break;
      case 'Lightly active':
        calories = bmr * 1.375;
        break;
      case 'Moderately active':
        calories = bmr * 1.55;
        break;
      case 'Very active':
        calories = bmr * 1.725;
        break;
      case 'Super active':
        calories = bmr * 1.9;
        break;
    }

    setState(() {});
  }
}

class GenderDropdown extends StatelessWidget {
  final String gender;
  final ValueChanged<String?> onChanged;

  GenderDropdown({required this.gender, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: gender,
      onChanged: onChanged,
      items: [
        DropdownMenuItem(
          value: 'Male',
          child: Text('Male'),
        ),
        DropdownMenuItem(
          value: 'Female',
          child: Text('Female'),
        ),
      ],
      decoration: InputDecoration(labelText: 'Gender'),
    );
  }
}

class HeightInput extends StatelessWidget {
  final double height;
  final String heightUnit;
  final ValueChanged<double> onHeightChanged;
  final ValueChanged<String?> onHeightUnitChanged;

  HeightInput({
    required this.height,
    required this.heightUnit,
    required this.onHeightChanged,
    required this.onHeightUnitChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            initialValue: height.toString(),
            decoration: InputDecoration(labelText: 'Height'),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              onHeightChanged(double.tryParse(value) ?? height);
            },
          ),
        ),
        SizedBox(width: 10),
        DropdownButton<String>(
          value: heightUnit,
          onChanged: onHeightUnitChanged,
          items: [
            DropdownMenuItem(
              value: 'cm',
              child: Text('cm'),
            ),
            DropdownMenuItem(
              value: 'meter',
              child: Text('meter'),
            ),
            DropdownMenuItem(
              value: 'foot',
              child: Text('foot'),
            ),
          ],
        ),
      ],
    );
  }
}

class WeightInput extends StatelessWidget {
  final double weight;
  final String weightUnit;
  final ValueChanged<double> onWeightChanged;
  final ValueChanged<String?> onWeightUnitChanged;

  WeightInput({
    required this.weight,
    required this.weightUnit,
    required this.onWeightChanged,
    required this.onWeightUnitChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            initialValue: weight.toString(),
            decoration: InputDecoration(labelText: 'Weight'),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              onWeightChanged(double.tryParse(value) ?? weight);
            },
          ),
        ),
        SizedBox(width: 10),
        DropdownButton<String>(
          value: weightUnit,
          onChanged: onWeightUnitChanged,
          items: [
            DropdownMenuItem(
              value: 'kg',
              child: Text('kg'),
            ),
            DropdownMenuItem(
              value: 'pounds',
              child: Text('pounds'),
            ),
          ],
        ),
      ],
    );
  }
}

class ActivityLevelDropdown extends StatelessWidget {
  final String activityLevel;
  final ValueChanged<String?> onChanged;

  ActivityLevelDropdown({required this.activityLevel, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      value: activityLevel,
      onChanged: onChanged,
      items: [
        DropdownMenuItem(
          value: 'Sedentary',
          child: Text(
            '(a) Sedentary (little or no exercise)',
            overflow: TextOverflow.ellipsis,
          ),
        ),
        DropdownMenuItem(
          value: 'Lightly active',
          child: Text(
            '(b) Lightly active (light exercise/ \n sports 1-3 days/week)',
            overflow: TextOverflow.ellipsis,
          ),
        ),
        DropdownMenuItem(
          value: 'Moderately active',
          child: Text(
            '(c) Moderately active (moderate exercise \n 3-5 days/week)',
            overflow: TextOverflow.ellipsis,
          ),
        ),
        DropdownMenuItem(
          value: 'Very active',
          child: Text(
            '(d) Very active (hard exercise 6-7 \n days a week)',
            overflow: TextOverflow.ellipsis,
          ),
        ),
        DropdownMenuItem(
          value: 'Super active',
          child: Text(
            '(e) Super active (very hard exercise/ \n physical job)',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
      decoration: InputDecoration(labelText: 'Activity Level'),
    );
  }
}
