# 🏛️ Museo Origen - Documentación Técnica

## 📱 Descripción General
Aplicación móvil Flutter para el **Museo Origen** (Museo Moderno de Arte) que replica el diseño visual mostrado en las capturas de pantalla proporcionadas.

## 🎨 Análisis de Estilo Visual

### Paleta de Colores Extraída
Basándose en las capturas de pantalla del diseño:

```dart
// Colores principales
primaryRed: #B33333      // Rojo profundo del fondo con patrón
accentOrange: #D87234    // Naranja de los botones de acción
cream: #FFF5E6           // Crema para inputs y tarjetas
darkRed: #8B2020         // Rojo oscuro para patrones de fondo

// Colores de navegación
navGreen: #7A9B5C        // Verde oliva de la barra inferior
navIconGray: #9E9E9E     // Gris para iconos inactivos

// Colores de texto
textLight: #FFFFFF       // Blanco para texto sobre rojo
textDark: #2E2E2E        // Negro/gris oscuro para tarjetas
```

### Identidad Visual
- **Patrón de fondo**: Círculos concéntricos inspirados en arte prehispánico
- **Logo**: Diseño circular con geometría mesoamericana
- **Tipografía**: Sans-serif moderna, alta legibilidad
- **Estilo**: Material Design 3 personalizado con elementos culturales

## 🏗️ Arquitectura de la Aplicación

### Estructura de Pantallas

**1. Splash Screen** (`splash_screen.dart`)
- Animación de entrada con logo
- Transición automática a login (3 segundos)
- Fondo con patrón prehispánico

**2. Login Screen** (`login_screen.dart`)
- Campos de usuario y contraseña
- Botón "Iniciar Sesión"
- Opción "¿Olvidaste tu contraseña?"
- Botón "Crear" para registro
- Diseño fiel a la captura de pantalla

**3. Home Screen** (`home_screen.dart`)
- Logo y mensaje de bienvenida
- Tres opciones principales:
  - 📁 **Explorar por temática**: Descubre según interés
  - 🗺️ **Ruta recomendada**: Recorrido estructurado
  - 🔍 **Buscar Obra/Objeto**: Por nombre o código
- Barra de navegación inferior con 4 secciones

**4. Explore Screen** (`explore_screen.dart`)
- Lista de temáticas del museo:
  - Arte Prehispánico
  - Época Colonial
  - México Independiente
  - Arte Contemporáneo
  - Culturas Populares
- Tarjetas con iconos descriptivos

**5. Map Screen** (`map_screen.dart`)
- Vista simulada de navegación AR
- Indicador de dirección: "Avanza 3 metros hacia Huacos retratos"
- Botones flotantes (ubicación, zoom +/-, capas)
- Panel inferior con:
  - Botón cancelar (X)
  - Temporizador: "5 minutos"
  - Botón información (i)
- Replica la pantalla 4 del diseño

**6. Search Screen** (`search_screen.dart`)
- Barra de búsqueda con placeholder "Ingresa el nombre o código"
- Resultados con tarjetas de obras/objetos
- Información: título, descripción, ubicación en el museo
- Estado vacío con ícono de búsqueda

**7. Profile Screen** (`profile_screen.dart`)
- Foto de perfil circular
- Información del usuario
- Opciones:
  - Historial de Visitas
  - Favoritos
  - Configuración
  - Acerca del Museo
- Botón "Cerrar Sesión"

### Widgets Flutter Utilizados

```dart
// Layout y estructura
- Scaffold: Estructura base de cada pantalla
- SafeArea: Previene solapamiento con notch/barra de estado
- Container: Contenedores con decoración personalizada
- Column/Row: Disposición vertical/horizontal
- Stack: Superposición de elementos (mapa AR)
- ListView: Listas desplazables (temáticas, resultados)
- SingleChildScrollView: Scroll para contenido extenso

// Interacción
- InkWell: Efectos de toque en tarjetas
- IconButton: Botones de iconos
- ElevatedButton: Botones principales (naranja)
- OutlinedButton: Botones secundarios (borde)
- TextField: Campos de entrada de texto
- BottomNavigationBar: Navegación inferior

// Decoración
- BoxDecoration: Bordes, sombras, gradientes
- BorderRadius: Esquinas redondeadas
- BoxShadow: Sombras para profundidad
- Gradient: Degradados de color
- Image.asset: Imágenes desde assets

// Animación
- AnimationController: Control de animaciones
- FadeTransition: Transición de opacidad
- ScaleTransition: Transición de escala
- HapticFeedback: Retroalimentación táctil
```

