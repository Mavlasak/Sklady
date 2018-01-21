<?php

namespace App\Model;


class Stores {

    function __construct(\Nette\Database\Context $db) 
    {
        $this->database = $db;
    } 
    
   public function loadStore() {
        return $this->database->table('warehouse')->fetchAll();
    }
    
}
