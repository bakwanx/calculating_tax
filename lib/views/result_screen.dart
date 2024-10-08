
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/counter_bloc.dart';
import '../blocs/counter_state.dart';
import '../utils/custom_styles.dart';
import '../utils/formatter.dart';

class ResultScreen extends StatelessWidget {

  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void onBack() {
      Navigator.pop(context);
    }

    Widget body() {
      Widget submitButton() {
        return Container(
          margin: EdgeInsets.only(top: SizeScreen.maxHeight(context) * 0.15),
          width: double.infinity,
          height: 46,
          child: TextButton(
            onPressed: onBack,
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Colors.black12),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              "Hitung Ulang",
              style: Typo.body.copyWith(
                fontWeight: Typo.bold,
                color: Colors.white,
              ),
            ),
          ),
        );
      }

      Widget result() {
        Widget body(double nominal, double dpp, double ppn, double pph,
            double ppnAndpph, double transfer) {
          return Container(
            padding: EdgeInsets.all(SizeScreen.maxHeight(context) * 0.03),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Nominal
                Row(
                  children: [
                    Text(
                      "Nominal : ",
                      style: Typo.body.copyWith(fontSize: 16),
                    ),
                    Text(
                      "${Formatter.formatCurrencyRupiah(nominal)}",
                      style: Typo.body.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                //Dpp
                Row(
                  children: [
                    Text(
                      "DPP : ",
                      style: Typo.body.copyWith(fontSize: 16),
                    ),
                    Text(
                      "${Formatter.formatCurrencyRupiah(dpp)}",
                      style: Typo.body.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                //PPN
                Row(
                  children: [
                    Text(
                      "PPN : ",
                      style: Typo.body.copyWith(fontSize: 16),
                    ),
                    Text(
                      "${Formatter.formatCurrencyRupiah(ppn)}",
                      style: Typo.body.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                //PPH
                Row(
                  children: [
                    Text(
                      "PPH : ",
                      style: Typo.body.copyWith(fontSize: 16),
                    ),
                    Text(
                      "${Formatter.formatCurrencyRupiah(pph)}",
                      style: Typo.body.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                //PPN + PPH
                Row(
                  children: [
                    Text(
                      "PPN + PPH : ",
                      style: Typo.body.copyWith(fontSize: 16),
                    ),
                    Text(
                      "${Formatter.formatCurrencyRupiah(ppnAndpph)}",
                      style: Typo.body.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                //Transfer
                Row(
                  children: [
                    Text(
                      "Transfer : ",
                      style: Typo.body.copyWith(fontSize: 16),
                    ),
                    Text(
                      "${Formatter.formatCurrencyRupiah(transfer)}",
                      style: Typo.body.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }

        return BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            if (state is CounterSuccess) {
              return body(
                state.calculateModel!.nominal!.toDouble(),
                state.calculateModel!.dpp!.toDouble(),
                state.calculateModel!.ppn!.toDouble(),
                state.calculateModel!.pph!.toDouble(),
                state.calculateModel!.ppnAndpph!.toDouble(),
                state.calculateModel!.transfer!.toDouble(),
              );
            }
            return Container(
              margin: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            );
          },
        );
      }

      return Center(
        child: Container(
          margin: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              result(),
              submitButton(),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: body(),
    );
  }
}
