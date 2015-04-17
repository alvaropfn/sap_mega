import java.util.Calendar;

public class ClockConf
{
	Calendar inicioC, inicioE, inicioR;
	int hrc, minc, segc;
	int hre, mine, sege;

	public ClockConf(int hrc, int minc, int segc, int hre, int mine, int sege)
	{
		loadConf(hrc, minc, segc, hre, mine, sege);
	}

	public void loadConf(int hrc, int minc, int segc, int hre, int mine, int sege)
	{
		this.hrc = hrc;
		this.minc = minc;
		this.segc = segc;

		this.hre = hre;
		this.mine = mine;
		this.sege = sege;
	}

	public void update()
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



}