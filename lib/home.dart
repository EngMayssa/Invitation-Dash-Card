import 'dart:async';
import 'package:dash/screen/card_result.dart';
import 'package:dash/screen/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:share_files_and_screenshot_widgets_plus/share_files_and_screenshot_widgets_plus.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
String date = '';
String name = '';
String place = '';
Widget? _image ;

bool isOpen = false;
int originalSize = 800;
class _HomeState extends State<Home> {
  final dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  final GlobalKey<FormState> _keyInvitation = GlobalKey<FormState>();
  static GlobalKey previewCard = GlobalKey();

  Future openDialog() => showDialog(

      context: context,
      builder: (context) {

        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            // لكي نضيف عنوان لدايلوق title
            title: Text(
              'بطاقة الدعوه',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
            //  لكي نضيف محتوى لدايلوق وسوف يكون فورم content
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  key: _keyInvitation,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (text){
                          if (text! == ''){
                            return "يجب إملاءالحقل";
                          }
                          return null;
                        },
                        style: Theme.of(context).textTheme.bodyText1,
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                        decoration: const InputDecoration(
                            hintText: "الأسم",
                            suffixIcon: Icon(Icons.person_add)),
                      ),
                      TextFormField(
                          validator: (text){
                            if (text! == ''){
                              return "يجب إملاء الحقل";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              place = value;
                            });
                          },
                          style: Theme.of(context).textTheme.bodyText1,
                          decoration: const InputDecoration(
                            hintText: "المكان",
                            suffixIcon: Icon(Icons.place_outlined),
                          )),
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: TextFormField(
                            validator: (text){
                              if (text! == ''){
                                return "يجب إختيار التاريخ";
                              }
                              return null;
                            },
                            style: Theme.of(context).textTheme.bodyText1,
                            onChanged: (value) {
                              setState(() {
                                date = value;
                              });
                            },
                            controller: dateController,
                            decoration: const InputDecoration(
                                hintText: "التاريخ",
                                suffixIcon: Icon(Icons.date_range_outlined)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(

                  child: Text(
                    'اضف دعوه',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  onPressed: () {
                    var formstate = _keyInvitation.currentState; // FormState get currentState
                    if (formstate!.validate()) {
                      setState(() {
                        isOpen = true;
                      });
                      Navigator.of(context).pop();
                      _keyInvitation.currentState!.reset();
                    }
                  },
                ),
              ],
            ),
          ),
        );
      });

  Future _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2100));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        String formatedPicked =
            "${picked.year.toString()}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
        dateController.value = TextEditingValue(text: formatedPicked);
        date = formatedPicked;
      });
    }
  }

  // take and share screenshot

  Future<dynamic> takeScreenShot() {
    return ShareFilesAndScreenshotWidgets()
        .takeScreenshot(previewCard, originalSize)
        .then((Image value) {
      setState(() {
        _image = value;
      });
    });
  }


  Future<dynamic> shareScreenShot() {
    return ShareFilesAndScreenshotWidgets().shareScreenshot(
        previewCard, originalSize, "Title", "Name.png", "image/png",
       );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: !isOpen
            ? StartScreen(
          openDialog: () {
            return openDialog();
          },
        )
            : Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RepaintBoundary(
                key: previewCard,
                child: CardResult(
                  openDialog: () {
                    return openDialog();
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      openDialog();
                    },
                    child: Text(
                      "تعديل",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                    onPressed: () async{
                      await takeScreenShot();
                      await shareScreenShot();
                    },
                    child: const Icon(
                      Icons.share_outlined,
                      color: Colors.lightBlue,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
