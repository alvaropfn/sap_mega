import controlP5.*;

public class Displayer
{
	Tab tabD, tabP;
	Button setButton;
	DropdownList ddl;
	Numberbox[] nbb_dig;
	Numberbox[] nbb_ana;
	InputBlock[] inputBlocks;
	Numberbox janelaAquisicao;

	private int[] vet;
	private int len;
	private final int nbLado = 40;
	private final int inicioX = 10;
	private final int inicioY = 150;
	private final int ajusteX_nbb = 50;
	private final int ajusteY_nbb = 55;

	public Displayer (ControlP5 cp5, ArduinoCOM arduinoCom)
	{
		addTabs(cp5);

		addSetButton(cp5);
		
		addInputBlocks(cp5, arduinoCom);

		addAnaNumberbox(cp5, arduinoCom);

		addDigNumberbox(cp5, arduinoCom);

		addJanelaAquisicao(cp5);

		addDropdownList(cp5);

	}

	private void addTabs(ControlP5 cp5)
	{
		tabD = cp5.getTab("default")
		.setLabel("interface de feedback")
		.activateEvent(true)
		.setId(0)
		;

		tabP = cp5.addTab("tabPortas")
		.setLabel("Seletor de Portas")
		.activateEvent(true)
		.setColorBackground(123)
		.setColorLabel(color(255))
		.setColorActive(color(255,126,0))
		.bringToFront()
		.setId(1)
		;
	}

	private void addSetButton(ControlP5 cp5)
	{
		cp5.addButton("set")
		.setPosition(565, 150)
		.setSize(100, 50)
		.setColorBackground(color(255,0,0))
		.getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
		.setColor(color(255,255,255))
		;
		setButton = (Button) cp5.getController("set");
	}

	private void addJanelaAquisicao(ControlP5 cp5)
	{
		cp5.addNumberbox("janelaAquisicao")
		.setPosition(700,150)
		.setSize(50,50)
		.setValue(300)
		.setRange(5, 3600)
		.setDecimalPrecision(0)
		.setLabel("tamanho da Janela")
		.setColorLabel(color(0,0,0))
		.getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE)
		;

		janelaAquisicao = (Numberbox) cp5.getController("janelaAquisicao");
	}

	private void addInputBlocks(ControlP5 cp5, ArduinoCOM arduinoCom)
	{


		vet = arduinoCom.getSaidasDig();
		len = vet.length;
		
		inputBlocks = new InputBlock[len];
		int ajusteX_tfd = 130;
		//cria um bloco de controle de enrada para configurar cada saida digital
		for (int i = 0; i < len; ++i) 
		{
			inputBlocks[i] = new InputBlock(cp5, vet[i], 5 + i*ajusteX_tfd, 20 );
		}
	}

	private void addAnaNumberbox(ControlP5 cp5, ArduinoCOM arduinoCom)
	{
		vet = arduinoCom.getEntradasAna();
		len = vet.length;
		nbb_ana = new Numberbox[len];
		//cria um numberbox para cada uma das portas analogicas
		for (int i = 0; i < len; ++i)
		{
			String name = "a" + vet[i];
			nbb_ana[i] = cp5.addNumberbox(name)  //entradas analogicas
			.setPosition(inicioX+(i%10)*ajusteX_nbb,inicioY+ajusteY_nbb*int(i/10))
			.setSize(nbLado, nbLado)
			.setColorBackground(color(0,0,0))
			.setDecimalPrecision(0)
			.setColorLabel(color(0,0,255))
			.setColorForeground(color(255,255,150))
			.setColorValue(color(0,255,0))
			//.setId(-vet[i])
			;
			//nbb_ana[i] = (Numberbox) cp5.getController(name);
		}
	}

	private void addDigNumberbox(ControlP5 cp5, ArduinoCOM arduinoCom)
	{
		vet = arduinoCom.getEntradasDig();
		len = vet.length;
		nbb_dig = new Numberbox[len];
		//cria um numberbox para cada uma das portas digitais
		for (int i = 0; i < len; ++i)
		{
			String name = "d"+vet[i];
			nbb_dig[i] = cp5.addNumberbox(name) //entradas digitais
			.setPosition(inicioX+(i%10)*ajusteX_nbb,2*inicioY+ajusteY_nbb*int(i/10))
			.setSize(nbLado, nbLado)
			.setColorBackground(color(0,0,0))
			.setDecimalPrecision(0)
			.setColorLabel(color(0,0,255))
			.setColorForeground(color(255,255,150))
			.setColorValue(color(0,255,0))
			.lock()
			//.setId(vet[i])
			;
			//nbb_dig[i] = (Numberbox) cp5.getController(name);
		}
	}

	private void addDropdownList(ControlP5 cp5)
	{
		ddl = cp5.addDropdownList("listaPortas")
		.moveTo("tabPortas")
		.setPosition(10,50)
		.setSize(100,30)
		.setBackgroundColor(color(190))
		.setItemHeight(20)
		.setBarHeight(25)
		.setHeight(400)
		.setCaptionLabel("lista de portas")
		.setColorBackground(color(60))
		.setColorActive(color(255, 128))
		
		;
		ddl.getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);
		//ddl = (DropdownList) cp5.getController("listaPortas");
	}

	public void encherDDL(String[] lista)
	{
		ddl.clear();
		int i = 0;
		println("comunicacao interrompida");
		ddl.addItems(lista);
		
		
	}
	
}