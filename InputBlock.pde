import controlP5.*;

public class InputBlock
{
	private PApplet dad;
	private ControlP5 cp5;
	
	private Button btn;
	private Numberbox nbb;
	private Textfield tfdBlock[][];
	
	private final int ajusteTF = 5;
	private final int ajusteGeral = 4;

	private final int btnLado = 35;
	private final int larguraTFD = 20;
	private final int alturaNBB_TFD = 15;

	private boolean estado;
	private int inicioX;
	private int inicioY;
	private int pin;

	public InputBlock (ControlP5 cp5, int pin, int inicioX, int inicioY )
	{
		this.pin = pin;
		this.inicioX = inicioX;
		this.inicioY = inicioY;

		gerarBotao(cp5);
		gerarNumberbox(cp5);
		gerarTextfields(cp5);
	}

	private void gerarBotao(ControlP5 cp5)
	{
		cp5.addButton("d" + pin)
			.setPosition(inicioX, inicioY)
			.setSize(btnLado, btnLado)
			.setColorBackground(color(0,0,0))
			.setId(100 + pin)
			.getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
			;
		
		//ponteiro de acesso direto ao botao
		btn = (Button) cp5.getController("d"+pin);
	}

	private void gerarNumberbox(ControlP5 cp5)
	{
		cp5.addNumberbox("seg" + pin)
			.setPosition(inicioX, inicioY + ajusteGeral + btnLado)
			.setSize(btnLado, alturaNBB_TFD)
			.setColorBackground(color(0,0,0))
			.setColorLabel(color(0,0,255))
			.setColorForeground(color(255,255,150))
			.setColorValue(color(0,255,0))
			.setDecimalPrecision(0).setDecimalPrecision(0)
			.lock()
			//.setId(pin)
			;
		nbb = (Numberbox) cp5.getController("n"+pin);
	}

	private void gerarTextfields(ControlP5 cp5)
	{
		int lin = 2;
		int col = 3;
		tfdBlock = new Textfield[lin][col];
		

		//apenas para faciliar o deslocaento inicial em X
		int inix = inicioX + btnLado+ ajusteGeral;

		String[] s1 = {"hc","mc","sc"};
		String[] s2 = {"he","me","se"};
		//String[] s3 = {"ht","mt","st"};
		//String[][] tfdName ={s1,s2,s3};
		String[][] tfdName ={s1,s2};

		for (int ln = 0; ln < lin; ++ln)
		{
			for (int cl = 0; cl < col; ++cl)
			{
				String name = tfdName[ln][cl] + "_" + pin;
				cp5.addTextfield(name)
				.setPosition(inix +cl*(ajusteTF+ larguraTFD), inicioY + ln*(alturaNBB_TFD +alturaNBB_TFD))
				.setSize(larguraTFD,alturaNBB_TFD)
				.setAutoClear(false)
				.setColor(255)
				.setColorCursor(color(255,0,0))
				.setColorForeground(color(0,0,0))
				.setColorCaptionLabel(color(0,0,0))
				//.setInputFilter().valueOf(INTEGER) 
				;
				
				tfdBlock[ln][cl] = (Textfield) cp5.getController(name);
			}
		}
	}
	
	public int getHoraC()
	{return Integer.parseInt(this.tfdBlock[0][0].getText());}

	public int getMinC()
	{return Integer.parseInt(this.tfdBlock[0][1].getText());}

	public int getSegC()
	{return Integer.parseInt(this.tfdBlock[0][2].getText());}

	public int getHoraE()
	{return Integer.parseInt(this.tfdBlock[1][0].getText());}

	public int getMinE()
	{return Integer.parseInt(this.tfdBlock[1][1].getText());}

	public int getSegE()
	{return Integer.parseInt(this.tfdBlock[1][2].getText());}

	public void setHMSC(Configurator configurador, int index)
	{
		tfdBlock[0][0].setText("" + configurador.getHoraC(index));
		tfdBlock[0][1].setText("" + configurador.getMinC(index));
		tfdBlock[0][2].setText("" + configurador.getSegC(index));
	}

	public void setHMSE(Configurator configurador, int index)
	{
		tfdBlock[1][0].setText("" + configurador.getHoraE(index));
		tfdBlock[1][1].setText("" + configurador.getMinE(index));
		tfdBlock[1][2].setText("" + configurador.getSegE(index));
	}

	public void trocarEstado()
	{
		estado = !estado;
		pintarEstado();
	}

	public void setEstado(Configurator configurador, int index)
	{
		this.estado = configurador.getSaida(index);
		pintarEstado();
	}

	private void pintarEstado()
	{btn.setColorBackground(estado ? color(100,150,255) : color(0,0,0));}
}
