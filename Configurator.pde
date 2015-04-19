
public class Configurator
{
	final String arquivo = "conf.txt";

    String serial;
    Integer janelaAquisicao;
    Boolean[] saida;
    Integer[] horaC, minC, segC;
    Integer[] horaE, minE, segE;

	public Configurator(Writer escritor)
	{

        carregarConf(escritor);
	}

	public void salvarConf(Writer escritor)
	{
		escritor.overWrite(arquivo, confToString());
	}

	public void carregarConf(Writer escritor)
	{
        String[] confs;
		try
		{
			confs = loadStrings(arquivo);

            if (confs == null)
            {
                padraoConf();
                salvarConf(escritor);
            }
            else
            {
                stringsToConfs(confs);
            }
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

        serial = "null";
        janelaAquisicao = 300;
        saida = new Boolean[] {true, true, true, true, true, true};

        horaC = new Integer[] {6, 6, 6, 6, 6, 6};
        minC = new Integer[] {0, 0, 0, 0, 0, 0};
        segC = new Integer[] {0, 0, 0, 0, 0, 0};

        horaE = new Integer[] {18, 18, 18, 18, 18, 18};
        minE = new Integer[] {0, 0, 0, 0, 0, 0};
        segE = new Integer[] {0, 0, 0, 0, 0, 0};
	}

    void stringsToConfs(String[] confs)
    {
        try 
        {
            serial = confs[0];
            janelaAquisicao = Integer.parseInt(confs[1]);
            //saida = new Boolean[] {true, true, true, true, true, true};
            saida = stringsToBools(confs[2]);

            horaC = stringsToInts(confs[3]);
            minC = stringsToInts(confs[4]);
            segC = stringsToInts(confs[5]);

            horaE = stringsToInts(confs[6]);
            minE = stringsToInts(confs[7]);
            segE = stringsToInts(confs[8]);    
        }
        catch (Exception e)
        {
            padraoConf();
        }      
    }

    //retorna as configuraçoes como um vetor de strings para ser salvo
    private String[] confToString()
    {
        return new String[]
        {
            serial,
            "" + janelaAquisicao,
            arrayToString(saida),            

            arrayToString(horaC),
            arrayToString(minC),
            arrayToString(segC),

            arrayToString(horaE),
            arrayToString(minE),
            arrayToString(segE),
        };
    }

    //retorna um array de strings
    //recebe um array de Integer ou Boolean
    private String arrayToString(Object[] array)
    {
        String temp = "";
        
        for (Object o : array) {
            if(o.equals(Boolean.class))
                temp += o + " "; //String.valueOf(o) + " ";

            if(o.equals(Integer.class))
                temp += o + " ";
        }
        println(temp);
        return temp;
    }

    //retorna um array de Integer
    //recebe um string com varios ints
    private Integer[] stringsToInts(String s)
    {
        String[] temp = splitTokens(s, ", \t");

        Integer len = temp.length;
        Integer[] array = new Integer[len];

        for (Integer i = 0; i < len; ++i) 
            array[i] = Integer.parseInt(temp[i]);
        
        return array;
    }

    //retorna um array de booleanos
    //recebe um string com varios booleanos
    private Boolean[] stringsToBools(String s)
    {
        String[] temp = splitTokens(s, ", \t");
        
        Integer len = temp.length;
        Boolean[] array = new Boolean[len];

        for (Integer i = 0; i < len; ++i) 
            array[i] = Boolean.parseBoolean(temp[i]);
        
        return array;
    }

    //entrada bloco SETs
    public String getSerial()
    {return this.serial;}

    public int getJanelaAquisicao()
    {return (int) janelaAquisicao;}

    public boolean getSaida(int index)
    {return saida[index];}

    public int getHoraC(int index)
    {return this.horaC[index];}

    public int getMinC(int index)
    {return this.minC[index];}

    public int getSegC(int index)
    {return this.segC[index];}

    public int getHoraE(int index)
    {return this.horaE[index];}

    public int getMinE(int index)
    {return this.minE[index];}

    public int getSegE(int index)
    {return this.segE[index];}
    //saida bloco SETs

    //################################

    //entrada bloco GETs
    public void setSerial(String var)
    {this.serial = var;}

    public void setJanelaAquisicao(int var)
    {this.janelaAquisicao = var;}

    public void setSaidas(boolean[] var)
    {
        int len = saida.length;
        for (int i = 0; i < len; ++i)
            this.saida[i] = var[i];
    }

    public void setHoraC(int[] var)
    {
        int len = horaC.length;
        for (int i = 0; i < len; ++i)
            this.horaC[i] = var[i];
    }

    public void setMinC(int[] var)
    {
        int len = minC.length;
        for (int i = 0; i < len; ++i)
            this.minC[i] = var[i];
    }

    public void setSegC(int[] var)
    {
        int len = segC.length;
        for (int i = 0; i < len; ++i)
            this.segC[i] = var[i];
    }

    public void setHoraE(int[] var)
    {
        int len = horaE.length;
        for (int i = 0; i < len; ++i)
            this.horaE[i] = var[i];
    }

    public void setMinE(int[] var)
    {
        int len = minE.length;
        for (int i = 0; i < len; ++i)
            this.minE[i] = var[i];
    }

    public void setSegE(int[] var)
    {
        int len = segE.length;
        for (int i = 0; i < len; ++i)
            this.segE[i] = var[i];
    }
    //saida bloco GETs
}