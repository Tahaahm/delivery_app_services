// ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:perfect_app_delivery/bloc/userBloc.dart';
import 'package:perfect_app_delivery/constant/constant.dart';
import 'package:perfect_app_delivery/models/cart_model.dart';

import 'package:perfect_app_delivery/models/product.dart';

// class SearchPage extends StatelessWidget {
//   SearchPage({Key? key}) : super(key: key);
//   TextEditingController _controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: EdgeInsets.symmetric(vertical: 55, horizontal: 10),
//         child: Column(
//           children: [
//             CustomTextField(
//               controller: _controller,
//               hintText: 'Search For Food',
//               icon: Icons.search,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:perfect_app_delivery/widgets/big_text.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _searchQuery = '';
  List<CartModel> _searchResults = [];
  bool _isLoading = false;
  bool _hasError = false;

  Future<void> _search() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });
    try {
      var url =
          Uri.parse('http://192.168.1.9:3000/api/popular?id=$_searchQuery');

      final http.Response response = await http.get(url);

      final data = jsonDecode(response.body);
      final results = data['results'] as List<dynamic>;
      final searchResults =
          results.map((result) => CartModel.fromJson(result)).toList();
      setState(() {
        _searchResults = searchResults;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: TextField(
          cursorColor: Colors.white,
          decoration: InputDecoration(
            hintText: 'Search For Food...',
            border: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
          },
          onSubmitted: (value) {
            _search();
          },
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
              color: Colors.amber,
            ))
          : _hasError
              ? Center(
                  child:
                      Text('An error occurred while fetching search results.'),
                )
              : _searchResults.isEmpty
                  ? Center(
                      child: Text('No search results.'),
                    )
                  : ListView.builder(
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        final item = _searchResults[index];
                        return ListTile(
                          title: Text(item.name!),
                          subtitle: Text(item.quantity.toString()),
                          trailing: Text('\$${item.price!.toStringAsFixed(2)}'),
                        );
                      },
                    ),
    );
  }

  Widget foodWidget() {
    return StreamBuilder(
        stream: userBloc.userController.stream,
        builder: (BuildContext buildContext,
            AsyncSnapshot<List<ProductsModel>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            );
          }
          return snapshot.connectionState == ConnectionState.active
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.amber,
                  ),
                )
              : ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading:
                            Image.network("${snapshot.data![index].image}"),
                        title: BigText(text: "${snapshot.data![index].name}"),
                      ),
                    );
                  });
        });
  }
}
