import 'package:flutter/material.dart';
import 'theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  List<Map<String, dynamic>> _searchResults = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch(String query) {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
      });
      return;
    }

    // Datos de ejemplo (en producción vendría de Firebase)
    final mockData = [
      {
        'title': 'Huacos Retratos',
        'description': 'Cerámica precolombina de la cultura Moche',
        'location': 'Sala 3 - Arte Prehispánico',
        'code': 'HP-001',
      },
      {
        'title': 'Piedra del Sol',
        'description': 'Réplica del calendario azteca',
        'location': 'Sala 1 - Entrada Principal',
        'code': 'PS-002',
      },
      {
        'title': 'Máscara de Jade',
        'description': 'Máscara funeraria maya',
        'location': 'Sala 2 - Culturas Mesoamericanas',
        'code': 'MJ-003',
      },
    ];

    setState(() {
      _searchResults = mockData
          .where((item) =>
              item['title'].toString().toLowerCase().contains(query.toLowerCase()) ||
              item['code'].toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MuseoOrigenColors.primaryRed,
        image: DecorationImage(
          image: const AssetImage('assets/icon/app_icon.png'),
          fit: BoxFit.none,
          opacity: 0.06,
          repeat: ImageRepeat.repeat,
          scale: 12,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          color: MuseoOrigenColors.textLight,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Buscar Obra/Objeto',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Campo de búsqueda
                  Container(
                    decoration: BoxDecoration(
                      color: MuseoOrigenColors.cream,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _searchController,
                      style: const TextStyle(color: MuseoOrigenColors.textDark),
                      onChanged: _performSearch,
                      decoration: InputDecoration(
                        hintText: 'Ingresa el nombre o código',
                        hintStyle: TextStyle(
                          color: MuseoOrigenColors.textDark.withValues(alpha: 0.5),
                        ),
                        prefixIcon: const Icon(
                          Icons.search_rounded,
                          color: MuseoOrigenColors.textDark,
                        ),
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                                icon: const Icon(
                                  Icons.clear_rounded,
                                  color: MuseoOrigenColors.textDark,
                                ),
                                onPressed: () {
                                  _searchController.clear();
                                  _performSearch('');
                                },
                              )
                            : null,
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Resultados de búsqueda
            Expanded(
              child: _searchResults.isEmpty && _searchController.text.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_rounded,
                            size: 80,
                            color: MuseoOrigenColors.textLight.withValues(alpha: 0.3),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Busca por nombre o código',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: MuseoOrigenColors.textLight.withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ),
                    )
                  : _searchResults.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search_off_rounded,
                                size: 80,
                                color: MuseoOrigenColors.textLight.withValues(alpha: 0.3),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'No se encontraron resultados',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: MuseoOrigenColors.textLight.withValues(alpha: 0.6),
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          itemCount: _searchResults.length,
                          itemBuilder: (context, index) {
                            final item = _searchResults[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: _buildResultCard(context, item),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultCard(BuildContext context, Map<String, dynamic> item) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // Navegar a detalle del objeto
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: MuseoOrigenColors.cream,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: MuseoOrigenColors.accentOrange,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.museum_rounded,
                  size: 32,
                  color: MuseoOrigenColors.textLight,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title'],
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: MuseoOrigenColors.textDark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['description'],
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: MuseoOrigenColors.textDark.withValues(alpha: 0.7),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          size: 14,
                          color: MuseoOrigenColors.accentOrange,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            item['location'],
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: MuseoOrigenColors.accentOrange,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: MuseoOrigenColors.textDark.withValues(alpha: 0.4),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
