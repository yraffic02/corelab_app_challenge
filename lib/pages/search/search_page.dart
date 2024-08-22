import 'package:corelab_app_challenge/blocs/history/history_bloc.dart';
import 'package:corelab_app_challenge/blocs/history/history_event.dart';
import 'package:corelab_app_challenge/blocs/history/history_state.dart';
import 'package:corelab_app_challenge/blocs/products/product_bloc.dart';
import 'package:corelab_app_challenge/blocs/products/product_event.dart';
import 'package:corelab_app_challenge/blocs/products/product_state.dart';
import 'package:corelab_app_challenge/model/history_model.dart';
import 'package:corelab_app_challenge/model/product_model.dart';
import 'package:corelab_app_challenge/shared/CustomProductCard/custom_product_card.dart';
import 'package:flutter/material.dart';
import 'package:corelab_app_challenge/shared/CustomLayout/custom_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();
  late final ProductBloc _productBloc;
  late final HistoryBloc _historyBloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
    _productBloc = ProductBloc();
    _historyBloc = HistoryBloc();
    _historyBloc.add(GetHistory());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>.value(
          value: _productBloc,
        ),
        BlocProvider<HistoryBloc>.value(
          value: _historyBloc,
        ),
      ],
      child: BlocListener<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is ProductLoadedState) {
            setState(() {});
          }
        },
        child: CustomLayout(
          focusNode: _focusNode,
          searchController: _searchController,
          child: BlocBuilder<HistoryBloc, HistoryState>(
              builder: (context, stateHistory) {
            return BlocBuilder<ProductBloc, ProductState>(
              builder: (context, stateProduct) {
                if (stateProduct is ProductLoadedState) {
                  if (stateProduct.products.isEmpty) {
                    return Container(
                      color: const Color(0xFFEFEFEF),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('lib/assets/rafiki.png'),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Resultado não encontrado',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(0, 36, 41, 1),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Não encontramos nenhum resultado parecido com "chinelo".',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(74, 101, 105, 1),
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    );
                  } else {
                    return _buildProductList(stateProduct.products);
                  }
                }

                if (stateProduct is ProductLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFF00B4CC),
                    ),
                  );
                }

                if (stateHistory is HistoryLoadedState &&
                    stateProduct.products.isEmpty) {
                  final historyList = stateHistory.historys;
                  return _buildHistoryList(historyList);
                }

                if (stateProduct is ResetProducts &&
                    stateHistory is HistoryLoadedState) {
                  final historyList = stateHistory.historys;
                  return _buildHistoryList(historyList);
                }

                return const SizedBox();
              },
            );
          }),
        ),
      ),
    );
  }

  Widget _buildHistoryList(List<HistoryModel> historyList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 25, 0, 10),
          child: Text(
            'Pesquisas recentes',
            style: TextStyle(
                color: Color.fromRGBO(0, 36, 41, 1),
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: historyList.length,
            itemBuilder: (context, index) {
              final item = historyList[index];
              return ListTile(
                leading: const Icon(
                  Icons.access_time,
                  color: Color.fromRGBO(124, 144, 148, 1),
                ),
                title: Text(
                  item.history,
                  style: const TextStyle(
                      color: Color.fromRGBO(124, 144, 148, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  _searchController.text = item.history;
                  _productBloc.add(SearchProducts(query: item.history));
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProductList(List<ProductModel> list) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 25, 0, 10),
          child: Text(
            '${list.length} resultados encontrados',
            style: const TextStyle(
                color: Color.fromRGBO(0, 36, 41, 1),
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final ProductModel item = list[index];
              return ProductCard(
                image: item.image,
                productName: item.productName,
                price: item.price,
                info: item.info,
                isNew: item.isNew,
                discountPercentage: item.discountPercentage,
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _productBloc.close();
    _historyBloc.close();
    super.dispose();
  }
}
