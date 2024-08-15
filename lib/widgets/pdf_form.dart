import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PdfFormWidget extends StatefulWidget {
  const PdfFormWidget({super.key});

  @override
  State<PdfFormWidget> createState() => _PdfFormState();
}

class _PdfFormState extends State<PdfFormWidget> {

  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _apartmentController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Form Data",
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 8),
          const Text(
            'Enter the address.',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 16),
          TextField(
            cursorColor: Colors.black,
            controller: _countryController,
            decoration: const InputDecoration(
              labelText: 'Country/Region',
              hintText: 'Bangladesh',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  cursorColor: Colors.black,
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                    labelText: 'First name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  cursorColor: Colors.black,
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                    labelText: 'Last name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            cursorColor: Colors.black,
            controller: _addressController,
            decoration: const InputDecoration(
              labelText: 'Address',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            cursorColor: Colors.black,
            controller: _apartmentController,
            decoration: const InputDecoration(
              labelText: 'Add apartment, suite, etc.',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  cursorColor: Colors.black,
                  controller: _cityController,
                  decoration: const InputDecoration(
                    labelText: 'City',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  cursorColor: Colors.black,
                  controller: _districtController,
                  decoration: const InputDecoration(
                    labelText: 'District',
                    hintText: 'Dhaka',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  cursorColor: Colors.black,
                  controller: _postalCodeController,
                  decoration: const InputDecoration(
                    labelText: 'Postal code (optional)',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  cursorColor: Colors.black,
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          /*Row(
            children: [
              Checkbox(
                value: _sameAddressForBilling,
                activeColor: ColorManager.primary,
                checkColor: ColorManager.white,
                onChanged: (bool? value) {
                  setState(() {
                    _sameAddressForBilling = value!;
                  });
                },
              ),
              const Text('Use same address for billing'),
            ],
          ),*/
        ],
      ),
    );
  }
}
