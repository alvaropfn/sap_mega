import java.util.Date;
import java.text.SimpleDateFormat;

public class ClockMaster
{
	SimpleDateFormat sdf, hms;
	int sec, nxt, janelaAquisicao;

	private final int qtd_saidas_dig = 6;
	private final int qtd_entradas_ana = 16;
	private final int qtd_entradas_dig = 46;
	
	ClockConf[] gears;

	public ClockMaster()
	{

		sdf = new SimpleDateFormat("yyyy/MM/dd");
		hms = new SimpleDateFormat("HH:mm:ss");
		gears = new ClockConf[qtd_saidas_dig];
		sec = segundo();
	}

	//ciclo de eventos a cada segundo
	void cicle()
	{
		nxt = segundo();
		if(sec != nxt)
		{
			sec = nxt;
			println("sec: "+sec);

		}

	}

	public String getSDF()
	{return sdf.format(new Date());}

	public String getHMS()
	{return hms.format(new Date());}

	public int segundo()
	{
		return Calendar.getInstance().get(Calendar.SECOND);
	}

	public Calendar agora()
	{
		return Calendar.getInstance();
	}
}