
public class Configurator
{
	String[] actualConf;
	final String arquivo = "conf.txt";

    String serial;
    int janelaAquisicao;
    boolean[] saida;
    int[] horaC, minC, segC;
    int[] horaE, minE, segE;

	public Configurator(Writer escritor)
	{
        carregarConf(escritor);
	}

	public void salvarConf(Writer escritor)
	{
		escritor.overWrite(arquivo, actualConf);
	}

	public void carregarConf(Writer escritor)
	{
		try
		{
			actualConf = loadStrings(arquivo);
		}
		catch (Exception e)
		{
			padraoConf();
            salvarConf(escritor);
		}
	}

    //carrega as configuraçoes padres para o configurador
	private void padraoConf()
	{
		actualConf = new String[]
		{
			"null",                         // ultima porta connectada com sucesso
            "300",                          // janela de aquisição
            "true true true true true true",// estado de interesse da saida
            "6 6 6 6 6 6",                  // hora de inicio do claro
            "0 0 0 0 0 0",                  // minuto de inicio do claro
            "0 0 0 0 0 0",                  // segundo de inicio do claro
            "18 18 18 18 18 18",            // hora de inicio do escuro
            "0 0 0 0 0 0",                  // minuto de inicio do escuro
            "0 0 0 0 0 0"                   // segundo de inicio do escuro
		};
	}

}