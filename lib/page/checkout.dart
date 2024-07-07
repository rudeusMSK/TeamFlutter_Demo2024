import 'package:flutter/material.dart';
import 'package:mainpage_detailuser_v1/page/checkout.dart';
import 'package:mainpage_detailuser_v1/page/editShipmet.dart';

class checkout extends StatefulWidget {
  
  const checkout({super.key});
  @override
  State<checkout> createState() => _checkoutState();
}

class _checkoutState extends State<checkout> {
  int selected = 0;
  String newAddress = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // chuyen den trang moi
          },
        ),
        title: const Text(
          "Thanh Toán",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: (){

            },
          ),
        ],

      ),


      body:  SafeArea(
          child:  Column(
            mainAxisSize: MainAxisSize.max,
            children:  [
              const Align(
                alignment:  AlignmentDirectional(-1, -1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 30, 0, 0),
                  child: Text(
                    'Chọn hình thức',
                    style:  TextStyle(
                          fontFamily: 'Outfit',
                          fontSize: 32,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
              ),
              const Align(
                alignment: AlignmentDirectional(-1, -1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                  child: Text(
                    'Thanh Toán',
                    style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  Radio <int> (
                    value: 1, 
                    groupValue: selected, 
                    onChanged: (int? value) {
                      setState(() {
                        selected = value!;
                      });
                    },                  
                  ),
                  
                  Image.asset(
                    'assets/images/ipay.png',
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                    
                  ),
                  
                  Radio <int> (
                    value: 2, 
                    groupValue: selected, 
                    onChanged: (int? value) {
                      setState(() {
                        selected = value!;
                      });
                    },                  
                  ),
                  Image.asset(
                    'assets/images/visa.png',
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                  Radio <int> (
                    value: 3, 
                    groupValue: selected, 
                    onChanged: (int? value) {
                      setState(() {
                        selected = value!;
                      });
                    },                  
                  ),
                  Image.asset(
                    'assets/images/mastercard.jpg',
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              Align(
                  alignment: AlignmentDirectional(-1, -1),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 30, 0, 0),
                        child: Text(
                          'Địa chỉ giao',
                          style: TextStyle(
                                fontFamily: 'Readex Pro',
                                fontSize: 20,
                                letterSpacing: 0,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: Image.asset(
                                  'assets/images/Group_8756.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            Flexible(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Text(
                                  newAddress,
                                  style: TextStyle(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 20,
                                        letterSpacing: 0,
                                      ),
                                ),
                              ),
                            ),

                            Flexible(
                              child:  Align(
                                alignment: Alignment.topRight,
                                
                                child: Ink(
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)
                                    ),
                                    shadows: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 10,
                                        spreadRadius: 1,
                                        offset: Offset(0,1),
                                      ),
                                    ]
                                  ),
                                  child: IconButton(
                                    
                                    icon: const Icon(Icons.edit),
                                    iconSize: 35,
                                    color: Colors.black,
                                    tooltip: "edit",
                                    splashColor: Colors.red,
                                    onPressed: ()async {
                                      final result = await Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => ChangePlace(place: newAddress)),
                                      );
                                      if (result != null) {
                                        setState(() {
                                          newAddress = result;
                                        });
                                      }                                      
                                    },                                    
                                  ),
                                  
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      
                    ]
                  ),
                  
              ),

              const Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 50, 0, 0),
                    child: Text(
                      'Giá',
                      style: TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 18,
                            letterSpacing: 0,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 50, 20, 0),
                    child: Text(
                      '100',
                      style: TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 18,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),

              const Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 50, 0, 0),
                    child: Text(
                      'Phí Giao',
                      style: TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 18,
                            letterSpacing: 0,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 50, 20, 0),
                    child: Text(
                      '100',
                      style: TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 18,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),

              const Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 50, 0, 0),
                    child: Text(
                      'Tông tiền',
                      style: TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 18,
                            letterSpacing: 0,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 50, 20, 0),
                    child: Text(
                      '100',
                      style: TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 18,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: ElevatedButton(
                  
                  child: Text("Thanh Toán"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(350, 40),
                    backgroundColor: Color(0xFF61ADF3),
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    elevation: 3,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),

                  ),


                  onPressed: () {
                    // su ly thanh toan
                  },
                ),
              ),
            ],
          ),
          
          
        ),
    );
  }
}