import 'package:calculating_tax/views/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/counter_bloc.dart';
import '../blocs/counter_state.dart';
import '../constants/constant_data.dart';
import '../utils/custom_styles.dart';
import '../utils/formatter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _choice = dataInput[0];
  final TextEditingController _inputNumberController = TextEditingController(
    text: "",
  );


  @override
  Widget build(BuildContext context) {
    CounterBloc counterTaxBlocProvider = BlocProvider.of<CounterBloc>(context, listen: true);

    void onCalculate() {
      final convertToNumber = double.parse(_inputNumberController.text.toString().replaceAll(",", ""));
      if (_choice == dataInput[0]) {
        counterTaxBlocProvider.onUsingNominalValue(convertToNumber);
        if (counterTaxBlocProvider.state is CounterSuccess) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ResultScreen()));
        }
      }

      if(_choice == dataInput[1]){
        counterTaxBlocProvider.onUsingPpnValue(convertToNumber);
        if(counterTaxBlocProvider.state is CounterSuccess){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ResultScreen()));
        }
      }

      if(_choice == dataInput[2]){
        counterTaxBlocProvider.onUsingTransferValue(convertToNumber);
        if(counterTaxBlocProvider.state is CounterSuccess){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ResultScreen()));
        }
      }


    }

    Widget body() {
      Widget dropDownChoice() {
        return Row(
          children: [
            Text(
              "Masukkan :",
              style: blackTextStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: DropdownButtonHideUnderline(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade400,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButton(
                    value: _choice,
                    itemHeight: 50,
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(8),
                    items: dataInput.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Container(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(item),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _choice = value!;
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      }

      Widget formInput() {
        return Container(
          margin: EdgeInsets.only(top: maxHeight(context) * 0.15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Masukkan $_choice",
                style: blackTextStyle.copyWith(fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
                child: TextFormField(
                  cursorColor: blackColor,
                  autofocus: true,
                  controller: _inputNumberController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9.,]+')),
                  ],
                  onChanged: (String inputString) {
                    inputString = Formatter.formatCurrency(
                      inputString.replaceAll(',', ''),
                    );
                    _inputNumberController.value = TextEditingValue(
                      text: inputString,
                      selection: TextSelection.collapsed(
                        offset: inputString.length,
                      ),
                    );
                  },
                  decoration: InputDecoration(
                    hintText: "Masukkan $_choice",
                    focusColor: primaryColor,
                    prefixIcon: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      child: Text("Rp"),
                    ),
                    suffixIcon: IconButton(
                      onPressed: _inputNumberController.clear,
                      icon: Icon(Icons.clear),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        defaultRadius,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }

      Widget submitButton() {
        return Container(
          margin: EdgeInsets.only(top: maxHeight(context) * 0.15),
          width: double.infinity,
          height: 46,
          child: TextButton(
            onPressed: onCalculate,
            style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: primaryColor),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Text(
              "Hitung",
              style: whiteTextStyle.copyWith(
                fontWeight: bold,
              ),
            ),
          ),
        );
      }

      return Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(15.0),
            padding: EdgeInsets.all(maxHeight(context) * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                dropDownChoice(),
                formInput(),
                submitButton(),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: body(),
    );
  }
}
