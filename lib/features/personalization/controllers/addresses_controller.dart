import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/services/address_service.dart';
import '../models/states_cities_model.dart';


class AddressesController extends GetxController {
  static AddressesController get instance => Get.find();

  /// Controllers for the form fields
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final additionalPhoneController = TextEditingController();
  final addressController = TextEditingController();

  // Selected state and city
  var selectedState = 'Select State'.obs;
  var selectedCity = 'Select City'.obs;

  // Key for the form validation
  final formKey = GlobalKey<FormState>();

  // Store loaded wilayas and communes
  List<Wilaya> wilayas = [];
  List<Commune> communes = [];

  // Method to load wilayas
  Future<void> loadWilayas() async {
    wilayas = await AddressService.loadWilayas();
    update(); // Notify listeners
  }

  // Method to show the bottom sheet for city/state selection
  void showBottomSheet(BuildContext context, bool isState) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: isState ? wilayas.length : communes.length,
                  itemBuilder: (context, index) {
                    final item = isState ? wilayas[index].nameFr : communes[index].nameFr;
                    return ListTile(
                      title: Text(item),
                      onTap: () {
                        if (isState) {
                          selectedState.value = wilayas[index].nameFr;
                          communes = wilayas[index].communes; // Update communes for selected state
                          selectedCity.value = 'Select City'; // Reset city selection
                        } else {
                          selectedCity.value = communes[index].nameFr;
                        }
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    additionalPhoneController.dispose();
    addressController.dispose();
    super.onClose();
  }
}
