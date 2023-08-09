import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_office_furniture_store_app/Controller/GoogleMaps/GetCurrentLocation.dart';
import 'package:flutter_office_furniture_store_app/Controller/Oredr_Rierpod/OrderInsert.dart';
import 'package:flutter_office_furniture_store_app/Controller/Oredr_Rierpod/OrderStateNotifierProder.dart';
import 'package:flutter_office_furniture_store_app/Controller/Utils/Utils.dart';
import 'package:flutter_office_furniture_store_app/Controller/Validations/Validation_Mixin.dart';
import 'package:flutter_office_furniture_store_app/View/Widgets/text_field.dart';
import 'package:flutter_office_furniture_store_app/View/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';

class ProceedToOrder extends StatefulWidget {
  const ProceedToOrder({super.key});
  static const pageName = '/ProceedToOrder';

  @override
  State<ProceedToOrder> createState() => _ProceedToOrderState();
}

class _ProceedToOrderState extends State<ProceedToOrder>
    with FormValidationMixin {
  TextEditingController addressTEC = TextEditingController();
  TextEditingController numberTEC = TextEditingController(text: '+92');

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height - kTextTabBarHeight;
    double width = MediaQuery.sizeOf(context).width;

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          systemNavigationBarColor: Color.fromARGB(255, 255, 0, 0)),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 17, 0),
          title: const Text('Proceed'),
        ),
        body: Container(
          color: const Color.fromARGB(255, 233, 76, 76).withOpacity(0.6),
          height: height,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 2,
                child: Chip(
                  backgroundColor: Colors.redAccent,
                  elevation: 16,
                  shadowColor: Colors.redAccent,
                  label: Text('Enter Details to Order',
                      style: TextStyle(
                          color: Colors.black, fontSize: width * 0.06)),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      textFormField(
                        isPassword: false,
                        isEmail: false,
                        controller: addressTEC,
                        context: context,
                        hintText: 'Address',
                        icon: Icons.approval,
                        iconButton: IconButton(
                            onPressed: () async {
                              Placemark locationData = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const GetUserCurrentLocation(),
                                  ));
                              addressTEC.text =
                                  "${locationData.street}, ${locationData.postalCode}, ${locationData.subLocality}, ${locationData.locality}, ${locationData.administrativeArea}, ${locationData.country}";

                              setState(() {});
                            },
                            icon: const Icon(Icons.location_on)),
                        validator: (value) => emptyValidation(value),
                      ),
                      SizedBox(
                        height: height * 0.06,
                      ),
                      textFormField(
                          isPassword: true,
                          isEmail: false,
                          controller: numberTEC,
                          context: context,
                          hintText: '+92.....',
                          icon: Icons.phone,
                          validator: (value) => phoneNumberValidation(value)),
                    ],
                  )),
              Expanded(
                flex: 1,
                child: Consumer(
                  builder: (context, ref, child) {
                    return Column(
                      children: [
                        InkWell(
                            onTap: () {
                              ref.watch(orderStateProvider.notifier).orderSave(
                                  address: addressTEC.text.toString(),
                                  number: numberTEC.text.toString());
                              Navigator.pushNamed(context, HomeScreen.pageName);
                              Utils().toastMessage('Order Done');
                            },
                            child: const OrderData())
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
