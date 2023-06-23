import 'package:flutter/material.dart';
import 'package:general_expense_app/Utils/colors.dart';

class FilterForTransaction extends StatefulWidget {
  final String? preSelected;
  const FilterForTransaction({super.key, required this.preSelected});

  @override
  State<FilterForTransaction> createState() => _FilterForTransactionState();
}

class _FilterForTransactionState extends State<FilterForTransaction> {
  List<String> filterList = ["All", "Income","Expense"];

  String? selectedOption;

  @override
  void initState() {
    selectedOption = widget.preSelected;
    print("selectedOption in init: $selectedOption");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var main_Width = MediaQuery.of(context).size.width;
    var main_Height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: main_Width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Text(
                  "Filter",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700
                  ),
                ),
                Positioned(
                    right: 0,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                          Icons.clear, color: Color.fromARGB(255, 158, 158, 158)
                      ),
                    )
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.only(top: 10),
            width: main_Width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Select Status:",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ),

                const SizedBox(height: 2,),
                Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 16,
                  children: filterList.map((option) => buildChip(option, context)).toList(),
                ),
                const SizedBox(height: 20,),

                buildButtons(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildButtons() {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 150,
        child: SizedBox(
          height: 45,
          child: ElevatedButton(
              onPressed: () {
                // if(selectedOption == "Male") {
                //   genderCode = "0";
                // }
                // else if(selectedOption == "Female") {
                //   genderCode = "1";
                // }
                // else {
                //   genderCode = null;
                // }
                Navigator.pop(context, "$selectedOption");
                FocusScope.of(context).unfocus();
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(primaryPurple),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                      )
                  )
              ),
              child: Text(
                "Apply",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              )
          ),
        ),
      ),
    );
  }

  Widget buildChip(String option, BuildContext context) {
    final isSelected = selectedOption == option;
    final foregroundColor = isSelected ? Colors.white : Colors.black;
    final backColor = isSelected ? primaryPurple : Colors.white;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = option;
        });
        print(selectedOption);
      },
      child: Chip(
          backgroundColor: backColor,
          padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
          side: BorderSide(
              color: primaryPurple,
              width: 1.5
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          label: Text(
            option,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: foregroundColor,
                backgroundColor: backColor
            ),
          )
      ),
    );
  }
}