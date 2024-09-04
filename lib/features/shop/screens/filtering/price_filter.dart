import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';

class PriceFilter extends StatefulWidget {
  const PriceFilter({Key? key}) : super(key: key);

  @override
  _PriceFilterState createState() => _PriceFilterState();
}

class _PriceFilterState extends State<PriceFilter> {
  // Define the range for the slider
  final RxDouble _minPrice = 0.0.obs;
  final RxDouble _maxPrice = 10000.0.obs;

  // Define the selected range
  final Rx<RangeValues> _selectedRange = const RangeValues(0, 10000).obs;

  // Controllers for the TextFields
  final TextEditingController _startPriceController = TextEditingController();
  final TextEditingController _endPriceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the TextField controllers with the current slider values
    _startPriceController.text = _selectedRange.value.start.round().toString();
    _endPriceController.text = _selectedRange.value.end.round().toString();
  }

  @override
  void dispose() {
    // Dispose of the controllers when the widget is disposed
    _startPriceController.dispose();
    _endPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      resizeToAvoidBottomInset: true, // Adjust for the keyboard
      backgroundColor: isDark ? TColors.kBlack : TColors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Price(DA)"),
                  Icon(Icons.cancel),
                ],
              ),
              Obx(() {
                return SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 0.05, // Set the desired thickness here
                    activeTrackColor: TColors.primaryColor, // Set active track color
                    inactiveTrackColor: TColors.primaryColor.withOpacity(0.3), // Set inactive track color
                    thumbColor: TColors.primaryColor, // Set thumb color
                    overlayColor: TColors.primaryColor.withOpacity(0.2), // Set overlay color
                  ),
                  child: RangeSlider(
                    values: _selectedRange.value,
                    min: _minPrice.value,
                    max: _maxPrice.value,
                    divisions: 1000,
                    labels: RangeLabels(
                      _selectedRange.value.start.round().toString(),
                      _selectedRange.value.end.round().toString(),
                    ),
                    onChanged: (RangeValues values) {
                      _selectedRange.value = values;
                      _startPriceController.text = values.start.round().toString();
                      _endPriceController.text = values.end.round().toString();
                    },
                  ),
                );


              }),
              Row(
                children: [
                  // Starting Price
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("From"),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: TColors.primaryColor),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: TextField(
                            controller: _startPriceController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                              suffixText: "DA",
                              border: InputBorder.none,
                            ),
                            onSubmitted: (value) {
                              double startPrice = double.tryParse(value) ?? _minPrice.value;
                              if (startPrice < _minPrice.value) startPrice = _minPrice.value;
                              if (startPrice > _selectedRange.value.end) startPrice = _selectedRange.value.end;
                              _selectedRange.value = RangeValues(startPrice, _selectedRange.value.end);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16), // Space between the fields
                  // Finishing Price
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("To"),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: TColors.primaryColor),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: TextField(
                            controller: _endPriceController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                              suffixText: "DA",
                              border: InputBorder.none,
                            ),
                            onSubmitted: (value) {
                              double endPrice = double.tryParse(value) ?? _maxPrice.value;
                              if (endPrice > _maxPrice.value) endPrice = _maxPrice.value;
                              if (endPrice < _selectedRange.value.start) endPrice = _selectedRange.value.start;
                              _selectedRange.value = RangeValues(_selectedRange.value.start, endPrice);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context); // Cancel and go back
                      },
                      child: const Text("Cancel"),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Save the selected price range and go back
                        // You can add your saving logic here
                        Navigator.pop(context, _selectedRange.value);
                      },
                      child: const Text("Save"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
