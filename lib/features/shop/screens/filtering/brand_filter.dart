import 'package:flutter/material.dart';

class BrandFilter extends StatelessWidget {
  const BrandFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3, // Increased height for better UX
        width: double.infinity,
        padding: const EdgeInsets.all(16.0), // Increased padding for better spacing
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)), // Rounded corners
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 12),
            _buildFilterOptions(),
            const SizedBox(height: 16),
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
          "Brand",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        IconButton(
          icon: const Icon(Icons.cancel),
          onPressed: () => Navigator.pop(context), // Close the bottom sheet
        ),
      ],
    );
  }

  Widget _buildFilterOptions() {
    // Using a ListView to manage scrollable content more effectively
    return Expanded(
      child: ListView(
        children: List.generate(
          4, // Number of filter options
              (index) => _buildFilterOption("Brand $index"),
        ),
      ),
    );
  }

  Widget _buildFilterOption(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Checkbox(
          value: false,
          onChanged: (value) {
            // Implement onChanged functionality
          },
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
