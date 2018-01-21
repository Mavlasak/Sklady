<?php

namespace App\Model;

use App\Model\Stores;

class Movement {
      
  private $Stores;
    
  function __construct(Stores $Stores,\Nette\Database\Context $db) 
    {
        $this->database = $db;
        $this->Stores=$Stores;
    } 
    
   public function addMovement($values) {
        $this->database->table('movement')->insert($values);
    } 
    
    public function loadStockMovement() {
         foreach($this->Stores->loadStore() as $store) {
                $stores[$store->name]=$store->related('movement.warehouse_id')
                        ->select('SUM(stock_count) AS stock_count, MAX(created_at) AS last_movement, stock_name')
                        ->group('movement.stock_name')->fetchAll();
        }
        return $stores;
    }
    
}
