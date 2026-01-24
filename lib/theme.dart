import 'package:flutter/material.dart';

// Colores extraídos del diseño del Museo Origen
class MuseoOrigenColors {
  // Colores principales
  static const Color primaryRed = Color(0xFFB33333); // Rojo profundo del fondo
  static const Color accentOrange = Color(0xFFD87234); // Naranja de los botones
  static const Color cream = Color(0xFFFFF5E6); // Crema para texto y elementos
  static const Color darkRed = Color(0xFF8B2020); // Rojo oscuro para patrones
  
  // Colores de navegación
  static const Color navGreen = Color(0xFF7A9B5C); // Verde oliva de la barra inferior
  static const Color navIconGray = Color(0xFF9E9E9E); // Gris para iconos inactivos
  
  // Colores de texto
  static const Color textLight = Color(0xFFFFFFFF); // Blanco
  static const Color textDark = Color(0xFF2E2E2E); // Negro/gris oscuro
  static const Color textSecondary = Color(0xFFCCCCCC); // Gris claro
  
  // Colores del fondo con patrón
  static const Color patternBackground = Color(0xFFB33333);
  static const Color patternOverlay = Color(0xFFC84848);
}

// Tema principal de la aplicación
class MuseoOrigenTheme {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      
      // Esquema de colores
      colorScheme: ColorScheme.fromSeed(
        seedColor: MuseoOrigenColors.primaryRed,
        primary: MuseoOrigenColors.primaryRed,
        secondary: MuseoOrigenColors.accentOrange,
        surface: MuseoOrigenColors.cream,
        error: Colors.red.shade800,
      ),
      
      // Tipografía
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: MuseoOrigenColors.textLight,
          letterSpacing: 0.5,
        ),
        displayMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: MuseoOrigenColors.textLight,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: MuseoOrigenColors.textLight,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: MuseoOrigenColors.textLight,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: MuseoOrigenColors.textLight,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: MuseoOrigenColors.textLight,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: MuseoOrigenColors.textLight,
          letterSpacing: 0.5,
        ),
      ),
      
      // Estilo de botones elevados
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: MuseoOrigenColors.accentOrange,
          foregroundColor: MuseoOrigenColors.textLight,
          elevation: 4,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      
      // Estilo de tarjetas
      cardTheme: CardThemeData(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: MuseoOrigenColors.cream,
        shadowColor: Colors.black.withValues(alpha: 0.3),
      ),
      
      // Iconos
      iconTheme: const IconThemeData(
        color: MuseoOrigenColors.textLight,
        size: 24,
      ),
      
      // Barra de navegación
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: MuseoOrigenColors.navGreen,
        selectedItemColor: MuseoOrigenColors.textLight,
        unselectedItemColor: MuseoOrigenColors.navIconGray,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      
      // Scaffold
      scaffoldBackgroundColor: MuseoOrigenColors.primaryRed,
    );
  }
}
