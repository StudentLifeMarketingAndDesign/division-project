<?php

use SilverStripe\Forms\HeaderField;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\CheckboxField;
use SilverStripe\Forms\DropdownField;
use DNADesign\Elemental\Models\BaseElement;

class SocialMediaBlock extends BaseElement{

	private static $db = array(
		"TwitterUserTimelineURL" => "Text",
		"FacebookPageUrl" => "Text",
		'FacebookPluginFaces' => 'Boolean',
		'FacebookPluginHeader' => 'Boolean',
		'FacebookPluginCover' => 'Boolean',
		'Tabs' => 'Varchar(155)'
	);

	private static $has_one = array(

	);
	private static $table_name = 'SocialMediaBlock';

	public function getType()
    {
        return 'Social Media Block';
    }

	public function getCMSFields() {
		$fields = parent::getCMSFields();
		//$fields->removeByName("Title");

		$fields->addFieldToTab("Root.Main", new HeaderField('TwitterHeader','Twitter', 3) );
		$fields->addFieldToTab("Root.Main", new TextField("TwitterUserTimelineURL", "Twitter Timeline URL"));

		$fields->addFieldToTab("Root.Main", new HeaderField( 'FacebookHeader','Facebook',3 ) );
		$fields->addFieldToTab("Root.Main", new TextField("FacebookPageUrl", "Facebook Page URL"));
		$fields->addFieldToTab("Root.Main", new CheckboxField ("FacebookPluginFaces", "Show Friend's Faces"));
		$fields->addFieldToTab("Root.Main", new CheckboxField ("FacebookPluginHeader", "Use Small Header"));
		$fields->addFieldToTab("Root.Main", new CheckboxField ("FacebookPluginCover", "Hide Cover Photo"));

		$fields->addFieldToTab("Root.Main", DropdownField::create(
		  'Tabs',
		  'Tabs',
		  array(
		    'timeline' => 'Timeline',
		    'events' => 'Events',
		    'messages'=> 'Messages'
		  )
		)->setEmptyString('(None)'));

		return $fields;
	}

}