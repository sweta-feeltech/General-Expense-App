import 'package:flutter/material.dart';

import '../../Utils/colors.dart';

class SearchFeildScreen extends StatefulWidget {
  const SearchFeildScreen({Key? key}) : super(key: key);

  @override
  State<SearchFeildScreen> createState() => _SearchFeildScreenState();
}

class _SearchFeildScreenState extends State<SearchFeildScreen> {
  @override
  Widget build(BuildContext context) {
    double main_Width = MediaQuery.of(context).size.width;
    double main_Height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 15,
        title: Text(
          "My Groups",
          style: TextStyle(color: Colors.white, fontSize: main_Height * 0.022),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: primaryPurple,
        elevation: 0,
        centerTitle: false,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            Hero(
              tag: "search",
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: main_Width * 0.03, vertical: main_Height * 0.005),
                child: TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: main_Height * 0.015), // Adjust vertical padding
                    hintText: 'Search Itoms .. ',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onChanged: (value) {
                    // Do something with the search query
                  },

                ),

              ),
            ),
            
          ],
        ),
      ),
      
      
    );
  }
}
