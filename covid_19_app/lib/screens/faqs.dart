import 'package:covid_19_app/models/data_source.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQ's"),
        centerTitle: true,
        elevation: 9,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: SingleChildScrollView(
          child: ListView.builder(
            itemCount: DataSource.questionAnswers.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GFAccordion(
                  title: DataSource.questionAnswers[index]["question"],
                  content: DataSource.questionAnswers[index]["answer"],
                  expandedTitleBackgroundColor: Colors.grey.shade300,
                  collapsedTitleBackgroundColor: Colors.grey.shade200,
                  collapsedIcon: Icon(Icons.add),
                  expandedIcon: Icon(Icons.minimize));
            },
          ),
        ),
      ),
    );
  }
}
