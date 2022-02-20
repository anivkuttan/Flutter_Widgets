import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stepper'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stepper(
                currentStep: currentStep,
                steps: [
                  Step(
                    title: const Text('Step One'),
                    content: const Text('content One'),
                    isActive: currentStep == 0,
                    state: (currentStep == 0)
                        ? StepState.editing
                        : StepState.indexed,
                  ),
                  Step(
                    title: const Text('Step Two'),
                    content: const Text('content Two'),
                    isActive: currentStep == 1,
                    state: (currentStep == 1)
                        ? StepState.editing
                        : StepState.indexed,
                  ),
                  Step(
                    title: const Text('Step Three'),
                    content: const Text('content Three'),
                    isActive: currentStep == 2,
                    // currentStep and step index are same make editing icon
                    state: (currentStep == 2)
                        ? StepState.editing
                        : StepState.indexed,
                  ),
                ],
                onStepTapped: (newIndex) {
                  setState(() {
                    currentStep = newIndex;
                  });
                },
                onStepContinue: onStepContinue,
                onStepCancel: onStepCancel,
                controlsBuilder: (context, detail) {
                  return Row(children: [
                    ElevatedButton(
                      child: const Text('Next Step'),
                      onPressed: onStepContinue,
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      child: const Text('Back Step'),
                      onPressed: onStepCancel,
                    ),
                  ]);
                }),
          ],
        ),
      ),
    );
  }

  onStepContinue() {
    // checking currentStep not
    if (currentStep != 2) {
      setState(() {
        currentStep += 1;
      });
    } else if (currentStep == 2) {
      // ignore: avoid_print
      print('You reached Last Step ');
    }
  }

  onStepCancel() {
    if (currentStep != 0) {
      setState(() {
        currentStep -= 1;
      });
    } else if (currentStep == 0) {
      // ignore: avoid_print
      print('You reached First Step ');
    }
  }
}