## 📂 Estructura de Archivos

```
lib/
├── main.dart               # Punto de entrada, configuración de app
├── theme.dart              # Colores, estilos, tema global
├── splash_screen.dart      # Pantalla de splash animada
├── login_screen.dart       # Pantalla de autenticación
├── home_screen.dart        # Pantalla principal con opciones
├── explore_screen.dart     # Exploración por temáticas
├── map_screen.dart         # Navegación AR/mapa del museo
├── search_screen.dart      # Búsqueda de obras/objetos
└── profile_screen.dart     # Perfil de usuario

assets/
├── icon/
│   └── app_icon.png        # Ícono de la aplicación
└── images/                 # Imágenes adicionales (futuro)
```

## 🎯 Características Implementadas

### ✅ Diseño Visual
- Replicación fiel de las 4 pantallas de referencia
- Paleta de colores extraída del diseño original
- Patrón de fondo con iconografía prehispánica
- Tipografía y espaciado consistente

### ✅ Navegación
- Sistema de navegación bottom navigation (4 secciones)
- Transiciones entre pantallas
- Navegación jerárquica con botones de retorno

### ✅ UI/UX
- Animaciones de entrada en splash screen
- Retroalimentación táctil en interacciones
- Estados de carga y vacíos
- Campos de texto interactivos
- Tarjetas con sombras y elevación

### ✅ Orientación
- Forzada a modo portrait (vertical)
- Optimizada para smartphones

### ✅ Tematización
- Tema global personalizado en `theme.dart`
- Consistencia en colores y estilos
- Material Design 3 con identidad cultural

## 🚀 Tecnologías Utilizadas

```yaml
dependencies:
  flutter: ^3.35.4
  cupertino_icons: ^1.0.8
  provider: 6.1.5+1          # State management
  shared_preferences: 2.5.3  # Local storage
```

## 🎨 Decisiones de Diseño

### Fondo con Patrón
- Se utiliza el logo/ícono de la app con opacidad reducida
- Repetición en modo tile para crear patrón
- Inspiración: Arte prehispánico mesoamericano

### Colores
- **Rojo primario**: Representa fuerza, historia, tierra
- **Naranja acento**: Calidez, accesibilidad, acción
- **Verde navegación**: Naturaleza, equilibrio
- **Crema**: Contraste suave, legibilidad

### Tipografía
- Sans-serif para claridad y modernidad
- Jerarquía clara: Display > Title > Body
- Letter-spacing aumentado para títulos (estilo monumental)

### Espaciado
- Padding generoso (24px) para respiración visual
- Bordes redondeados (12-28px) para suavidad
- Sombras sutiles para profundidad

## 📱 Responsive Design
- Diseño optimizado para móviles (portrait)
- SafeArea para manejo de notch
- SingleChildScrollView para contenido extenso
- Elementos táctiles con tamaño mínimo 48x48dp

## 🔮 Mejoras Futuras (No Implementadas)
- Integración con Firebase para autenticación real
- Base de datos de obras/objetos del museo
- Implementación real de AR con AR Core/AR Kit
- Búsqueda con filtros avanzados
- Historial de visitas con fechas
- Sistema de favoritos persistente
- QR code scanning para obras
- Audio guías
- Mapas de planos reales del museo
- Multilenguaje (ES/EN)

## 💡 Notas de Implementación

### Simulaciones
Como esta es una versión de demostración:
- **Login**: No valida credenciales, navega directamente
- **AR/Mapa**: Vista simulada con gradientes
- **Búsqueda**: Datos mock en memoria
- **Navegación AR**: Texto estático de ejemplo

### Producción
Para versión de producción se necesitaría:
- Firebase Authentication
- Cloud Firestore para datos
- Firebase Storage para imágenes
- AR Core/AR Kit para navegación real
- APIs del museo para contenido actualizado

## 🏛️ Contexto Cultural

La aplicación refleja la identidad del **Museo Origen** con:
- Patrones geométricos prehispánicos
- Paleta terracota/rojo (cerámica ancestral)
- Iconografía circular (calendarios, cosmos)
- Balance entre modernidad y tradición

## 📞 Soporte y Documentación

Para más información sobre Flutter y los widgets utilizados:
- [Flutter Documentation](https://docs.flutter.dev/)
- [Material Design 3](https://m3.material.io/)
- [Flutter Widget Catalog](https://docs.flutter.dev/ui/widgets)

---

**Desarrollado con Flutter 3.35.4**  
**Basado en diseño de referencia del Museo Origen**
