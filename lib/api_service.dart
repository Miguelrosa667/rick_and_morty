import 'package:dio/dio.dart';
import 'character_model.dart';

class ApiService {
  final Dio _dio = Dio();
  final String _url = 'https://rickandmortyapi.com/api/character';

  Future<List<CharacterModel>> fetchCharacters() async {
    try {
      final response = await _dio.get(_url);
      if (response.statusCode == 200) {
        final List results = response.data['results'];
        return results.map((json) => CharacterModel.fromJson(json)).toList();
      } else {
        throw Exception('Erro ao carregar personagens');
      }
    } catch (e) {
      throw Exception('Falha na conexão com a API: $e');
    }
  }
}