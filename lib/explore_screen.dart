import 'package:flutter/material.dart';
import 'theme.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

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
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Text(
                    'Explora por Temática',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Descubre las colecciones del museo',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: MuseoOrigenColors.textLight.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ),
            
            // Lista de temáticas
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  _buildThemeCard(
                    context,
                    'Arte Prehispánico',
                    'Explora las civilizaciones mesoamericanas',
                    Icons.account_balance_rounded,
                  ),
                  const SizedBox(height: 16),
                  _buildThemeCard(
                    context,
                    'Época Colonial',
                    'Descubre el arte virreinal',
                    Icons.church_rounded,
                  ),
                  const SizedBox(height: 16),
                  _buildThemeCard(
                    context,
                    'México Independiente',
                    'Arte del siglo XIX',
                    Icons.flag_rounded,
                  ),
                  const SizedBox(height: 16),
                  _buildThemeCard(
                    context,
                    'Arte Contemporáneo',
                    'Obras modernas y actuales',
                    Icons.brush_rounded,
                  ),
                  const SizedBox(height: 16),
                  _buildThemeCard(
                    context,
                    'Culturas Populares',
                    'Tradiciones y artesanías',
                    Icons.festival_rounded,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
  ) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // Navegar a detalle de temática
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: MuseoOrigenColors.accentOrange,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
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
                  color: MuseoOrigenColors.textLight.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
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
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: MuseoOrigenColors.textLight.withValues(alpha: 0.9),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: MuseoOrigenColors.textLight.withValues(alpha: 0.7),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
