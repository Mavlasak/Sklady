<?php

namespace App\Presenters;

use Nette,
    Nette\Application\UI\Form;
use App\Model\Movement;
use App\Model\Stores;

class HomepagePresenter extends Nette\Application\UI\Presenter
{
  private $Movement;
  private $Stores;
    
  function __construct(Movement $Movement, Stores $Stores) 
    {
	$this->Movement=$Movement;
        $this->Stores=$Stores;
    }
    
    public function renderDefault()
	{
             $Movements=$this->Movement->loadStockMovement();  
             $this->template->Movements=$Movements;
                  
	}
        
    public function createComponentStorage()
	{
		$form = new Form();
                $stores=$this->Stores->loadStore(); 
                
                foreach ($stores as $store){
                    $storeForm[$store->id]=$store->name;
                }
                
                $form->addSelect('warehouse_id','Sklad:', $storeForm);
		$form->addText('stock_count', 'Počet:')
				->setRequired(TRUE)
                                ->addRule(Form::INTEGER)
                                ->addRule(Form::MIN,'Minimální množství je %d',1)
				->addRule(Form::MAX_LENGTH, 'Zadat můžete maximálně %d znaků', 10);
                $form->addText('stock_name','Název:')
				->setRequired(TRUE)
				->addRule(Form::MAX_LENGTH, 'Zadat můžete maximálně %d znaků', 30);
                $form->addSubmit('submit');
                $form->onSuccess[] = [$this, 'StorageSucceeded'];
		return $form;
	}

	
    public function StorageSucceeded(Form $form) {
            $values = $form->getValues();
            $this->Movement->addMovement($values); 
        }
}
