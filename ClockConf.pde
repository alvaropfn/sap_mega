import java.util.Calendar;

public class ClockConf
{
	boolean claro;
	Calendar inicioC, inicioE, inicioR;
	int hrc, minc, segc;
	int hre, mine, sege;

	public ClockConf(Configurator configurator, int index)
	{
		claro = false;
		carregarConf(configurator, index);
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