import java.util.Date;
import java.text.SimpleDateFormat;

public class ClockMaster
{
	SimpleDateFormat sdf, hms;
	int sec, nxt, contador, janelaAquisicao;

	private final int qtd_saidas_dig = 6;
	private final int qtd_entradas_ana = 16;
	private final int qtd_entradas_dig = 46;
	
	ClockConf[] clockConfs;

	public ClockMaster()
	{
		clockConfs = new ClockConf[qtd_saidas_dig];

		sdf = new SimpleDateFormat("yyyy/MM/dd");
		hms = new SimpleDateFormat("HH:mm:ss");
		
		sec = segundo();
		contador = 0;
	}

	//ciclo de eventos a cada segundo
	void cicle(ArduinoCOM arduinoCom, Displayer displayer)
	{
		nxt = segundo();
		if(sec != nxt)
		{
			sec = nxt;
			contador++;

			displayer.checarTabPotas(arduinoCom);

			displayer.updateFeedbacksAna
			(
				arduinoCom.leituraInternaAnaComoDig(),
				arduinoCom.getDadosAna()
			);

			displayer.updateFeedbacksDig
			(
				arduinoCom.leituraInternaDig(),
				arduinoCom.getDadosDig()
			);

			if(contador >= janelaAquisicao)
			{
				contador = 0;

			}

		}
	}

	public void carregarConf(Configurator configurador)
	{
		clockConfs = new ClockConf[qtd_saidas_dig];

		for (int i = 0; i < qtd_saidas_dig; ++i)
		{
			clockConfs[i] = new ClockConf(configurador, i);
			clockConfs[i].atualizar();
			clockConfs[i].checar();
		}
	}

	public String getSDF()
	{return sdf.format(new Date());}

	public String getHMS()
	{return hms.format(new Date());}

	public int segundo()
	{return Calendar.getInstance().get(Calendar.SECOND);}

	public Calendar agora()
	{return Calendar.getInstance();}
}