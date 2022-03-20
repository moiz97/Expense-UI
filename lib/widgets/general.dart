import 'package:expense_ui/responsiveness/layout.dart';
import 'package:flutter/material.dart';

class BankCard extends StatelessWidget {
  final String bankName;
  final String bankLogoPath;
  final String bankNumber;
  final String bankBalance;
  final String bankCurrency;
  final Color cardColor;
  final String customerName;
  const BankCard({
    Key? key,
    required this.bankName,
    required this.bankLogoPath,
    required this.bankNumber,
    required this.bankBalance,
    required this.bankCurrency,
    required this.cardColor,
    required this.customerName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _deviceHeight = MediaQuery.of(context).size.height;
    double _deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      width: _deviceWidth * 1,
      height: _deviceHeight * 0.25,
      decoration: BoxDecoration(
        color: cardColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  bankName,
                  style: Theme.of(context).textTheme.headline3!,
                ),
                const Spacer(),
                const Icon(
                  Icons.wallet_membership,
                  color: Colors.white,
                ),
              ],
            ),
            Spacers.verticalSpaceMedium(context),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  customerName,
                  style: Theme.of(context).textTheme.bodyText1!,
                ),
                Spacers.verticalSpaceTiny(context),
                Text(
                  bankNumber,
                  style: Theme.of(context).textTheme.bodyText1!,
                ),
              ],
            ),
            Spacers.verticalSpaceMedium(context),
            Row(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Total Balance: ",
                        style: Theme.of(context).textTheme.bodyText1!,
                      ),
                      TextSpan(
                        text: " " + bankCurrency + " " + bankBalance,
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 19),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Image.asset(
                  bankLogoPath,
                  height: _deviceHeight * 0.05,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PinnedAction extends StatelessWidget {
  final String actionName;
  final IconData actionIcon;

  const PinnedAction(
      {Key? key, required this.actionName, required this.actionIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _deviceHeight = MediaQuery.of(context).size.height;
    double _deviceWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: _deviceWidth * 0.17,
          height: _deviceHeight * 0.07,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 46, 65, 80).withOpacity(0.8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Icon(
              actionIcon,
              color: Colors.white,
            ),
          ),
        ),
        Spacers.verticalSpaceTiny(context),
        Text(
          actionName,
          style: Theme.of(context).textTheme.bodyText1!,
        ),
      ],
    );
  }
}

class TransactionCard extends StatelessWidget {
  final String name;
  final String transactionAmount;
  final String transactionType;
  final String transactionCurrency;
  const TransactionCard({
    Key? key,
    required this.name,
    required this.transactionAmount,
    required this.transactionType,
    required this.transactionCurrency,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.15,
          height: MediaQuery.of(context).size.width * 0.15,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 46, 65, 80).withOpacity(0.8),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: transactionType == "Income"
                ? const Icon(
                    Icons.arrow_downward,
                    color: Colors.green,
                  )
                : const Icon(
                    Icons.arrow_upward,
                    color: Colors.red,
                  ),
          ),
        ),
        Spacers.horizontalSpaceMedium(context),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.bodyText1!,
            ),
            Spacers.verticalSpaceTiny(context),
            Text(
              transactionType,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color:
                      transactionType == "Income" ? Colors.green : Colors.red),
            ),
          ],
        ),
        const Spacer(),
        Text(
          transactionAmount + " " + transactionCurrency,
          style: Theme.of(context).textTheme.headline3!.copyWith(
                color: transactionType == "Income" ? Colors.green : Colors.red,
              ),
        ),
      ],
    );
  }
}
