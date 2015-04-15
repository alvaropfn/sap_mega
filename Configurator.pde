
public class Configurator
{
	String[] actualConf;
	String arquivo = "conf.txt";

	public Configurator ()
	{
		actualConf = loadStrings(arquivo);
		if(actualConf.length <= 0) actualConf = padraoConf();
	}

	public void salvarConf(Writer writer)
	{
		writer.overWrite(arquivo, actualConf);
	}

	public void carregarConf()
	{
		try
		{
			
		}
		catch (Exception e)
		{
			
		}
	}

	private String[] padraoConf()
	{
		String temp[] = new String[]
		{
			"null",
			"true, true, true, false, true, true, true"
		};

		return temp;
	}

}

/*
void Carregar_Config()
{ //utiliza o arquivo Config.txt para iniciar e continuar o ciclo anteriormente iniciado.
  long tempo_transicao,tempo_atual;
  String[] linha=loadStrings("config.txt"); //carrega o arquivo em linhas
  if(linha!=null){ //se existir o arquivo config.txt
    String[] pedacos={"","","",""}; //receberá {estado tempo_transicao tempo_claro tempo_escuro} para cada saida.
    String[] hhmmss={"","",""}; //hora,minuto e segundo apos atualizacao
    String[] am_pm={"",""}; //saber se é PM ou AM
    for(int i=0;i<6;i++){
      println(linha[i]);
      pedacos=split(linha[i],' '); //quebra cada linha em pedacos
      
      if(int(pedacos[2]) > 0){ //se existir algo no tempo_claro, atualiza hc, mc e sc.
        int seg_claro= int(pedacos[2]);
        textbox[i].get(Textfield.class,"hc").setText(str(seg_claro/3600));
        seg_claro -= (int(seg_claro/3600)) * 3600;
        textbox[i].get(Textfield.class,"mc").setText(str(seg_claro/60));
        seg_claro -= (int(seg_claro/60)) * 60;
        textbox[i].get(Textfield.class,"sc").setText(str(seg_claro));
      } 
      if(int(pedacos[3]) > 0){ //se existir algo no tempo_escuro, atualiza he,me,se.
        int seg_esc= int(pedacos[3]);
        textbox[i].get(Textfield.class,"he").setText(str(seg_esc/3600));
        seg_esc -= (int(seg_esc/3600)) * 3600;
        textbox[i].get(Textfield.class,"me").setText(str(seg_esc/60));
        seg_esc -= (int(seg_esc/60)) * 60;
        textbox[i].get(Textfield.class,"se").setText(str(seg_esc));
      }
      
      Date agora = new Date();
      tempo_atual = (agora.getTime())/1000; //.getTime retorna em milésimo de segundo, então tempo_atual terá o número de segundos até agora.
      tempo_transicao=(Long.parseLong(pedacos[1])); //tempo em segundos da próxima transição.
      int cont=0; //conta as vezes que alterou o sinal 
      if(int(pedacos[2])!=0||int(pedacos[3])!=0){ //se existir algo em claro ou em escuro, carrega campo transicao.
        while(tempo_transicao<=tempo_atual && cont<10000){//caso a proxima transicao seja menor do que a hora atual e o periodo desligado seja menor do que 10000 transicoes
          if(int(pedacos[0]) == 0){ //se estiver escuro
            if(cont%2==0) tempo_transicao+=int(pedacos[2]);//se estive escuro, some o periodo de "claro"
            else tempo_transicao+=int(pedacos[3]); //se estive claro, some o periodo de "claro"
          }
          else{
            if(cont%2==0) tempo_transicao+=int(pedacos[3]);
            else tempo_transicao+=int(pedacos[2]);
          }
          cont++;        
        }
        //carregar a novo período de transiçao em ht,mt,st.
        Date date = new Date(tempo_transicao*1000); 
        DateFormat hora = DateFormat.getTimeInstance();
        hhmmss=split(hora.format(date),':');
        
        if(hhmmss[2].length()>2){ //caso nao esteja no formato 24h. ou seja, existe PM ou AM no fim do vetor.
          am_pm=split(hhmmss[2],' ');
          if(am_pm[1].equals("PM") && !hhmmss[0].equals("12")) hhmmss[0]=str(int(hhmmss[0])+12); //Para Windows
        }
        textbox[i].get(Textfield.class,"ht").setText(hhmmss[0]);
        textbox[i].get(Textfield.class,"mt").setText(hhmmss[1]);
        textbox[i].get(Textfield.class,"st").setText(hhmmss[2]);
        //inicia com claro ou escuro. Como o botão set() será pressionado, devo iniciar com valores invertidos.
        if((cont%2)==1) estado_saida[i]=int(pedacos[0]); //se cont for impar, não preciso alterar o sinal.
        else if(int(pedacos[0])==0) estado_saida[i]=1;  // se cont for par, preciso alterar o sinal.
        else estado_saida[i]=0;
        println(hora.format(date));  
      }
      else{
        if(int(pedacos[0])==0) estado_saida[i]=1; //sempre inverte uma vez a luz para manter igual a como estava quando vier o set().
        else estado_saida[i]=0;
      }   
    }
    janela.get(Numberbox.class,"tamanho_janela(s)").setValue(Float.parseFloat(linha[6]));//atualiza o tamanho da janela para salvar
    set(); //atualiza dados e inverte luzes.
  }
}
*/