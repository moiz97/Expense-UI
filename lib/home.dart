import 'package:expense_ui/responsiveness/layout.dart';
import 'package:expense_ui/widgets/general.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  final List _transactions = const [
    {
      'name': 'Muhammad Moiz',
      'amount': '10,000',
      'type': 'Income',
    },
    {
      'name': 'John Doe',
      'amount': '20,000',
      'type': 'Income',
    },
    {
      'name': 'Jane Doe',
      'amount': '35,000',
      'type': 'Expense',
    },
    {
      'name': 'John Doe',
      'amount': '45,000',
      'type': 'Expense',
    },
    {
      'name': 'Jane Doe',
      'amount': '500',
      'type': 'Expense',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                topBar(context),
                Spacers.verticalSpaceMedium(context),
                const BankCard(
                  bankName: "Bank of Pakistan",
                  bankLogoPath: "assets/logos/mastercard_logo.png",
                  bankNumber: "3460 **** **** 9875",
                  bankBalance: "250,558",
                  bankCurrency: "PKR",
                  cardColor: Color.fromARGB(255, 46, 65, 80),
                  customerName: "Muhammad Moiz",
                ),
                Spacers.verticalSpaceMedium(context),
                pinnedWidgets(),
                Spacers.verticalSpaceLarge(context),
                transactionsHeading(context),
                Spacers.verticalSpaceMedium(context),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _transactions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TransactionCard(
                        name: _transactions[index]['name'],
                        transactionAmount: _transactions[index]['amount'],
                        transactionType: _transactions[index]['type'],
                        transactionCurrency: "PKR",
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget transactionsHeading(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Transactions",
          style: Theme.of(context).textTheme.headline2!.copyWith(
                fontSize: 22,
              ),
        ),
        Row(
          children: [
            Text(
              "Sort by ",
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: Colors.grey,
                  ),
            ),
            Spacers.horizontalSpaceTiny(context),
            const Icon(
              Icons.arrow_downward,
              color: Colors.grey,
            ),
          ],
        ),
      ],
    );
  }

  Widget pinnedWidgets() {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          PinnedAction(
            actionIcon: Icons.arrow_upward,
            actionName: "Send",
          ),
          PinnedAction(
            actionIcon: Icons.arrow_downward,
            actionName: "Receive",
          ),
          PinnedAction(
            actionIcon: Icons.share,
            actionName: "Share",
          ),
        ],
      ),
    );
  }

  Widget topBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Current Account",
          style: Theme.of(context).textTheme.headline2!.copyWith(
                fontSize: 22,
              ),
        ),
        const Icon(
          Icons.person_outline,
          color: Colors.white,
          size: 29,
        ),
      ],
    );
  }
}
