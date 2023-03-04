import 'package:flutter/material.dart';

class AppBarSearch extends StatefulWidget {
  const AppBarSearch({Key? key}) : super(key: key);

  @override
  _AppBarSearchState createState() => _AppBarSearchState();
}

class _AppBarSearchState extends State<AppBarSearch> {
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _startSearch() {
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearch() {
    setState(() {
      _isSearching = false;
      _searchController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Row(
      children: [
        Expanded(
          child: isPortrait
              ? Row(
                  mainAxisAlignment: _isSearching
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.end,
                  children: [
                    if (!_isSearching)
                      IconButton(
                        onPressed: _startSearch,
                        icon: const Icon(
                          Icons.search,
                          color: Color.fromRGBO(186, 0, 0, 1),
                        ),
                      ),
                    if (_isSearching)
                      IconButton(
                        onPressed: _stopSearch,
                        icon: const Icon(
                          Icons.close,
                          color: Color.fromRGBO(186, 0, 0, 1),
                        ),
                      ),
                    if (_isSearching)
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          autofocus: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black12,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(186, 0, 0, 1),
                            ),
                            hintText: "Buscar",
                          ),
                        ),
                      ),
                  ],
                )
              : TextField(
                  controller: _searchController,
                  autofocus: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black12,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(186, 0, 0, 1),
                    ),
                    hintText: "Buscar",
                  ),
                ),
        ),
        if (!isPortrait)
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              color: Color.fromRGBO(186, 0, 0, 1),
            ),
          ),
      ],
    );
  }
}
