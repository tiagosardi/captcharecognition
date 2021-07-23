function image_data = padrao()
  pkg load image;
  endereco='numbers/';
  arquivos=dir(fullfile(endereco,['*.jpg']));
  quant_img = length(arquivos);
  
  %Queremos criar 19 imagens com rotações diferentes para cada
  %imagem contida no diretorio
  qtdeRotacao=19;
  
  %Para cada imagem rotacionada, alem das imagens do diretorio,
  %criei mais 7 imagens com escalas diferentes
  qtdeEscala=7;
  
  %para cada imagem rotacionada, escalada e proveniente do diretorio
  %criei mais 5 imagens com ruidos sal e pimenta com diferentes intensidades
  qtdeRuido=5;
  image_data=cell(1,qtdeRotacao*qtdeEscala*qtdeRuido);
  contador=1;
  tamanhoImg=.5;
  ruido=0;
  
  passoOriginal= (qtdeEscala*qtdeRuido+qtdeEscala)*qtdeRotacao+qtdeRotacao;
  passoRotacao = qtdeEscala*qtdeRuido+qtdeEscala;
  for i=1: passoOriginal+1:length(arquivos)*qtdeRotacao*qtdeEscala*qtdeRuido
  img = imread(fullfile(endereco , arquivos(contador,1).name));
    image_data{i}=img;
    disp("original: "), disp(i);
    for j=i+1:passoRotacao+1:i+passoRotacao*qtdeRotacao
      num = floor(1 + (360-1)*rand(1,1));
      image_data{j}=imrotate(image_data{i}, num);
      %disp("rotacao: "), disp(j);
      for k=j+1:qtdeRuido+1:j+passoRotacao%j+qtdeEscala+qtdeRuido
        image_data{k}=imresize(image_data{j},tamanhoImg);
        %disp("escala: "), disp(k);
        tamanhoImg=tamanhoImg+.25;
        for l=k+1:k+qtdeRuido
          image_data{l}=imnoise(image_data{k},"salt & pepper",ruido);
          %disp("ruido: "), disp(l);
          ruido=ruido+.01;
        endfor
        ruido=0;
      endfor
      tamanhoImg=.5;
    endfor
    contador=contador+1;
    if contador==length(arquivos)+1
      break;
    endif
  endfor
