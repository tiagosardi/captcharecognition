# Captcha Number Recognition

## Pré processamento, extração de características e classificação de números. 
![Badge](https://img.shields.io/badge/Octave-v%206.1.1-lightgrey)

<!--ts-->
   * [Sobre](#Sobre)
   * [Status do projeto](#Status)
   * [Modelo](#Modelo)
   * [Arquivos](#Arquivos)
   * [Tests](#testes)
   * [Tecnologias](#tecnologias)
<!--te-->
# Sobre
Na etapa de pré-processamento, os dados de entrada são manipulados por uma variedade de métodos que fazem operações, tais como remoção de ruído, segmentação e melhoramento da qualidade dos mesmos.
Na extração de características, o objetivo é representar os dados de entrada em termos de medidas quantificáveis que possam ser utilizados facilmente na etapa de classificação.

# Status
<h4 align="center"> 
	🚧 ...  Concluído ✅
</h4>

### Features

- [x] Construção do modelo
- [x] Momentos de HU extraídos
- [x] Treino e teste
- [x] Aprendizagem
- [x] Taxa de acerto
- [x] Matriz de confusão
- [x] Teste do classificador


# Modelo
1. Para cada imagem de números fornecida, além da original, foi gerado mais 19 imagens com diferentes graus de rotações.
2. Cada imagem rotacionada foi escalada em sete escalas diferentes: 0.5, 0.75, 1,1.25, 1.5, 1.75 e 2.
3. Em cada imagem escalada foi inserido ruido tipo sal e pimenta com os seguintes valores: 0, 0.01, 0.02, 0.03 e 0.04.

# Arquivos
Os arquivos ficam localizados na pasta numbers dentro do diretório do projeto. Utilizei 10 imagens, uma para cara caractere numérico. 
Segue uma visualização:

# Testes
# Tecnologias
