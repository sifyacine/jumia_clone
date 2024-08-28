
import 'package:flutter/material.dart';

import '../../../../../utils/helpers/helper_functions.dart';

class LocationSelection extends StatefulWidget {
  const LocationSelection({Key? key}) : super(key: key);

  @override
  _LocationSelectionState createState() => _LocationSelectionState();
}

class _LocationSelectionState extends State<LocationSelection> {
  String selectedState = "option 1";
  String selectedCity = "option 3";


  void _showBottomSheet(BuildContext context, bool isState) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: List.generate(6, (index) {
                    return ListTile(
                      title: Text('Option ${index + 1}'),
                      onTap: () {
                        setState(() {
                          if (isState) {
                            selectedState = 'Option ${index + 1}';
                          } else {
                            selectedCity = 'Option ${index + 1}';
                          }
                        });
                        Navigator.pop(context);
                      },
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLocationContainer(String title, String selectedValue, bool isState) {

    return GestureDetector(
      onTap: () => _showBottomSheet(context, isState),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 6.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(selectedValue, style: const TextStyle(fontSize: 16)),
            const Icon(Icons.arrow_drop_down, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return Container(
      width: double.infinity,
      color: isDark? Colors.black : Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Delivery and Return Information",
          ),
          const Divider(),
          SizedBox(height: 16.0),
          Text(
            "select the location of the delivery",
          ),
          const SizedBox(height: 10),
          _buildLocationContainer('State', selectedState, true),
          _buildLocationContainer('City', selectedCity, false),
        ],
      ),
    );
  }
}
