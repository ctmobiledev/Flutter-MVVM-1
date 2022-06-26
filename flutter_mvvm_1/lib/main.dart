// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/customer_view_model.dart';
import '../util/constants.dart';

void main() {
  runApp(const FlutterMvvmApp1());
}

class FlutterMvvmApp1 extends StatelessWidget {
  const FlutterMvvmApp1({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVVM 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeView(title: 'Flutter MVVM 1'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final customerVM = CustomerViewModel();

  // One controller for each TextField
  final txtCustomerName = TextEditingController();
  final txtCity = TextEditingController();
  final txtState = TextEditingController();
  final txtZipCode = TextEditingController();

  @override
  void initState() {
    super.initState();

    print(">>> customerVM = ${customerVM.toString()}");

    // Init the output fields; the customerVM symbol is already "live" at this
    // point and can access its 'customerModel' child.

    customerVM.customerModel.customerName = "---";
    customerVM.customerModel.city = "---";
    customerVM.customerModel.state = "---";
    customerVM.customerModel.zipCode = "---";
  }

  @override
  Widget build(BuildContext context) {
    print(">>> customerVM = ${customerVM.toString()}");

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        //
        // One ChangeNotifierProvider wraps the view UI controls. You must already
        // have added 'provider: ^6.0.3' as a new dependency in the pubspec.yaml file.
        // There's always exactly two arguments - 'create' which has an arrow function
        // for a viewModel symbol, and 'child' which returns the full UI layout.
        //
        // There MUST be a Container of type <someViewModel> which will have a single
        // 'builder' argument with three parameters - the context, a viewModel symbol
        // to be used as a handle for various properties and methods, and a child (in
        // this case, a "_" is fine).
        //
        body: ChangeNotifierProvider<CustomerViewModel>(
          create: (context) => customerVM,
          child: Consumer<CustomerViewModel>(builder: (context, customerVM, _) {
            //
            // IMPORTANT: MUST RETURN THE *WHOLE* LAYOUT HERE, AFTER 'return'
            // LET THE 'OUTER' WIDGET FROM THE LAYOUT IMMEDIATELY FOLLOW 'return'
            //
            return SingleChildScrollView(
              child: Center(
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 20.0, left: 30.0, right: 30.0, bottom: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        child: const Text(
                          'Enter customer information below.',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      TextField(
                        decoration:
                            const InputDecoration(hintText: ("Customer name")),
                        textCapitalization: TextCapitalization.words,
                        controller: txtCustomerName,
                        style: Constants.inputTextStyle,
                      ),
                      TextField(
                        decoration: const InputDecoration(hintText: ("City")),
                        textCapitalization: TextCapitalization.words,
                        controller: txtCity,
                        style: Constants.inputTextStyle,
                      ),
                      TextField(
                        decoration: const InputDecoration(hintText: ("State")),
                        textCapitalization: TextCapitalization.characters,
                        controller: txtState,
                        style: Constants.inputTextStyle,
                      ),
                      TextField(
                        decoration: const InputDecoration(hintText: ("Zip")),
                        keyboardType: TextInputType.number,
                        controller: txtZipCode,
                        style: Constants.inputTextStyle,
                      ),
                      Container(
                        width: 100.0,
                        height: 50.0,
                        margin: const EdgeInsets.only(top: 20.0),
                        child: ElevatedButton(
                          onPressed: () {
                            print(">>> submit");
                            customerVM.setCustomer(txtCustomerName.text,
                                txtCity.text, txtState.text, txtZipCode.text);
                          },
                          child: const Text('Submit',
                              style: TextStyle(fontSize: 20.0)),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 30.0, right: 30.0, bottom: 20.0),
                        child: Column(
                          children: [
                            Text(customerVM.customerModel.customerName,
                                style: Constants.outputTextStyle),
                            Text(customerVM.customerModel.city,
                                style: Constants.outputTextStyle),
                            Text(customerVM.customerModel.state,
                                style: Constants.outputTextStyle),
                            Text(customerVM.customerModel.zipCode,
                                style: Constants.outputTextStyle),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ));
  }
}
