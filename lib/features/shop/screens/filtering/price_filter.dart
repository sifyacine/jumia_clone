import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';

class PriceFilter extends StatefulWidget {
  const PriceFilter({Key? key}) : super(key: key);

  @override
  _PriceFilterState createState() => _PriceFilterState();
}

class _PriceFilterState extends State<PriceFilter> {
  RangeValues _currentRangeValues = const RangeValues(0, 10000000);
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fromController.text = _currentRangeValues.start.toString();
    _toController.text = _currentRangeValues.end.toString();
  }

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.35, // Increased height for better UX
        width: double.infinity,
        padding: const EdgeInsets.all(16.0), // Increased padding for better spacing
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)), // Rounded corners
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 16.0),
            _buildRangeSlider(),
            const SizedBox(height: 16.0),
            _buildPriceInputs(),
            const SizedBox(height: 12),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Price (DA)",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        IconButton(
          icon: const Icon(Icons.cancel),
          onPressed: () => Navigator.pop(context), // Close the bottom sheet
        ),
      ],
    );
  }

  Widget _buildRangeSlider() {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 2.0,
        activeTrackColor: TColors.primaryColor,
        inactiveTrackColor: TColors.primaryColor.withOpacity(0.3),
        thumbColor: TColors.primaryColor,
        overlayColor: TColors.primaryColor.withOpacity(0.2),
      ),
      child: RangeSlider(
        values: _currentRangeValues,
        min: 0,
        max: 100000000,
        divisions: 1000,
        labels: RangeLabels(
          '${_currentRangeValues.start.round()} DA',
          '${_currentRangeValues.end.round()} DA',
        ),
        onChanged: (RangeValues values) {
          setState(() {
            _currentRangeValues = values;
            _fromController.text = values.start.round().toString();
            _toController.text = values.end.round().toString();
          });
        },
      ),
    );
  }

  Widget _buildPriceInputs() {
    return Row(
      children: [
        Expanded(
          child: _buildPriceInputField("From", _fromController, (value) {
            final double? newValue = double.tryParse(value);
            if (newValue != null && newValue <= _currentRangeValues.end) {
              setState(() {
                _currentRangeValues = RangeValues(newValue, _currentRangeValues.end);
              });
            }
          }),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildPriceInputField("To", _toController, (value) {
            final double? newValue = double.tryParse(value);
            if (newValue != null && newValue >= _currentRangeValues.start) {
              setState(() {
                _currentRangeValues = RangeValues(_currentRangeValues.start, newValue);
              });
            }
          }),
        ),
      ],
    );
  }

  Widget _buildPriceInputField(String label, TextEditingController controller, Function(String) onSubmitted) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            suffixText: "DA",
            border: OutlineInputBorder(),
          ),
          onSubmitted: onSubmitted,
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => Navigator.pop(context), // Cancel and go back
            child: const Text("Reset"),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              // Implement save functionality
            },
            child: const Text("Save"),
          ),
        ),
      ],
    );
  }
}
