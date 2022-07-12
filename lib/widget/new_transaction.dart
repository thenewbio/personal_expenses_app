import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({Key? key, required this.addTx}) : super(key: key);

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;

  void submitData() {
    final enteredTitle = titleController.text;
    final amountText = double.parse(amountController.text);
    if (enteredTitle.isEmpty && amountText <= 0) {
      return;
    }
    addTx(enteredTitle, amountText);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
            padding: const EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                    labelText: 'Title', hintText: 'Title'),
                // onChanged: (value) {
                //   titleInput = value;
                // },
                onSubmitted: (_) => submitData,
              ),
              TextField(
                keyboardType: TextInputType.phone,
                controller: amountController,
                decoration:
                    InputDecoration(labelText: 'Anount', hintText: 'Amount'),
                // onChanged: (value) {
                //   amountInput = value;
                // },
                onSubmitted: (_) => submitData,
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                  color: Colors.purple,
                  onPressed: () {
                    submitData();
                    // print(titleInput);
                    // print(amountInput);
                    print(titleController.text);
                  },
                  child: Text('Add Transcation'))
            ])));
  }
}
