<?php
use Adianti\Control\TPage;
use Adianti\Database\TTransaction;
use Adianti\Widget\Container\TPanelGroup;
use Adianti\Widget\Container\TVBox;
use Adianti\Widget\Datagrid\TDataGrid;
use Adianti\Widget\Datagrid\TDataGridAction;
use Adianti\Widget\Datagrid\TDataGridColumn;
use Adianti\Widget\Dialog\TMessage;
use Adianti\Widget\Util\TXMLBreadCrumb;
use Adianti\Wrapper\BootstrapDatagridWrapper;
use Adianti\Database\TRepository;


class AGC_BaseList extends TPage
{
    private $datagrid;


    public function __construct()
    {
        parent::__construct();

        //create grid
        $this->datagrid = new BootstrapDatagridWrapper(new TDataGrid);
        $this->datagrid->style = 'min-widht: 1900px';
        $this->datagrid->addColumn(new TDataGridColumn('idagc_base', 'id', 'center'));
        $this->datagrid->addColumn(new TDataGridColumn('station_field_number', 'Station/Field Number', 'center'));
        $this->datagrid->addColumn(new TDataGridColumn('PalmC', 'Palm C', 'center'));
        $this->datagrid->addColumn(new TDataGridColumn('PalmD', 'Palm D', 'center'));
        $this->datagrid->addColumn(new TDataGridColumn('Babassu', 'Babassu', 'center'));
        $this->datagrid->addColumn(new TDataGridColumn('Tucum', 'Tucum', 'center'));
        $this->datagrid->addColumn(new TDataGridColumn('TreeC', 'Tree C', 'center'));
        $this->datagrid->addColumn(new TDataGridColumn('TreeD', 'Tree D', 'center'));
        $this->datagrid->addColumn(new TDataGridColumn('Height', 'Height', 'center'));
        $this->datagrid->addColumn(new TDataGridColumn('VC_height', 'VC Height', 'center'));
        $this->datagrid->addColumn(new TDataGridColumn('DBH', 'DBH', 'center'));
        $this->datagrid->addColumn(new TDataGridColumn('VC_DBH', 'VC DBH', 'center'));
        $this->datagrid->addColumn(new TDataGridColumn('BA', 'BA', 'center'));
        $this->datagrid->addColumn(new TDataGridColumn('ShrubD', 'Shrub D', 'center'));
        $this->datagrid->addColumn(new TDataGridColumn('ShrubDBH', 'Shrub DBH', 'center'));
        $this->datagrid->addColumn(new TDataGridColumn('VC_ShrubDBH', 'VC Shrub DBH', 'center'));
        $this->datagrid->addColumn(new TDataGridColumn('VC_TSDBH', 'VC TSDBH', 'center'));
        $this->datagrid->addColumn(new TDataGridColumn('TSC', 'TSC', 'center'));
        $this->datagrid->addColumn(new TDataGridColumn('TotalID', 'Total ID', 'center'));
        $this->datagrid->addColumn(new TDataGridColumn('NecroC', 'Necro C', 'center'));
        $this->datagrid->addColumn(new TDataGridColumn('LitterC', 'Litter C', 'center'));
        $this->datagrid->addColumn(new TDataGridColumn('FineNC', 'Fine NC', 'center'));
        $this->datagrid->addColumn(new TDataGridColumn('HerbC', 'Herb C', 'center'));
        $this->datagrid->addColumn(new TDataGridColumn('AGC', 'AGC', 'center'));
        $this->datagrid->addColumn(new TDataGridColumn('SOC', 'SOC', 'center'));
        $this->datagrid->addColumn(new TDataGridColumn('Total_C', 'Total C', 'center'));
        

        
        $action1 = new TDataGridAction([$this,'onView'], ['id' => '{}', '' => '{}']);
        $this->datagrid->addAction($action1, 'View', 'fa:search blue');


        $this->datagrid->createModel();

        $panel = new TPanelGroup(_t('AGCList'));
        $panel->add($this->datagrid);
        $panel->addFooter('LAPS - Laboratorio de Aquisição e Processamento de Sinais');

        $panel->getBody()->style = "overflow-x:auto;";

        $vbox=new TVBox;
        $vbox->style = 'width: 100%';
        $vbox->add(new TXMLBreadCrumb('menu.xml', __CLASS__));
        $vbox->add($panel);


        parent::add($vbox);
    }


    public function onReload()
    {
        try{
            TTransaction::open('agc_base'); // 

            $repository = new TRepository('agc_base'); //
            $agc_base = $repository->load(); // 
            $this->datagrid->clear();

            foreach ($agc_base as $agc_base) {
                $item = new stdClass;
                $item->idagc_base = $agc_base->idagc_base;
                $item->station_field_number = $agc_base->station_field_number;
                $item->PalmC = $agc_base->PalmC;
                $item->PalmD = $agc_base->PalmD;
                $item->Babassu = $agc_base->Babassu;
                $item->Tucum = $agc_base->Tucum;
                $item->TreeC = $agc_base -> TreeC;
                $item ->TreeD = $agc_base -> TreeD;
                $item ->Height = $agc_base -> Height;
                $item ->VC_height = $agc_base -> VC_height;
                $item ->DBH = $agc_base -> DBH;
                $item ->BA = $agc_base -> BA;
                $item ->ShrubD = $agc_base -> ShrubD;
                $item ->VC_ShrubDBH = $agc_base -> VC_ShrubDBH;
                $item ->VC_TSDBH = $agc_base -> VC_TSDBH;
                $item ->TSC = $agc_base -> TSC;
                $item ->TotalID = $agc_base -> TotalID;
                $item ->NecroC = $agc_base -> NecroC;
                $item ->LitterC = $agc_base -> LitterC;
                $item ->FineNC = $agc_base -> FineNC;
                $item ->HerbC = $agc_base -> HerbC;
                $item ->AGC = $agc_base -> AGC;
                $item ->SOC = $agc_base -> SOC;
                $item ->Total_C = $agc_base -> Total_C;
        
                //$item -> item = $plot -> item;

                $this->datagrid->addItem($item);
            }

            TTransaction::close();
        } catch (Exception $e) {
            new TMessage('error', 'Error: ' . $e->getMessage());
            TTransaction::rollback();
        }

        
    }

    public static function onView($param)
    {
        $code = $param['idagc_base'];
        $BA = $param['BA'];
        new TMessage('info', "The code is: <br> $code </br> <br> The last_name is: <b>$BA</b>");
    }


    public function show()
    {
        $this->onReload();
        parent::show();
    }


}


