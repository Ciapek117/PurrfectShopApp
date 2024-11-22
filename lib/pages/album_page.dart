import 'package:flutter/material.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  var allItems = List.generate(20, (index) => 'item $index');
  var items = [];
  var searchHistory = [];
  final TextEditingController searchController = TextEditingController();


  @override
  void initState() {
    super.initState();
    searchController.addListener(queryListener);
  }

  @override
  void dispose() {
    searchController.removeListener(queryListener);
    searchController.dispose();
    super.dispose();
  }

  void queryListener(){
    search(searchController.text);
  }

  void search(String query){
    if(query.isEmpty){
      setState(() {
        items = allItems;
      });
    } else {
      setState(() {
        items = allItems.where((e) => e.toLowerCase().contains(query.toLowerCase())).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5F0F40),
      body: Center(child: Padding(padding: const EdgeInsets.fromLTRB(8, 10, 8, 0), child: Column(
            children: <Widget>[
              SearchBar(
                controller: searchController,
                hintText: 'Search..',
                leading: IconButton(
                    onPressed: (){}, 
                    icon: Icon(Icons.search, color: Color(0xFF5F0F40), size: 30))),

              Expanded(
                child: ListView.builder(
                    itemCount: items.isEmpty ? allItems.length : items.length,
                    itemBuilder: (context, index) {
                      final item = items.isEmpty ? allItems[index] : items[index];
                
                      return Card(
                        child: Column(children: [
                          Text('Name: $item'),
                          const SizedBox(height: 8),
                          Text(item),
                        ]));
                    }),
              )
            ]
        )))
    );
  }
}
