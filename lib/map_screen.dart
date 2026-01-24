import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'theme.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  int _selectedFloor = 0;
  String _navigationStatus = 'Avanza 3 metros hacia\nHuacos retratos';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            MuseoOrigenColors.darkRed,
            MuseoOrigenColors.primaryRed,
          ],
        ),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            // Área del mapa (simulado con imagen de museo)
            Positioned.fill(
              child: Container(
                margin: const EdgeInsets.only(bottom: 100),
                child: Column(
                  children: [
                    // Header con título
                    Container(
                      padding: const EdgeInsets.all(16),
                      color: Colors.black.withValues(alpha: 0.3),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.navigation_rounded,
                            color: MuseoOrigenColors.textLight,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Navegación AR',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                    ),
                    
                    // Área de visualización del mapa/AR
                    Expanded(
                      child: Stack(
                        children: [
                          // Simulación de vista AR con gradiente
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  const Color(0xFF8B7355),
                                  const Color(0xFFD4A76A),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.museum_rounded,
                                    size: 100,
                                    color: Colors.white.withValues(alpha: 0.3),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Vista AR del Museo',
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      color: Colors.white.withValues(alpha: 0.7),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          
                          // Indicador de navegación superior
                          Positioned(
                            top: 16,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      MuseoOrigenColors.accentOrange,
                                      const Color(0xFFE89B3C),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.3),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.arrow_upward_rounded,
                                      color: MuseoOrigenColors.textLight,
                                      size: 24,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      _navigationStatus,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          
                          // Botones de acción flotantes (derecha)
                          Positioned(
                            right: 16,
                            top: 100,
                            child: Column(
                              children: [
                                _buildFloatingButton(
                                  Icons.my_location_rounded,
                                  () {},
                                ),
                                const SizedBox(height: 12),
                                _buildFloatingButton(
                                  Icons.add_rounded,
                                  () {},
                                ),
                                const SizedBox(height: 12),
                                _buildFloatingButton(
                                  Icons.remove_rounded,
                                  () {},
                                ),
                                const SizedBox(height: 12),
                                _buildFloatingButton(
                                  Icons.layers_rounded,
                                  () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Panel inferior con temporizador y controles
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: MuseoOrigenColors.cream,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 12,
                      offset: const Offset(0, -4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Botón cancelar
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: MuseoOrigenColors.accentOrange,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.close_rounded,
                          color: MuseoOrigenColors.textLight,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    
                    // Temporizador
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: MuseoOrigenColors.accentOrange,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.access_time_rounded,
                            color: MuseoOrigenColors.textDark,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '5 minutos',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: MuseoOrigenColors.textDark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // Botón de información
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: MuseoOrigenColors.accentOrange,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.info_outline_rounded,
                          color: MuseoOrigenColors.textLight,
                        ),
                        onPressed: () {
                          // Mostrar información
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingButton(IconData icon, VoidCallback onPressed) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: MuseoOrigenColors.accentOrange,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(
          icon,
          color: MuseoOrigenColors.textLight,
          size: 24,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
