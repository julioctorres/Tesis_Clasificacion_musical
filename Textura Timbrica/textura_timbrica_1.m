Tw = 25;                % Duracion de la trama de analisis (ms)
Ts = 10;                % Cambio de trama de analisis (ms)
t1= 90;
t2= 91;

for i=1:4
	if (i==1)
		wav_file =glob('canciones/pasillo_fiestero/*.wav');
		file1 =glob('canciones/pasillo_fiestero/*.wav');
		w=length(wav_file);
		vec_caract_bam=zeros(10,w*98);
	elseif (i==2)
		wav_file =glob('canciones/pasillo_vocal/*.wav');
		file2 =glob   ('canciones/pasillo_vocal/*.wav');
		w=length(wav_file);
		vec_caract_cur=zeros(10,w*98);
	elseif(i==3)
		wav_file =glob('canciones/otros/*.wav');
		file3 =glob('canciones/otros/*.wav');
		w=length(wav_file);
		vec_caract_jor=zeros(10,w*98);

	end

	for canciones=1:w
		wav=wav_file(canciones,1);
		wav=char(wav);
		vec_caract = vector_tex_tim(wav,t=[t1 t2],Tw,Ts); %%% cálculo del vector de características
    if (i==1)
				vec_caract_bam =[vec_caract];
				vec_caract_bam=vec_caract_bam';
        vec_caract_bam=[mean(vec_caract_bam);std(vec_caract_bam)]
				long=size(vec_caract_bam)(1);
        filename_bam=sprintf('graficas/pasillo_fiestero/textura_timbrica_ps %d.csv',canciones);
        csvwrite(filename_bam,[vec_caract_bam]);
			for canc= 1:long
				printf("%0.10f,",vec_caract_bam(canc,:));   
				printf("%s",char(wav_file(canciones,1)));
				printf("%s", ",pasillo_fiestero"); 
				printf("\n");
			end
		elseif (i==2)
			vec_caract_cur=[vec_caract];
			vec_caract_cur=vec_caract_cur';
      vec_caract_cur=[mean(vec_caract_cur);std(vec_caract_cur)]
			long=size(vec_caract_cur)(1);
      filename_cur=sprintf('graficas/pasillo_vocal/textura_timbrica_pv %d.csv',canciones);
      csvwrite(filename_cur,[vec_caract_cur]);
			for canc= 1:long
				printf("%0.10f,",vec_caract_cur(canc,:));   
				printf("%s",char(wav_file(canciones,1)));
				printf("%s", ",pasillo_vocal");
				printf("\n");
			end
		elseif (i==3)
			vec_caract_jor=[vec_caract];
			vec_caract_jor=vec_caract_jor';
      vec_caract_jor=[mean(vec_caract_jor);std(vec_caract_jor)]
			long=size(vec_caract_jor)(1);
      filename_jor=sprintf('graficas/otros/textura_timbrica_o %d.csv',canciones);
      csvwrite(filename_jor,[vec_caract_jor]);
			for canc= 1:long
				printf("%0.10f,",vec_caract_jor(canc,:));   
				printf("%s",char(wav_file(canciones,1)));
				printf("%s", ",otros");
				printf("\n");
			end
		end
	end            
end
cell2csv('graficas/nombres.csv',[file1;file2;file3]);