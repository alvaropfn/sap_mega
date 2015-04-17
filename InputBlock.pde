import controlP5.*;

public class InputBlock
{
	PApplet dad;
	ControlP5 cp5;
	
	Button btn;
	Numberbox nbb;
	Textfield tfdBlock[][];
	
	final int ajusteTF = 5;
	final int ajusteGeral = 4;

	final int btnLado = 35;
	final int larguraTFD = 20;
	final int alturaNBB_TFD = 15;

	int inicioX;
	int inicioY;
	int pin;

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
			//.setColor(color(255,0,0))
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

	/*retorna um array com os inteiros hora minuto e segundo do inicio
	* 0 = claro
	* 1 = escuro
	*/
	public int[] getHMS(int index)
	{
		int hr = Integer.parseInt(this.tfdBlock[index][0].getText());
		int min = Integer.parseInt(this.tfdBlock[index][1].getText());
		int seg = Integer.parseInt(this.tfdBlock[index][2].getText());
		return new int[] {hr, min, seg};
	}
	
}
