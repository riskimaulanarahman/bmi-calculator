import 'package:bmi/constants/constant.dart';
import 'package:bmi/views/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({Key? key}) : super(key: key);

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 100;
  int weight = 60;
  int age = 20;

  double calculateBmi() {
    double heightInMeter = height / 100;
    final h = (heightInMeter * heightInMeter);
    final bmi = weight / h;

    return bmi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff0A0E21),
        appBar: AppBar(
          title: const Text("BMI Calculator PINDAY.co.id"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: const [
                  Expanded(
                    child: BmiCard(
                      child: GenderIconText(
                        icon: Icons.male,
                        title: 'Male',
                        color: Colors.teal,
                      ),
                    ),
                  ),
                  Expanded(
                    child: BmiCard(
                      child: GenderIconText(
                        icon: Icons.female,
                        title: 'Female',
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BmiCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Height",
                      style: labelTextStyle!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "$height",
                          style: numberTextStyle,
                        ),
                        Text(
                          "cm",
                          style: labelTextStyle,
                        ),
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 80,
                      max: 200,
                      thumbColor: Colors.red,
                      activeColor: Colors.white,
                      onChanged: (value) {
                        height = value.toInt();
                        setState(() {});
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: BmiCard(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "WEIGHT",
                              style: labelTextStyle,
                            ),
                            Text(
                              "$weight",
                              style: numberTextStyle,
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RawMaterialButton(
                                  onPressed: () {
                                    weight += 1;
                                    setState(() {});
                                    ;
                                  },
                                  elevation: 0,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  shape: CircleBorder(),
                                  fillColor: Color(0xff212747),
                                  constraints: BoxConstraints.tightFor(
                                    width: 56,
                                    height: 56,
                                  ),
                                ),
                                SizedBox(width: 10),
                                RawMaterialButton(
                                  onPressed: () {
                                    weight -= 1;
                                    setState(() {});
                                  },
                                  elevation: 0,
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                  shape: CircleBorder(),
                                  fillColor: Color(0xff212747),
                                  constraints: BoxConstraints.tightFor(
                                    width: 56,
                                    height: 56,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: BmiCard(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "AGE",
                              style: labelTextStyle,
                            ),
                            Text(
                              "$age",
                              style: numberTextStyle,
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RawMaterialButton(
                                  onPressed: () {
                                    age += 1;
                                    setState(() {});
                                  },
                                  elevation: 0,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  shape: CircleBorder(),
                                  fillColor: Color(0xff212747),
                                  constraints: BoxConstraints.tightFor(
                                    width: 56,
                                    height: 56,
                                  ),
                                ),
                                SizedBox(width: 10),
                                RawMaterialButton(
                                  onPressed: () {
                                    age -= 1;
                                    setState(() {});
                                  },
                                  elevation: 0,
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                  shape: CircleBorder(),
                                  fillColor: Color(0xff212747),
                                  constraints: BoxConstraints.tightFor(
                                    width: 56,
                                    height: 56,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                print(calculateBmi());
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) {
                      return BmiResultScreen(
                        bmi: calculateBmi(),
                      );
                    }),
                  ),
                );
              },
              child: Container(
                height: 80,
                color: Color(0Xffec3c66),
                child: const Center(
                  child: Text(
                    "Hitung BMI",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
    required this.borderColor,
  }) : super(key: key);

  final Widget? child;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff272A4E),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: borderColor,
        ),
      ),
      margin: const EdgeInsets.all(15),
      child: child,
    );
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: color,
          size: 80,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(title, style: labelTextStyle)
      ],
    );
  }
}
