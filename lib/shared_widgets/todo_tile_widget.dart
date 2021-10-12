import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/utils.dart';

class TodoTileWidget extends StatelessWidget {
  const TodoTileWidget({
    Key? key,
    required this.status,
  }) : super(key: key);
  final bool status;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: ListTile(
          leading: Icon(
            status ? Icons.check_circle : Icons.check_circle_outline,
            size: 30,
            color: dateColor('Yesterday'),
          ),
          title: Text(
            "Plan the trip to Finland",
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
          ),
          subtitle: Text(
            "The family's trip to Finland next summer",
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: Colors.grey),
          ),
          trailing: TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: dateColor('Yesterday'),
            ),
            label: Text("Yesterday",
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: dateColor('Yesterday'),
                    )),
          ),
        ),
      ),
    );
  }
}
