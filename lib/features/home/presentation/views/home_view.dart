import 'package:appy_innovate/features/home/presentation/views/invoice_form_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home Page'),
      ),
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MaterialButton(
                  onPressed: () {
                    Get.to(InvoiceFormView());
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Invoice Details',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                  onPressed: () {},
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Invoice List',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
