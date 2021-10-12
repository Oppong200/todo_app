import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/utils.dart';
import 'package:intl/intl.dart';

class CreateToDoView extends StatefulWidget {
  CreateToDoView({Key? key}) : super(key: key);

  @override
  State<CreateToDoView> createState() => _CreateToDoViewState();
}

class _CreateToDoViewState extends State<CreateToDoView> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _descController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();

  final TextEditingController _timeController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create New Todo"),
      ),
      body: Form(
        key:_formKey,
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            //has validation
            TextFormField(
              controller: _titleController,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                label: const Text('Title'),
                labelStyle: Theme.of(context).textTheme.bodyText1,
                hintText: 'Please enter a title',
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: customBlue),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a title';
                }
              },
            ),

            const SizedBox(
              height: 15,
            ),

            TextFormField(
              controller: _descController,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                label: const Text('Description'),
                labelStyle: Theme.of(context).textTheme.bodyText1,
                hintText: 'Please enter your description',
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: customBlue),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a description';
                }
              },
            ),
            //doesnt have validation
            // TextField(),

            const SizedBox(
              height: 15,
            ),

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(
                          const Duration(days: 365),
                        ),
                      ).then((value) {
                        setState(() {
                          _dateController.text = DateFormat.yMMMMd().format(
                            DateTime.now(),
                          );
                        });
                      });
                      //then((value) => _dateController.text=value!.toIso8601String());
                      /**
                       * then ((value){
                       *  setstate({
                       *  _dateController.text=
                       * DateFormat.yMMMd()
                       * })
                       * })
                       */
                    },
                    controller: _dateController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 1,
                    decoration: InputDecoration(
                      label: const Text('Select Date'),
                      labelStyle: Theme.of(context).textTheme.bodyText1,
                      hintText: 'Select Date',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: customBlue),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a date';
                      }
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    onTap: () {
                      showTimePicker(
                        context: context,
                        initialTime: const TimeOfDay(hour: 24, minute: 60),
                      ).then((value) {
                        setState(
                          () {
                            _timeController.text = value!.format(context);
                          },
                        );
                      });

                      // then((value) => _timeController.text=value!.toString());
                    },
                    controller: _timeController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 1,
                    decoration: InputDecoration(
                      label: const Text('Select Time'),
                      labelStyle: Theme.of(context).textTheme.bodyText1,
                      hintText: 'Select Time',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: customBlue),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a time';
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print(_titleController);
                  print(_descController);
                  print(_dateController);
                  print(_timeController);
                }
              },
              child: const Text(
                'Create Todo',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: customBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
