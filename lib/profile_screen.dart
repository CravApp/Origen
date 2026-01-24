import 'package:flutter/material.dart';
import 'theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                // Header con foto de perfil
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: MuseoOrigenColors.accentOrange,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: MuseoOrigenColors.cream,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: MuseoOrigenColors.textLight,
                            width: 4,
                          ),
                        ),
                        child: const Icon(
                          Icons.person_rounded,
                          size: 60,
                          color: MuseoOrigenColors.accentOrange,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Usuario Visitante',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'usuario@email.com',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: MuseoOrigenColors.textLight.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                
                // Opciones de perfil
                _buildProfileOption(
                  context,
                  icon: Icons.history_rounded,
                  title: 'Historial de Visitas',
                  subtitle: 'Ver visitas anteriores',
                  onTap: () {},
                ),
                const SizedBox(height: 16),
                
                _buildProfileOption(
                  context,
                  icon: Icons.favorite_rounded,
                  title: 'Favoritos',
                  subtitle: 'Obras guardadas',
                  onTap: () {},
                ),
                const SizedBox(height: 16),
                
                _buildProfileOption(
                  context,
                  icon: Icons.settings_rounded,
                  title: 'Configuración',
                  subtitle: 'Ajustes de la app',
                  onTap: () {},
                ),
                const SizedBox(height: 16),
                
                _buildProfileOption(
                  context,
                  icon: Icons.info_rounded,
                  title: 'Acerca del Museo',
                  subtitle: 'Información y contacto',
                  onTap: () {},
                ),
                const SizedBox(height: 32),
                
                // Botón de cerrar sesión
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: OutlinedButton(
                    onPressed: () {
                      // Acción de cerrar sesión
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: MuseoOrigenColors.textLight,
                      side: const BorderSide(
                        color: MuseoOrigenColors.cream,
                        width: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.logout_rounded),
                        const SizedBox(width: 8),
                        Text(
                          'Cerrar Sesión',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
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
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: MuseoOrigenColors.accentOrange,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: 28,
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
                        color: MuseoOrigenColors.textDark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: MuseoOrigenColors.textDark.withValues(alpha: 0.7),
                      ),
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
