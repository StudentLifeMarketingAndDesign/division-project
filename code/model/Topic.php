<?php

class Topic extends BlogPost {

	private static $many_many = array(
		'Questions' => 'TopicQuestion',
		'Links' => 'TopicLink'
	);

	private static $belongs_many_many = array(
	
	);

    public function AllTags(){
        $tags = BlogTag::get()->filter(array('BlogID' => $this->ParentID))->sort('Title ASC');
        return $tags;
    }

	public function getCMSFields(){
		
		$fields = parent::getCMSFields();
		$fields->removeByName('AuthorNames');
		$fields->removeByName('PhotosBy');
		$fields->removeByName('PhotosByEmail');
		$fields->removeByName('Authors');
		$fields->removeByName('Questions');
		$fields->removeByName('IsFeatured');
		$fields->removeByName('SummaryQuestions');
		$fields->removeByName('ExternalURL');
		$fields->removeByName('LayoutType');
		$fields->removeByName('CustomSummary');
		$fields->removeByName('Metadata');

		$fields->removeByName('Blocks');
		$fields->removeByName('MetaData');
		$fields->removeByName('Widgets');
		$fields->renameField('Suburb', 'City');
		$qField = TagField::create(
						'Questions',
						'Questions relevant to this topic:',
						TopicQuestion::get(),
						$this->Questions()
					)->setShouldLazyLoad(true)->setCanCreate(false);

		$fields->addFieldToTab('Root.Questions', $qField);

		$linkGrid = new GridField(
			'Links',
			'Links relevant to this topic',
			$this->Links(),
			GridFieldConfig::create()
				->addComponent(new GridFieldButtonRow('before'))
				->addComponent(new GridFieldToolbarHeader())
				->addComponent(new GridFieldTitleHeader())
				->addComponent(new GridFieldEditableColumns())
				->addComponent(new GridFieldDeleteAction())
				->addComponent(new GridFieldAddNewInlineButton())
		);

		
		$linkGrid->getConfig()->getComponentByType('GridFieldEditableColumns')->setDisplayFields(array(
			'Title' => array(
				'title' => 'Link Description',
				'field' => 'TextField'
			),
			'URL' => array(
				'title' => 'Link URL (include https://)',
				'field' => 'TextField'
			)
		));
		$fields->insertAfter(new Tab('RelatedLinks', 'Related links'), 'Main');
		$fields->addFieldToTab('Root.RelatedLinks', $linkGrid);


		return $fields;

	}

    public function TopicsByLetter(){
    	$alphas = range('A', 'Z');
    	$letterArrayList = new ArrayList();

    	foreach($alphas as $letter){
    		$letterTopics = Topic::get()->filter(array('Title:StartsWith' => $letter, 'ParentID' => $this->ParentID));

    		if($letterTopics->Count() > 0){
        		$letterArrayData = new ArrayData(array('Letter' => $letter, 'Topics' => $letterTopics));
    			$letterArrayList->push($letterArrayData);			
    		}
    		 
    	}

    	//print_r($letterArrayList);
    	return $letterArrayList;
    }


	/**
	 * Returns a static google map of the address, linking out to the address.
	 *
	 * @param int $width
	 * @param int $height
	 * @return string
	 */
	public function GoogleMap() {
		$data = $this->owner->customise(array(
			'Address' => rawurlencode($this->getFullAddress()),
			'GoogleAPIKey' => Config::inst()->get('GoogleGeocoding', 'google_api_key')
		));
		return $data->renderWith('TopicGoogleMap');
	}

}


class Topic_Controller extends BlogPost_Controller{



}