import 'package:flags_app/core/models/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FlagsPage extends StatefulWidget {
  const FlagsPage({super.key});

  @override
  State<FlagsPage> createState() => _FlagsPageState();
}

class _FlagsPageState extends State<FlagsPage> {
  late final TextEditingController _controller;
  late final ValueNotifier<List<Country>> _countries;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _countries = ValueNotifier<List<Country>>(countries);
  }

  void _onSearch(String text) {
    final searchedCountries = countries.where(
      (e) => e.name.toLowerCase().contains(text.toLowerCase()),
    );
    _countries.value = searchedCountries.toList();
  }

  @override
  void dispose() {
    _controller.dispose();
    _countries.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Scrollbar(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              title: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: _controller,
                    onChanged: _onSearch,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      hintText: 'Cari negara',
                    ),
                  ),
                ),
              ),
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
            ),
            ValueListenableBuilder(
              valueListenable: _countries,
              builder: (_, countries, __) {
                if (countries.isEmpty) {
                  return SliverPadding(
                    padding: EdgeInsets.only(top: height * .2),
                    sliver: const SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 50,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Pencarian tidak ditemukan',
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverMasonryGrid.count(
                    crossAxisCount: 2,
                    childCount: countries.length,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    itemBuilder: (_, index) {
                      final item = countries[index];

                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.black12,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            bottom: 20,
                            left: 20,
                            right: 20,
                          ),
                          child: Column(
                            children: [
                              Text(
                                item.flag,
                                style: const TextStyle(
                                  fontSize: 50,
                                ),
                              ),
                              Text(
                                item.name,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
