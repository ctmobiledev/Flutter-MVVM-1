// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import '../models/customer_model.dart';

class CustomerViewModel extends ChangeNotifier {
  CustomerModel customerModel = CustomerModel();

  void setCustomer(
      String pCustomerName, String pCity, String pState, String pZipCode) {
    //
    print(">>> setCustomer() fired");

    customerModel.customerName = pCustomerName;
    customerModel.city = pCity;
    customerModel.state = pState;
    customerModel.zipCode = pZipCode;

    notifyListeners(); // same as setState(), triggers update to UI
  }
}
