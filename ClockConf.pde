import java.util.Calendar;

public class ClockConf
{
	boolean claro;
	Calendar inicioC, inicioE, inicioR;
	int hrc, minc, segc;
	int hre, mine, sege;

	public ClockConf(int hrc, int minc, int segc, int hre, int mine, int sege)
	{
		claro = false;
		carregarConf(hrc, minc, segc, hre, mine, sege);
	}

	public void carregarConf(int hrc, int minc, int segc, int hre, int mine, int sege)
	{
		this.hrc = hrc;
		this.minc = minc;
		this.segc = segc;

		this.hre = hre;
		this.mine = mine;
		this.sege = sege;
	}

	public void carregarConf(Configurator configurador, int index)
	{
		this.hrc = configurador.getHoraC(index);
		this.minc = configurador.getMinC(index);
		this.segc = configurador.getSegC(index);

		this.hre = configurador.getHoraE(index);
		this.mine = configurador.getMinE(index);
		this.sege = configurador.getSegE(index);
	}

	public void atualizar()
	{

		inicioC = Calendar.getInstance();
		
		inicioC.set(Calendar.HOUR_OF_DAY, hrc);
		inicioC.set(Calendar.MINUTE, minc);
		inicioC.set(Calendar.SECOND, segc);

		inicioE = Calendar.getInstance();
		
		inicioE.set(Calendar.HOUR_OF_DAY, hre);
		inicioE.set(Calendar.MINUTE, mine);
		inicioE.set(Calendar.SECOND, sege);

		inicioR = (Calendar) inicioC.clone();
		inicioE.add(Calendar.HOUR_OF_DAY,24);
	}

	public boolean checar()
	{
		Calendar agora = Calendar.getInstance();
		
		if(agora.after(inicioC) &&  agora.before(inicioE))
		{
			this.claro = true;
		}
		else if (agora.after(inicioE) && agora.before(inicioR))
		{
			this.claro = false;
		}
		else
		{
			atualizar();
			this.claro = checar();
		}
		return this.claro;
	}


}