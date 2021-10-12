import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared_widgets/todo_tile_widget.dart';
import 'package:flutter_application_1/utilities/utils.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'create_todo_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 50,
        leading: const Padding(
          padding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/profile_img.jpg'),
          ),
        ),
        title: const Text("My Tasks"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return const TodoTileWidget(
            status: false,
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: 10,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => CreateToDoView(),
            ),
          );
        },
        backgroundColor:
            Theme.of(context).floatingActionButtonTheme.backgroundColor,
        tooltip: "add new task",
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: SafeArea(
        child: InkWell(
          onTap: () {
            showBarModalBottomSheet(
              context: context,
              // shape: const RoundedRectangleBorder(
              //   borderRadius: BorderRadius.vertical(
              //     top: Radius.circular(15),
              //   ),
              // ),
              builder: (context) {
                return const CompletedToDoWidget();
              },
            );
          },
          child: Container(
            height: 50,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: customBlue,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Completed",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: customBlue,
                    ),
                  ],
                ),
                Text(
                  "24",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: customBlue),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CompletedToDoWidget extends StatelessWidget {
  const CompletedToDoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return const TodoTileWidget(
          status: true,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 10,
        );
      },
      itemCount: 10,
    );
  }
}
