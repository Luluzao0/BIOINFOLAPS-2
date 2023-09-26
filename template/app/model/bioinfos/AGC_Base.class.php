<?php


use Adianti\Database\TRecord;

class AGC_Base extends TRecord
{
    const TABLENAME = 'agc_base';

    const PRIMARYKEY = 'idagc_base';
    const IDPOLICY = 'serial';




    public function __construct($idagc_base = NULL)
    {
        parent::__construct($idagc_base);
        parent::__construct('station_field_number');
        parent::__construct('PalmC');
        parent::__construct('PalmD');
        parent::__construct('Babassu');
        parent::__construct('Tucum');
        parent::__construct('TreeC');
        parent::__construct('TreeD');
        parent::__construct('Height');
        parent::__construct('VC_height');
        parent::__construct('DBH');
        parent::__construct('VC_DBH');
        parent::__construct('BA');
        parent::__construct('ShrubD');
        parent::__construct('ShrubDBH');
        parent::__construct('VC_ShrubDBH');
        parent::__construct('VC_TSDBH');
        parent::__construct('TSC');
        parent::__construct('TotalID');
        parent::__construct('NecroC');
        parent::__construct('LitterC');
        parent::__construct('FineNC');
        parent::__construct('HerbC');
        parent::__construct('AGC');
        parent::__construct('SOC');
        parent::__construct('Total_C');


    }


    public function get_AGC_Base()
    {
        if (empty($this->AGC_Base))
            $this->AGC_Base = new AGC_Base($this->id);
        return $this->AGC_Base;
    }

}