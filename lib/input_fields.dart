import 'package:flutter/material.dart';

class GenderDropdown extends StatelessWidget {
  final String gender;
  final ValueChanged<String?> onChanged;

  GenderDropdown({required this.gender, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: gender,
      onChanged: onChanged,
      items: ['Male', 'Female'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: InputDecoration(labelText: 'Gender'),
    );
  }
}

class HeightInput extends StatelessWidget {
  final double height;
  final String heightUnit;
  final ValueChanged<double> onHeightChanged;
  final ValueChanged<String?> onHeightUnitChanged;

  HeightInput({required this.height, required this.heightUnit, required this.onHeightChanged, required this.onHeightUnitChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            initialValue: height.toString(),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Height'),
            onChanged: (value) {
              onHeightChanged(double.parse(value));
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your height';
              }
              return null;
            },
          ),
        ),
        SizedBox(width: 10),
        DropdownButton<String>(
          value: heightUnit,
          onChanged: onHeightUnitChanged,
          items: ['cm', 'meter', 'foot'].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
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

  WeightInput({required this.weight, required this.weightUnit, required this.onWeightChanged, required this.onWeightUnitChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            initialValue: weight.toString(),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Weight'),
            onChanged: (value) {
              onWeightChanged(double.parse(value));
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your weight';
              }
              return null;
            },
          ),
        ),
        SizedBox(width: 10),
        DropdownButton<String>(
          value: weightUnit,
          onChanged: onWeightUnitChanged,
          items: ['kg', 'pounds'].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class AgeInput extends StatelessWidget {
  final int age;
  final ValueChanged<int> onChanged;

  AgeInput({required this.age, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: age.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Age'),
      onChanged: (value) {
        onChanged(int.parse(value));
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your age';
        }
        return null;
      },
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
      value: activityLevel,
      onChanged: onChanged,
      items: [
        DropdownMenuItem(
          value: 'Sedentary',
          child: Text('Sedentary (little or no exercise)'),
        ),
        DropdownMenuItem(
          value: 'Lightly active',
          child: Text('Lightly active (light exercise/sports 1-3 days/week)'),
        ),
        DropdownMenuItem(
          value: 'Moderately active',
          child: Text('Moderately active (moderate exercise/sports 3-5 days/week)'),
        ),
        DropdownMenuItem(
          value: 'Very active',
          child: Text('Very active (hard exercise/sports 6-7 days a week)'),
        ),
        DropdownMenuItem(
          value: 'Super active',
          child: Text('Super active (very hard exercise/physical job)'),
        ),
      ],
      decoration: InputDecoration(labelText: 'Activity Level'),
    );
  }
}
