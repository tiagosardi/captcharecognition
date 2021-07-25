function [treino,teste] = padrao()
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
  image_data=cell(length(arquivos),qtdeRotacao*qtdeEscala*qtdeRuido);

  tamanhoImg=.5;
  ruido=0;
  passoOriginal= (qtdeEscala*qtdeRuido+qtdeEscala)*qtdeRotacao+qtdeRotacao;
  passoRotacao = qtdeEscala*qtdeRuido+qtdeEscala;
  m=1;
  humom=[];
  for i=1:length(arquivos)
    img = imread(fullfile(endereco , arquivos(i,1).name));
    disp("Loading: "), disp(length(arquivos)-i);
    image_data{i,1}=img;
    
    for j=2:passoRotacao+1:i+passoRotacao*qtdeRotacao
      num = floor(1 + (360-1)*rand(1,1));
      image_data{i,j}=imrotate(image_data{i,1}, num);
      %disp("rotacao: "), disp(j);
      for k=j+1:qtdeRuido+1:j+passoRotacao
        image_data{i,k}=imresize(image_data{i,j},tamanhoImg);
        %disp("escala: "), disp(k);
        tamanhoImg=tamanhoImg+.25;
        for l=k+1:k+qtdeRuido
          image_data{i,l}=imnoise(image_data{i,k},"salt & pepper",ruido);
          ruido=ruido+.01;
          humom=[humom;humoments(image_data{i,l})];
          etiqueta(m,:)=i-1;
          %separando em conjuntos treino e teste
          [treino, teste] = amostra(humom(m,:),25);
          m++;
        endfor
        ruido=0;
      endfor
      tamanhoImg=.5;
    endfor
  endfor
  
  
  