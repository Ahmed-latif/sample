import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:sample/model/history.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sample/utils/imports.dart';

class History extends StatelessWidget {
  History({Key? key}) : super(key: key);
  final List<HistoryItem> result = Hive.box<HistoryItem>('history')
      .values
      .toList()
      .reversed
      .toList()
      .cast<HistoryItem>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(
        context,
        'History',
        FluentIcons.delete_16_regular,
        () {
          Navigator.pop(context);
          Hive.box<HistoryItem>('history').clear();
          showToast(context, 'History cleared successfully');
        },
      ),
      body: result.isEmpty
          ? Center(
              child: Text(
                'Empty!',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: 12.0),
              ),
            )
          : ListView.separated(
              padding: EdgeInsets.all(10.0),
              itemCount: result.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 10),
              itemBuilder: (BuildContext context, int i) {
                return ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  tileColor: buttonsBackgroundColor,
                  title: Text(
                    result[i].title,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 26.0),
                  ),
                  subtitle: Text(
                    result[i].subtitle,
                    style: TextStyle(color: Colors.yellow),
                  ),
                );
              },
            ),
    );
  }
}
