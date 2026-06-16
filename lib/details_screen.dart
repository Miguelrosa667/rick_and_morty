import 'package:flutter/material.dart';
import 'character_model.dart';
import 'info_card.dart';

class DetailsScreen extends StatelessWidget {
  final CharacterModel character;

  const DetailsScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('Details', style: TextStyle(color: Colors.grey)),
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem de destaque com badges superiores
            Stack(
              children: [
                Image.network(
                  character.image,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Row(
                    children: [
                      Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF22C55E),
                  borderRadius: BorderRadius.circular(8),
                ),
                        child: Row(
                          children: [
                            const Icon(Icons.favorite, size: 14, color: Colors.black),
                            const SizedBox(width: 4),
                            Text(
                              character.status.toUpperCase(),
                              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), // Corrigido de py para vertical
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6), // Removido o const conflitante
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade700),
              ), // BoxDecoration
              child: Text(
                character.species,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
                    ],
                  ),
                )
              ],
            ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Informações Gerais
                  const Text(
                    'Informações Gerais',
                    style: TextStyle(color: Color(0xFF22C55E), fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  InfoCard(icon: Icons.person_outline, title: 'Gênero', value: character.gender),
                  const SizedBox(height: 12),
                  InfoCard(icon: Icons.notes, title: 'Tipo', value: character.type),
                  
                  const SizedBox(height: 24),
                  
                  // Localização
                  const Text(
                    'Localização',
                    style: TextStyle(color: Color(0xFF22C55E), fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  InfoCard(icon: Icons.public, title: 'Origem', value: character.originName),
                  const SizedBox(height: 12),
                  InfoCard(icon: Icons.location_on_outlined, title: 'Localização Atual', value: character.locationName),
                  
                  const SizedBox(height: 24),
                  
                  // Aparições
                  Text(
                    'Aparições (${character.episodes.length})',
                    style: const TextStyle(color: Color(0xFF22C55E), fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Aparece nos seguintes episódios:',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  
                  // Grid de Episódios formatados (EP 1, EP 2...)
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 2.2,
                    ),
                    itemCount: character.episodes.length,
                    itemBuilder: (context, index) {
                      // Extrai o número do episódio da URL da API
                      String url = character.episodes[index];
                      String epNumber = url.split('/').last;
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E1E1E),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade800),
                        ),
                        child: Text(
                          'EP $epNumber',
                          style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}