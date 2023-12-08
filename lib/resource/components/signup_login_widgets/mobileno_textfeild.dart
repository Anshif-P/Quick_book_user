import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class MobileNoTextField extends StatefulWidget {
  final BuildContext contextMainScreen;
  final TextEditingController controller;
  final FormFieldValidator validation;

  const MobileNoTextField(
      {super.key,
      required this.contextMainScreen,
      required this.controller,
      required this.validation});

  @override
  State<MobileNoTextField> createState() => _MobileNoTextFieldState();
}

class _MobileNoTextFieldState extends State<MobileNoTextField> {
  // CountryCode? _selectedCountry;
  @override
  Widget build(BuildContext context) {
    // double heightMedia = MediaQuery.sizeOf(widget.contextMainScreen).height;
    double widthMedia = MediaQuery.sizeOf(widget.contextMainScreen).width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Enter Number'),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          // height: heightMedia * 0.07,
          child: TextFormField(
            keyboardType: TextInputType.number,
            validator: widget.validation,
            controller: widget.controller,
            decoration: InputDecoration(
              isDense: true,
              constraints: const BoxConstraints(maxHeight: 70, minHeight: 35),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFFD1D1D1))),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(10.0),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
              hintText: 'Enter mobile number',
              hintStyle: const TextStyle(color: Color(0xFF999999)),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFD1D1D1)),
                borderRadius: BorderRadius.circular(12.0),
              ),
              prefixIcon: SizedBox(
                width: widthMedia * 0.3,
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          // color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: CountryCodePicker(
                        onChanged: (code) {
                          setState(() {
                            // _selectedCountry = code;
                          });
                        },
                        initialSelection: 'IN', // Set the initial selection
                        favorite: const [
                          'US',
                          'IN'
                        ], // Optionally, provide a list of favorite countries
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 29,
                      color: const Color(0xFFD1D1D1),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
