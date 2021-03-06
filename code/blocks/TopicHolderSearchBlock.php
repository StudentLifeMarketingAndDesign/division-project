<?php

use SilverStripe\Assets\Image;
use SilverStripe\Forms\DropdownField;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\FormAction;
use SilverStripe\Forms\Form;
use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Control\Controller;

class TopicHolderSearchBlock extends BaseElement {

	private static $db = array(

    );

    private static $has_one = array(
        'TopicHolder' => 'TopicHolder',
        'BackgroundImage' => Image::class

    );
    private static $many_many = array(

    );

    private static $controller_class = TopicHolderSearchBlockController::class;

    private static $table_name = 'TopicHolderSearchBlock';

    public function getType()
    {
        return 'Topic Holder Search Block';
    }

    public function getCMSFields(){
        $fields = parent::getCMSFields();

        $field = DropdownField::create('TopicHolderID', 'Select a Topic Holder:', TopicHolder::get()->map('ID', 'Title'));
        $fields->addFieldToTab('Root.Main', $field);
        $fields->addFieldToTab("Root.Main", new UploadField("BackgroundImage", "Background Image"));

        return $fields;
    }

    public function TopicSearchForm(){
        //$current = Controller::curr();
        $controller = TopicHolderController::create($this);
        $current = $this->getController();

        $topicHolder = $this->TopicHolder();

        $controller->setRequest($current->getRequest());
        //print_r($this->getController());
        $form = $controller->TopicSearchForm();


        $form->setFormAction(
            Controller::join_links(
                $topicHolder->Link(),
                'TopicSearchForm'
            )
        );
        return $form;
    }


}
