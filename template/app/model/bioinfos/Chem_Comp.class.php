<?php
use Adianti\Database\TRecord;


class Chem_Comp extends TRecord{


    CONST TABLENAME = 'chem_comp';

    CONST PRIMARYKEY = 'idchem_comp';

    CONST IDPOLICY = 'serial';

    public function __construct( $idchem_comp = NULL){
        parent::__construct($idchem_comp);

        parent::addAttribute($idchem_comp);
        parent::addAttribute('sand_thick');
        parent::addAttribute('sand_fine');
        parent::addAttribute('silt');
        parent::addAttribute('clay');
        parent::addAttribute('texture');
        parent::addAttribute('ph');
        parent::addAttribute('hal');
        parent::addAttribute('K');
        parent::addAttribute('ca');
        parent::addAttribute('mg');
        parent::addAttribute('P');
        parent::addAttribute('mo');
        parent::addAttribute('c');
        parent::addAttribute('na');
        parent::addAttribute('al');
        parent::addAttribute('h');
        parent::addAttribute('bases_sum');
        parent::addAttribute('ctc');
        parent::addAttribute('v');
        parent::addAttribute('n');
        parent::addAttribute('cn');

    }   

    public function get_Chem_Comp(){
        if(empty($this->Chem_Comp))
            $this-> Chem_Comp = new Chem_Comp($this -> idchem_comp);
        return $this -> Chem_Comp;
    }
}