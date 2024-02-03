import 'dart:convert';

import 'package:demo/demo_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  var broadcastNameController = TextEditingController();
  var targetChannelController = TextEditingController();
  var broadcastTypeController = TextEditingController();
  var broadcastMessageController = TextEditingController();
  var targetSegmentsController = TextEditingController();
  var broadcastRepeatitionController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();

  String selectedSchedulOption = 'Option 1';

  String? Date = "2 feb 2023";
  String? time = "16:30";

  final List<DropdownMenuItem<String>> targetChannel = [
    DropdownMenuItem<String>(
      value: 'All channel',
      child: Text('All channel'),
    ),
    DropdownMenuItem<String>(
      value: 'First channel',
      child: Text('First channel'),
    ),
    DropdownMenuItem<String>(
      value: 'Second channel',
      child: Text('Second channel'),
    ),
  ];

  final List<DropdownMenuItem<String>> broadcastType = [
    DropdownMenuItem<String>(
      value: 'Send message',
      child: Text('Send message'),
    ),
    DropdownMenuItem<String>(
      value: 'Send message with options',
      child: Text('Send message with options'),
    ),
    DropdownMenuItem<String>(
      value: 'Trigger a path',
      child: Text('Trigger a path'),
    ),
  ];

  final List<DropdownMenuItem<String>> targetSegment = [
    DropdownMenuItem<String>(
      value: 'All users',
      child: Text('All users'),
    ),
  ];

  final List<DropdownMenuItem<String>> broadcastRepeatition = [
    DropdownMenuItem<String>(
      value: 'once',
      child: Text('once'),
    ),
    DropdownMenuItem<String>(
      value: 'daily',
      child: Text('daily'),
    ),
    DropdownMenuItem<String>(
      value: 'monthly',
      child: Text('monthly'),
    ),
    DropdownMenuItem<String>(
      value: 'yearly',
      child: Text('yearly'),
    ),
  ];

  String? selectedTargetChannel;
  String? selectedBroadcastType;
  String? selectedTargetSegment;
  String? selectedBroadcastRepeatition;


  //count the broadcast message texts
  int characterCount=0;

  FontWeight _currentFontWeight = FontWeight.normal;
  FontStyle _currentFontStyle=FontStyle.normal;
  TextDecoration _currentDecoration=TextDecoration.none;

  @override
  void initState() {
    super.initState();
    selectedTargetChannel = targetChannel[0].value!;
    selectedBroadcastType = broadcastType[0].value!;
    selectedTargetSegment = targetSegment[0].value!;
    selectedBroadcastRepeatition = broadcastRepeatition[0].value!;
  }

  void changeFontWeight() {
    setState(() {
      _currentFontWeight =
          _currentFontWeight == FontWeight.normal ? FontWeight.bold : FontWeight.normal;
    });
  }

    void changeFontStyle() {
    setState(() {
      _currentFontStyle =
          _currentFontStyle == FontStyle.normal ? FontStyle.italic : FontStyle.normal;
    });
  }

   void changeTextDecoration() {
    setState(() {
      _currentDecoration =
          _currentDecoration == TextDecoration.none ? TextDecoration.underline : TextDecoration.none;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Create New Broadcast',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TitleWidget(
              title: 'Broadcast Name',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 10),
            CustomTextField(
              hintText: 'Enter name',
              controller: broadcastNameController,
            ),
            const SizedBox(height: 20),
            TitleWidget(title: 'Target Channel'),
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 5),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.all(Radius.circular(11))),
              child: DropdownButton(
                focusColor: Colors.transparent,
                icon: Padding(
                  padding: const EdgeInsets.only(left: 1350.0),
                  child: Icon(Icons.keyboard_arrow_down),
                ),
                value: selectedTargetChannel,
                items: targetChannel,
                onChanged: (value) {
                  setState(() {
                    selectedTargetChannel = value!;
                  });
                },
                hint: Text('Send message'),
                underline: Container(),
              ),
            ),
            //CustomTextField(hintText: 'Select',controller: targetChannelController,),
            const SizedBox(height: 20),
            TitleWidget(title: 'Broadcast Type'),
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 5),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.all(Radius.circular(11))),
              child: DropdownButton(
                focusColor: Colors.transparent,
                icon: Padding(
                  padding: const EdgeInsets.only(left: 1270.0),
                  child: Icon(Icons.keyboard_arrow_down),
                ),
                value: selectedBroadcastType,
                items: broadcastType,
                onChanged: (value) {
                  setState(() {
                    selectedBroadcastType = value!;
                  });
                },
                hint: Text('Select a channel'),
                underline: Container(),
              ),
            ),
            //CustomTextField(hintText: 'Send message',controller:broadcastTypeController),
            const SizedBox(height: 20),
            TitleWidget(title: 'Broadcast Message'),
            const SizedBox(height: 10),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(11),
                border: Border.all(
                  color: Colors.black,
                  width: 0.5,
                ),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 92,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: TextField(
                          style: TextStyle(fontWeight: _currentFontWeight,fontStyle: _currentFontStyle,decoration: _currentDecoration),
                          onChanged: (value) {
                            characterCount=value.length;
                            setState(() {
                            });
                          },
                          controller: broadcastMessageController,
                          
                          decoration: InputDecoration(
                              hintText: 'Enter message here',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade400, fontSize: 12,
                                  fontWeight: _currentFontWeight),
                              hintMaxLines: 20,
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.grey,
                      indent: 0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                             changeFontWeight();
                            },
                            child: Text('B',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(width: 21),
                          InkWell(
                            onTap: () {
                              changeFontStyle();
                            },
                            child: Text(
                              'I',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(width: 21),
                          InkWell(
                            onTap: () {
                           changeTextDecoration();
                            },
                            child: Text('U',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(width: 21),
                          Text("\$",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold)),
                          SizedBox(width: 21),
                          Icon(
                            Icons.link,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
            SizedBox(height: 10),
            Text(
              'Character: $characterCount/20000',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            SizedBox(height: 20),
            TitleWidget(title: 'Target Segments'),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 5),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.all(Radius.circular(11))),
              child: DropdownButton(
                focusColor: Colors.transparent,
                icon: Padding(
                  padding: const EdgeInsets.only(left: 1400.0),
                  child: Icon(Icons.keyboard_arrow_down),
                ),
                value: selectedTargetSegment,
                items: targetSegment,
                onChanged: (value) {
                  setState(() {
                    selectedTargetSegment = value!;
                  });
                },
                hint: Text('All users'),
                underline: Container(),
              ),
            ),
            //CustomTextField(hintText: 'All Users',controller: targetSegmentsController,),
            SizedBox(height: 20),
            TitleWidget(title: 'Schedule'),
            SizedBox(height: 10),
            Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: 'Option 1',
                      groupValue: selectedSchedulOption,
                      fillColor: MaterialStatePropertyAll(
                        const Color.fromARGB(255, 134, 16, 7),
                      ),
                      onChanged: (value) {
                        setState(() {
                          selectedSchedulOption = value.toString();
                        });
                      },
                    ),
                    Text('Send Now'),
                  ],
                ),
                SizedBox(
                  width: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: 'Option 2',
                      groupValue: selectedSchedulOption,
                      fillColor: MaterialStatePropertyAll(
                        const Color.fromARGB(255, 134, 16, 7),
                      ),
                      onChanged: (value) {
                        setState(() {
                          selectedSchedulOption = value.toString();
                        });
                      },
                    ),
                    Text('Schedule'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            selectedSchedulOption == "Option 2"
                ? SizedBox(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleWidget(title: 'Broadcast Repetiton'),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.black, width: 0.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(11))),
                            child: DropdownButton(
                              focusColor: Colors.transparent,
                              icon: Padding(
                                padding: const EdgeInsets.only(left: 1250.0),
                                child: Icon(Icons.keyboard_arrow_down),
                              ),
                              value: selectedBroadcastRepeatition,
                              items: broadcastRepeatition,
                              onChanged: (value) {
                                setState(() {
                                  selectedBroadcastRepeatition = value!;
                                });
                              },
                              hint: Text('Select broadcast repeatition'),
                              underline: Container(),
                            ),
                          ),
                          // CustomTextField(hintText: 'Once',controller: broadcastRepeatitionController,),
                          SizedBox(height: 20),
                          selectedBroadcastRepeatition=="once"?SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              TitleWidget(title: 'Date'),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(11),
                              border: Border.all(
                                  color: Colors.grey.shade500, width: 1),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "$Date",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        _selectDate(context);
                                      },
                                      child: Icon(
                                        Icons.date_range,
                                        color: Colors.grey,
                                      )),
                                ]),
                          ),
                          //CustomTextField(hintText: 'Feb 03, 2024',controller: dateController,),
                          SizedBox(height: 20),
                          TitleWidget(title: 'Time'),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(11),
                              border: Border.all(
                                  color: Colors.grey.shade500, width: 1),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "$time",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        _selectTime(context);
                                      },
                                      child: Icon(
                                        Icons.watch,
                                        color: Colors.grey,
                                      )),
                                ]),
                          ),
                            ]),
                          ):SizedBox(
                            child: Column(
                              
                              children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TitleWidget(title: 'From date'),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            height: 50,
                            width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(11),
                              border: Border.all(
                                  color: Colors.grey.shade500, width: 1),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "$Date",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        _selectDate(context);
                                      },
                                      child: Icon(
                                        Icons.date_range,
                                        color: Colors.grey,
                                      )),
                                ]),
                          ),

                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TitleWidget(title: 'To date'),
                          SizedBox(height: 10),
                          
                          Container(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            height: 50,
                            width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(11),
                              border: Border.all(
                                  color: Colors.grey.shade500, width: 1),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "$Date",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        _selectDate(context);
                                      },
                                      child: Icon(
                                        Icons.date_range,
                                        color: Colors.grey,
                                      )),
                                ]),
                          ),
                                    ],
                                  ),
                                  
                              
                              

                                ],
                              ),
                          //CustomTextField(hintText: 'Feb 03, 2024',controller: dateController,),

                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 TitleWidget(title: 'Fron Time'),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            height: 50,
                            width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(11),
                              border: Border.all(
                                  color: Colors.grey.shade500, width: 1),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "$time",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        _selectTime(context);
                                      },
                                      child: Icon(
                                        Icons.watch,
                                        color: Colors.grey,
                                      )),
                                ]),
                          ),
                              ],
                             ),
                             Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TitleWidget(title: 'To Time'),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            height: 50,
                            width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(11),
                              border: Border.all(
                                  color: Colors.grey.shade500, width: 1),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "$time",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        _selectTime(context);
                                      },
                                      child: Icon(
                                        Icons.watch,
                                        color: Colors.grey,
                                      )),
                                ]),
                          ),
                          
                              ],
                             ),
                               
                          
                            ],
                          ),
                            ]),
                          ),
                          
                          
                        ]),
                  )
                : Container(),
            SizedBox(height: 30),
            Divider(
              color: Colors.grey.shade600,
              thickness: 1,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    
                    if (broadcastNameController.text.isNotEmpty &&
                        selectedTargetChannel!.isNotEmpty &&
                        broadcastType.isNotEmpty &&
                        broadcastMessageController.text.isNotEmpty &&
                        selectedTargetSegment!.isNotEmpty &&
                        selectedBroadcastRepeatition!.isNotEmpty &&
                        Date!.isNotEmpty &&
                        time!.isNotEmpty) {
                          if(selectedSchedulOption=="Option 2"){
                              var broadcastData = DemoModel(
                        broadcastName: broadcastNameController.text.toString(),
                        targetChannel: selectedTargetChannel!,
                        broadcastType: selectedBroadcastType!,
                        broadcastMessage:
                            broadcastMessageController.text.toString(),
                        targetSegment: selectedTargetSegment!,
                        broadcastRepeatition: selectedBroadcastRepeatition!,
                        date: Date!,
                        time: time!,
                      ).toJson();
                      var jsonData = jsonEncode(broadcastData);
                      print(jsonData);
                          }
                          if(selectedSchedulOption=="Option 1"){
                             var broadcastData = DemoModel(
                        broadcastName: broadcastNameController.text.toString(),
                        targetChannel: selectedTargetChannel!,
                        broadcastType: selectedBroadcastType!,
                        broadcastMessage:
                            broadcastMessageController.text.toString(),
                        targetSegment: selectedTargetSegment!,
                        broadcastRepeatition: "",
                        date: "",
                        time: "",
                      ).toJson();
                      var jsonData = jsonEncode(broadcastData);
                      print(jsonData);
                          }
                     
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        const Color.fromARGB(255, 134, 16, 7),
                      ),
                      foregroundColor: MaterialStatePropertyAll(Colors.white)),
                  child: Text('Schedule Broadcast'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.grey.shade400,
                      ),
                      foregroundColor: MaterialStatePropertyAll(Colors.white)),
                  child: Text('Save Draft'),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime pickedDate = DateTime.now();

    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: pickedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null && selectedDate != pickedDate) {
      pickedDate = selectedDate;
      String formattedDate = DateFormat('dd MMM y').format(pickedDate);
      Date = formattedDate;
      print(Date);
      setState(() {});
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay pickedTime = TimeOfDay.now();
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: pickedTime,
    );

    if (selectedTime != null && selectedTime != pickedTime) {
      setState(() {
        pickedTime = selectedTime;
        String formattedTime = DateFormat.Hm().format(
          DateTime(2022, 1, 1, pickedTime.hour, pickedTime.minute),
        );
        time = formattedTime;
        print(time);
      });
    }
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText, this.controller});
  final String? hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(color: Colors.grey.shade100, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(color: Colors.black, width: 0.5),
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, required this.title, this.style});
  final String? title;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: style,
    );
  }
}
