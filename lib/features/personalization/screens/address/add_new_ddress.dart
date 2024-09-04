import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/addresses_controller.dart';

class AddNewAddressScreen extends StatelessWidget {
  final bool isEdit;

  const AddNewAddressScreen({super.key, required this.isEdit});

  @override
  Widget build(BuildContext context) {
    // Bind the AddressesController
    final AddressesController controller = Get.put(AddressesController());

    // Load wilayas when the screen is opened
    controller.loadWilayas();

    return Scaffold(
      appBar: TAppBar(
        title: Text(
          isEdit ? 'Update Address' : 'Add New Address',
          style: const TextStyle(color: Colors.white),
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                // Name Fields
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.firstNameController,
                        decoration:
                            const InputDecoration(labelText: 'First name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter first name';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: TSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        controller: controller.lastNameController,
                        decoration:
                            const InputDecoration(labelText: 'Last name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter last name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),

                // Phone Number Fields
                TextFormField(
                  controller: controller.phoneController,
                  decoration: const InputDecoration(labelText: 'Phone number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.additionalPhoneController,
                  decoration: const InputDecoration(
                      labelText: 'Additional phone number'),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),

                // Address Field
                TextFormField(
                  controller: controller.addressController,
                  decoration: const InputDecoration(labelText: 'Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),

                // State Selector
                GestureDetector(
                  onTap: () => controller.showBottomSheet(context, true),
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() => Text(controller.selectedState.value,
                            style: const TextStyle(fontSize: 16))),
                        const Icon(Icons.arrow_drop_down, color: Colors.grey),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),

// City Selector
                GestureDetector(
                  onTap: () => controller.showBottomSheet(context, false),
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() => Text(controller.selectedCity.value,
                            style: const TextStyle(fontSize: 16))),
                        const Icon(Icons.arrow_drop_down, color: Colors.grey),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: TSizes.spaceBtwInputFields),
                // Save Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (controller.formKey.currentState?.validate() ??
                          false) {
                        // Perform save or update operation
                        Get.back();
                      }
                    },
                    child: Text(isEdit ? 'Update' : 'Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
