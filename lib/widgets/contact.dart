import 'package:flutter/material.dart';
import 'package:emailjs/emailjs.dart' as emailjs;
import 'package:portofolio/core/constant/color_app.dart';
import 'package:portofolio/core/constant/size.dart';
import 'package:portofolio/widgets/custom_text_widget.dart';
import 'package:portofolio/widgets/text_field_potofolio.dart';


class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {

  TextEditingController edtSender = TextEditingController();
  TextEditingController edtEmail = TextEditingController();
  TextEditingController edtMessage = TextEditingController();
  // EmailSender emailSender = EmailSender();

  void _sendEmail() async {
    if(edtSender.text.isEmpty || edtEmail.text.isEmpty || edtMessage.text.isEmpty){
      await _showMyDialog();
      return;
    }
    try {
      await emailjs.send(
        'service_kagel8p',
        'template_d5sn7oc',
        {
          'to_email': edtSender.text,
          'message': edtMessage.text,
        },
        const emailjs.Options(
            publicKey: 'nX9nizRz-evztEzIM',
            privateKey: 'vRDwDYUkFb9OCZQ96wn9t',
            limitRate: const emailjs.LimitRate(
              id: 'app',
              throttle: 10000,
            )),
      );
      print('SUCCESS!');
    } catch (error) {
      if (error is emailjs.EmailJSResponseStatus) {
        print('ERROR... $error');
      }
      print(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraints){
        return Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          color: bgLight1,
          child: Column(
            children: [
              CustomTextWidget(text: "Get in touch", size: 24, fontWeight: FontWeight.bold, color: whitePrimary),
              SizedBox(height: 50),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 700),
                child: constraints.maxWidth >= kMinDesktopWidth ? formWeb : formMobile,
              ),
              SizedBox(height: 15,),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 700),
                child: TextFieldPotofolio(
                  controller: edtMessage,
                  hint: 'Your message',
                  maxLine: 17,
                ),
              ),
              SizedBox(height: 15,),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 700),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: yellowPrimary,
                          padding: EdgeInsets.symmetric(vertical: 20)
                      ),
                      onPressed: ()=>_sendEmail(),
                      child: CustomTextWidget(text: "Get in touch", color: whitePrimary,)
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget get formWeb {
    return Row(
      children: [
        Flexible(
          child: TextFieldPotofolio(
            controller: edtSender,
            hint: 'Your name',
          ),
        ),
        SizedBox(width: 15,),
        Flexible(
          child: TextFieldPotofolio(
            controller: edtEmail,
            hint: 'Your email',
            typeInput: TextInputType.emailAddress,
          ),
        ),
      ],
    );
  }

  Widget get formMobile {
    return Column(
      children: [
        TextFieldPotofolio(
          controller: edtSender,
          hint: 'Input your name',
        ),
        SizedBox(height: 15,),
        TextFieldPotofolio(
          controller: edtEmail,
          hint: 'Input your email',
          typeInput: TextInputType.emailAddress,
        ),
      ],
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Attention!'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                CustomTextWidget(text: "Have you input all the fields?"),
                SizedBox(height: 1.5),
                CustomTextWidget(text: 'Hit the yellow button when you ready '),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const CustomTextWidget(text: 'Ready'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
