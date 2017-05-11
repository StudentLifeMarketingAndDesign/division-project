<?php

class TopicHolder extends Blog {

	private static $db = array(

	);

	private static $allowed_children = array('Topic');

    public function getLumberjackTitle() {
        return 'Topics';
    }

	public function getCMSFields(){
		$fields = parent::getCMSFields();
		//$fields->addFieldToTab("Root.Settings", new CheckboxField('ExpandAllTopicsByDefault', 'Expand all topics by default'));

		$questionGridFieldConfig = GridFieldConfig_RecordEditor::create();
		$questionGridField = new GridField('TopicQuestions', 'Questions', TopicQuestion::get());
		$questionGridField->setConfig($questionGridFieldConfig);

		$fields->addFieldToTab('Root.Questions', $questionGridField);

		$fields->removeByName('Categories');
		return $fields;

	}
    public function AllTags()
    {
        //$blog = $this;
        $tags = BlogTag::get()->filter(array('BlogID' => $this->ID));

        return $tags;
    }


}


class TopicHolder_Controller extends Blog_Controller{



}