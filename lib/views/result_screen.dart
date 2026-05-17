import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
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
      Widget sendToWhatsappButton(CounterSuccess state) {
        String nominal = Formatter.formatCurrencyRupiah(state.calculateModel!.nominal!.toDouble());
        String dpp = Formatter.formatCurrencyRupiah(state.calculateModel!.dpp!.toDouble());
        String ppn = Formatter.formatCurrencyRupiah(state.calculateModel!.ppn!.toDouble());
        String pph = Formatter.formatCurrencyRupiah(state.calculateModel!.pph!.toDouble());
        String ppnAndpph = Formatter.formatCurrencyRupiah(state.calculateModel!.ppnAndpph!.toDouble());
        String transfer = Formatter.formatCurrencyRupiah(state.calculateModel!.transfer!.toDouble());
        String anotherDpp = Formatter.formatCurrencyRupiah(state.calculateModel!.anotherDpp!.toDouble());
        String message = '''Nominal: $nominal\nDPP: $dpp\nDPP Lain: $anotherDpp\nPPN: $ppn\nPPH: $pph\nPPN + PPH: $ppnAndpph\nTransfer: $transfer\n''';
        return Container(
          margin: EdgeInsets.only(top: SizeScreen.maxHeight(context) * 0.15),
          width: double.infinity,
          height: 46,
          child: TextButton(
            onPressed: () async {
              SharePlus.instance.share(
                  ShareParams(text: message)
              );
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Colors.black12),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              "Kirim Whatsapp",
              style: Typo.body.copyWith(
                fontWeight: Typo.bold,
                color: Colors.black,
              ),
            ),
          ),
        );
      }

      Widget submitButton(CounterSuccess state) {
        return Container(
          margin: EdgeInsets.only(top: 20),
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

      Widget result(CounterSuccess state) {
        Widget body() {
          double nominal = state.calculateModel!.nominal!.toDouble();
          double dpp = state.calculateModel!.dpp!.toDouble();
          double ppn = state.calculateModel!.ppn!.toDouble();
          double pph = state.calculateModel!.pph!.toDouble();
          double ppnAndpph = state.calculateModel!.ppnAndpph!.toDouble();
          double transfer = state.calculateModel!.transfer!.toDouble();
          double anotherDpp = state.calculateModel!.anotherDpp!.toDouble();
          return Container(
            padding: EdgeInsets.all(SizeScreen.maxHeight(context) * 0.03),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Nominal
                Row(
                  children: [
                    Text("Nominal : ", style: Typo.body.copyWith(fontSize: 16)),
                    Text(
                      "${Formatter.formatCurrencyRupiah(nominal)}",
                      style: Typo.body.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                //Dpp
                Row(
                  children: [
                    Text("DPP : ", style: Typo.body.copyWith(fontSize: 16)),
                    Text(
                      "${Formatter.formatCurrencyRupiah(dpp)}",
                      style: Typo.body.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                //Another DPP
                Row(
                  children: [
                    Text(
                      "DPP Lain : ",
                      style: Typo.body.copyWith(fontSize: 16),
                    ),
                    Text(
                      "${Formatter.formatCurrencyRupiah(anotherDpp)}",
                      style: Typo.body.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                //PPN
                Row(
                  children: [
                    Text("PPN : ", style: Typo.body.copyWith(fontSize: 16)),
                    Text(
                      "${Formatter.formatCurrencyRupiah(ppn)}",
                      style: Typo.body.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                //PPH
                Row(
                  children: [
                    Text("PPH : ", style: Typo.body.copyWith(fontSize: 16)),
                    Text(
                      "${Formatter.formatCurrencyRupiah(pph)}",
                      style: Typo.body.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
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
                const SizedBox(height: 8),
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
              return body();
            }
            return Container(
              margin: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(10),
              ),
            );
          },
        );
      }

      return Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            if (state is CounterSuccess) {
              return Container(
                margin: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    result(state),
                    sendToWhatsappButton(state),
                    submitButton(state),
                  ],
                ),
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      );
    }

    return Scaffold(body: body());
  }
}
