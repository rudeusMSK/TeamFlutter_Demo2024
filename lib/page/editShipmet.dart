import 'package:mainpage_detailuser_v1/page/checkout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ChangePlace extends StatefulWidget {
  final String place;
  const ChangePlace({super.key, required this.place});

  @override
  State<ChangePlace> createState() => _ChangePlaceState();
}

class _ChangePlaceState extends State<ChangePlace> {
   TextEditingController oldAdress = TextEditingController();
   TextEditingController newAdress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // quay lai trang checkout
            Navigator.pop(context);
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
            icon: const Icon(Icons.notifications),
            onPressed: (){
              // chuyen den trang thong bao
            },
          ),
        ],

      ),

      body:  SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 50, 0, 0),
                  child: Text(
                    'Đổi địa chỉ của bạn',
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      fontSize: 30,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
              ),

              const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                  child: Text(
                    'Địa chỉ cũ',
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      fontSize: 25,
                    ),
                  ),
              ),

              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 8, 0),
                child:  Column(
                  
                  children: [
                    Container(
                      width: 350,
                      child: TextField(
                        controller: oldAdress,
                        maxLines: 3,
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: widget.place,
                          hintStyle: TextStyle(color: Color.fromARGB(255, 108, 108, 108)),
                          labelStyle: TextStyle(color: Colors.black, fontSize: 20,),
                          
                          filled: true,
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          
                          
                          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        ),
                        
                      ),
                    ),
                    
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 40, 0, 0),
                child: Text(
                  'Địa chỉ mới',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 25,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 8, 0),
                child:  Column(
                  
                  children: [
                    Container(
                      width: 350,
                      child: TextField(
                        controller: newAdress,
                        maxLines: 3,
                        decoration: InputDecoration(
                          
                          hintText: "Địa chỉ mới",
                          hintStyle: TextStyle(color: Color.fromARGB(255, 108, 108, 108)),
                          labelStyle: TextStyle(color: Colors.black, fontSize: 20,),
                          
                          filled: true,
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.black), // Màu của underline khi focused
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          
                          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        ),
                        
                      ),
                    ),
                    
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                child: ElevatedButton(
                  
                  child: Text("Lưu"),
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
                    Navigator.pop(context , newAdress.text);
                  },
                ),
              ),

            ],
          ),
        ),
        
      ),

    );
  }
}