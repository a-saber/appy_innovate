import 'dart:ffi';

import 'package:appy_innovate/features/home/data/models/invoice_details_model.dart';
import 'package:appy_innovate/features/home/data/models/unit_model.dart';
import 'package:appy_innovate/features/home/presentation/cubit/add_invoice_cubit/add_invoice_cubit.dart';
import 'package:appy_innovate/features/home/presentation/cubit/add_invoice_cubit/add_invoice_state.dart';
import 'package:appy_innovate/features/home/presentation/cubit/get_unit_cubit/get_unit_cubit.dart';
import 'package:appy_innovate/features/home/presentation/cubit/get_unit_cubit/get_unit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvoiceFormView extends StatefulWidget {
  const InvoiceFormView({super.key});

  @override
  State<InvoiceFormView> createState() => _InvoiceFormViewState();
}

class _InvoiceFormViewState extends State<InvoiceFormView> {
  UnitModel? dropdownValue;

  TextEditingController productName = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController total = TextEditingController();
  double totalD = 0;
  TextEditingController expireDate = TextEditingController();
  String? unit;
  DateTime? _selectedDateTime;

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(DateTime.now()),
      );

      if (pickedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Invoice Details Page'),
      ),
      body: SafeArea(
          child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              DefaultFormField(
                  textEditingController: productName, label: 'Product Name'),
              BlocConsumer<GetUnitCubit, GetUnitState>(
                  builder: (context, state) {
                    if (state is GetUnitSuccessState) {
                      return DropdownMenu(
                        units: state.units,
                        dropdownValue: dropdownValue,
                      );
                    } else if (state is GetUnitErrorState) {
                      return Text(state.error);
                    } else if (state is GetUnitLoadingState) {
                      return const CircularProgressIndicator();
                    }
                    return SizedBox();
                  },
                  listener: (context, state) {}),
              DefaultFormField(textEditingController: price, label: 'Price'),
              DefaultFormField(
                  textEditingController: quantity, label: 'Quantity'),
              DefaultFormField(
                textEditingController: total,
                label: 'Total',
                enabled: false,
              ),
              Text(
                _selectedDateTime == null
                    ? 'No date and time selected!'
                    : 'Selected Date and Time: ${_selectedDateTime!.toLocal()}',
              ),
              ElevatedButton(
                onPressed: () => _selectDateTime(context),
                child: Text('Select Date and Time'),
              ),
              SizedBox(
                height: 20,
              ),
              BlocConsumer<AddInvoiceCubit, AddInvoiceState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is AddInvoiceLoadingState)
                      return CircularProgressIndicator();
                    else {
                      return ElevatedButton(
                          child: Text('Submit'),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              try {
                                AddInvoiceCubit.get(context).addInvoice(
                                    invoiceDetailsModel: InvoiceDetailsModel(
                                        productName: productName.text,
                                        unitNo: dropdownValue!.unitNo,
                                        price: double.parse(price.text),
                                        quantity: double.parse(quantity.text),
                                        total: totalD,
                                        expiryDate: _selectedDateTime!
                                            .toLocal()
                                            .toString()));
                              } catch (e) {
                                // todo popup with error
                              }
                            }
                          });
                    }
                  })
            ],
          ),
        ),
      )),
    );
  }
}

class DefaultFormField extends StatelessWidget {
  const DefaultFormField({
    super.key,
    required this.textEditingController,
    required this.label,
    this.enabled = true,
  });

  final TextEditingController textEditingController;
  final String label;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        validator: (String? value) {
          if (value == null) {
            return 'Must not be empty';
          } else {
            if (value.isEmpty)
              return 'Must not be empty';
            else
              return '';
          }
        },
        enabled: enabled,
        decoration: InputDecoration(hintText: label, labelText: label),
        controller: textEditingController,
      ),
    );
  }
}

class DropdownMenu extends StatefulWidget {
  DropdownMenu({super.key, required this.units, required this.dropdownValue});
  final List<UnitModel> units;
  UnitModel? dropdownValue;
  @override
  State<DropdownMenu> createState() => _DropdownMenuState();
}

class _DropdownMenuState extends State<DropdownMenu> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<UnitModel>(
      hint: Text('Select a unit'),
      value: widget.dropdownValue,
      items: widget.units.map((UnitModel value) {
        return DropdownMenuItem<UnitModel>(
          value: value,
          child: Text(value.unitName!),
        );
      }).toList(),
      onChanged: (UnitModel? newValue) {
        setState(() {
          widget.dropdownValue = newValue;
        });
      },
    );
  }
}
