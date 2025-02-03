import 'package:aces/constants/colors.dart';
import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key, required this.title});
  final String title;
  @override
  State<FeedbackPage> createState() => _FeedbackPage();
}

class _FeedbackPage extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          backgroundColor: AppColors.scarletRed,
          iconTheme: const IconThemeData(size: 30),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text('Feedback Form         ',style: TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.w500)),],
          ),
        ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10.0),
            const Text("Please Select the Type of the feedback",style: TextStyle(
              color: Color(0xffc5c5c5)),
            ),
            const SizedBox(height: 25.0),
            buildCheckItem("Login Truble"),
            buildCheckItem("Phone Number Related"),
            buildCheckItem("Personal Profile"),
            buildCheckItem("Other Issues"),
            buildCheckItem("Suggestions"),
            const SizedBox(height: 20.0),
            buildFeedbackForm(),
            const SizedBox(height: 20.0),
            buildNumberField(),
        const Spacer(),
            Row(
              children: <Widget>[
                Expanded(
                  child : OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      backgroundColor: Colors.white,
                      elevation: 10,
                      alignment: Alignment.center,
                      minimumSize: const Size.fromHeight(50),
                      side: const BorderSide(color: Colors.orangeAccent, width: 5),
                    ),
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                    onPressed: () => {
                    },
                  ),
                )
              ],
            )

          ],
        ),
      ),
    );
  }

  buildNumberField(){
    return TextField(style: const TextStyle(
      color: Colors.black,
    ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0.0),
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(border: Border(
                right: BorderSide(width: 1.0,color: Color(0xffc5c5c5))

              )
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(width: 10.0),
                  Text(
                    "+91",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xffc5c5c5),
                    ),

                  ),
                  Icon(Icons.arrow_drop_down,color: Colors.cyan),
                  SizedBox(width: 10.0),
                ],
              ),
            )
          ],
      ),
        hintStyle: const TextStyle(
          fontSize: 14.0,
          color: Color(0xffc5c5c5),
        ),
        hintText: "Phone Number",
        border: const OutlineInputBorder(),
    )
    );
  }


  buildFeedbackForm(){
    return SizedBox(
      height: 150.0,
      child: Stack(
        children: <Widget>[
          const TextField(
            maxLines: 10,
            decoration: InputDecoration(
              hintText: "Please briefly describe the issue",
              hintStyle: TextStyle(
                fontSize: 13.0,
                color: Color(0xffc5c5c5),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffe5e5e5)),
              )
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1.0,
                    color: Color(0xffa6a6a6),
                  )
                )
              ),
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffe5e5e5),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.add,
                        color: Color(0xffa5a5a5),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  const Text( "Uplode Screenshot (Optional)",
                    style: TextStyle(
                      color: Color(0xffc5c5c5),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  buildCheckItem(title){
    return Padding(padding: const EdgeInsets.only(bottom: 15.0),
    child: Row(
      children: <Widget>[
        const Icon(Icons.check_circle,color: Colors.orange),
        const SizedBox(width: 10.0),
        Text(title,style: const TextStyle(fontWeight: FontWeight.bold,
          color: Colors.orange,
        ),
        )
      ],
    ),
    );
  }
  
}
