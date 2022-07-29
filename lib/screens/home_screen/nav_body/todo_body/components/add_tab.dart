import 'package:flutter/material.dart';
import '/screens/home_screen/nav_body/opportunity_body/opportunity_card.dart';

import '../../../../../models/todo.dart';

class AddTab extends StatefulWidget {
  const AddTab({Key? key}) : super(key: key);

  @override
  State<AddTab> createState() => _AddTabState();
}

class _AddTabState extends State<AddTab> {
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late DateTime startDate;
  late DateTime endDate;
  late String title;
  late String description;

  void saveForm() {
    final valid = _formKey.currentState!.validate();
    if (!valid) {
      return;
    }
    _formKey.currentState!.save();
    ToDO.addToDoList(
      OpportunityCard(
        title: title,
        description: description,
      ),
    );
    titleController.clear();
    descController.clear();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Added to ToDo\'s'),
      ),
    );
  }

  void selectDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2025, 12, 31),
    ).then((value) {
      if (value == null) {
        return;
      }
      startDate = value;
      print(startDate);
    });
  }

  @override
  dispose() {
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TodoInputField(
                      controller: titleController,
                      hint: 'Enter Title',
                      onSavedHandler: (value) {
                        title = value!;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TodoInputField(
                      controller: descController,
                      hint: 'Enter Description',
                      maxLines: 4,
                      inputType: TextInputType.multiline,
                      onSavedHandler: (value) {
                        description = value!;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                          child: TodoButton(
                            btnText: 'Start Date',
                            onDateSelected: selectDate,
                          ),
                        ),
                        const SizedBox(width: 32.0),
                        Expanded(
                          child: TodoButton(
                            btnText: 'End Date',
                            onDateSelected: selectDate,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: saveForm,
              child: Text('CREATE'),
            ),
          ],
        ),
      ),
    );
  }
}

class TodoButton extends StatelessWidget {
  const TodoButton({
    Key? key,
    required this.btnText,
    required this.onDateSelected,
  }) : super(key: key);

  final String btnText;
  final Function() onDateSelected;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onDateSelected,
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(btnText),
          const Icon(Icons.calendar_month),
        ],
      ),
    );
  }
}

class TodoInputField extends StatelessWidget {
  const TodoInputField({
    Key? key,
    required this.hint,
    this.maxLines = 1,
    this.inputType = TextInputType.text,
    required this.controller,
    required this.onSavedHandler,
  }) : super(key: key);

  final String hint;
  final int maxLines;
  final TextInputType inputType;
  final TextEditingController controller;
  final void Function(String?) onSavedHandler;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0.5, 0.1),
          ),
        ],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextFormField(
        // maxLength: 20,
        controller: controller,
        maxLines: maxLines,
        keyboardType: inputType,
        decoration: InputDecoration(
          // counter: SizedBox.shrink(),
          // constraints: BoxConstraints(maxHeight: 56),
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          isDense: true,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter value...';
          }
          return null;
        },
        onSaved: onSavedHandler,
      ),
    );
  }
}
