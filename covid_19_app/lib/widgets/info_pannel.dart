import 'package:flutter/material.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:covid_19_app/models/data_source.dart';
import 'package:url_launcher/url_launcher.dart';

class InformationPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 5,horizontal: 12),
            decoration: BoxDecoration(
              color: primaryBlack,
              borderRadius: BorderRadius.circular(10),
            ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("FAQ's",style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.white
                ),),
                Icon(Icons.arrow_forward,color: Colors.white,),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              launch("https://covid19responsefund.org/en/");
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 5,horizontal: 12),
              decoration: BoxDecoration(
                color: primaryBlack,
                borderRadius: BorderRadius.circular(10),
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("DONATE",style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.white
                  ),),
                  Icon(Icons.arrow_forward,color: Colors.white,),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              launch("https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters");
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 5,horizontal: 12),
              decoration: BoxDecoration(
                color: primaryBlack,
                borderRadius: BorderRadius.circular(10),
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("MYTH BUSTERS",style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.white
                  ),),
                  Icon(Icons.arrow_forward,color: Colors.white,),
                ],
              ),
            ),
          ),
        ],
      ),
      // child: ListView.builder(
      //   itemCount: 8,
      //   shrinkWrap: true,
      //   physics: NeverScrollableScrollPhysics(),
      //   itemBuilder: (context, index) {
      //     return GFAccordion(
      //         title: DataSource.questionAnswers[index]["question"],
      //         content: DataSource.questionAnswers[index]["answer"],
      //         expandedTitleBackgroundColor: Colors.grey.shade300,
      //         collapsedTitleBackgroundColor: Colors.grey.shade200,
      //         collapsedIcon: Icon(Icons.add),
      //         expandedIcon: Icon(Icons.minimize));
      //   },
      // ),
    );
  }
}
