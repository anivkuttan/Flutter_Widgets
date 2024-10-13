class CheckboxFormFieldExample extends StatefulWidget {
  const CheckboxFormFieldExample({super.key});

  @override
  State createState() => _CheckboxFormFieldExampleState();
}

class _CheckboxFormFieldExampleState extends State<CheckboxFormFieldExample> {
  bool _isChecked = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkbox FormField')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              FormField<bool>(
                initialValue: _isChecked,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == false) {
                    return 'Please check the box';
                  }
                  return null;
                },
                builder: (FormFieldState<bool> state) {
                  return Column(
                    children: [
                      CheckboxListTile(
                        title: const Text('Accept Terms and Conditions'),
                        value: _isChecked,
                        onChanged: (value) {
                          setState(() {
                            _isChecked = value!;
                            state.didChange(value);
                          });
                        },
                      ),
                      if (state.hasError)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            state.errorText!,
                            style: const TextStyle(color: Colors.red),
                          ),
                        )
                    ],
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
                child: const Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
