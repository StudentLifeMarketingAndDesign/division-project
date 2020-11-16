<?php

use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Assets\Image;
use SilverStripe\CMS\Model\SiteTree;
use SilverStripe\Forms\CheckboxField;
use SilverStripe\Forms\CheckboxSetField;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\Forms\ListboxField;
use SilverStripe\Forms\LiteralField;
use SilverStripe\Forms\TextareaField;
use SilverStripe\Forms\TextField;
use SilverStripe\View\Parsers\URLSegmentFilter;

class StaffPage extends Page {

	private static $db = array(
		"FirstName" => "Text",
		"MiddleName" => "Text",
		"LastName" => "Text",
		"DisplayPronouns" => "Boolean",
		'OtherPronouns' => "Text",
		"Position" => "Text",
		"EmailAddress" => "Text",
		"Phone" => "Text",
		"DepartmentURL" => "Text",
		"DepartmentName" => "Text",
		"OtherWebsiteLink" => "Varchar(155)",
		"OtherWebsiteLabel" => "Varchar(155)",
		"HidePageLink" => "Boolean",
	);

	private static $has_one = array(
		"Photo" => Image::class,
	);

	private static $owns = array(
		'Photo',
	);
	private static $defaults = array(
		"OtherWebsiteLabel" => "Website",
	);

	private static $belongs_many_many = array(
		"Teams" => "StaffTeam",
		"Pronouns" => "StaffPronoun",
	);

	private static $can_be_root = false;
	private static $icon_class = 'font-icon-p-profile';
	public function getCMSFields() {
		SiteTree::disableCMSFieldsExtensions();
		$fields = parent::getCMSFields();
		SiteTree::enableCMSFieldsExtensions();

		$titleField = $fields->dataFieldByName('Title');

		$titleFieldDisabled = $titleField->performReadonlyTransformation();
		$titleFieldDisabled->setDescription('Page name and URL is automatically generated from this person\'s full name.');
		$fields->removeByName('Title');
		//print_r($titleField);
		//$titleField->disable();
		$fields->addFieldToTab("Root.Main", $titleFieldDisabled);
		$fields->removeByName('MenuTitle');

		$fields->removeByName("Content");
		$fields->removeByName("URLSegment");
		$fields->addFieldToTab('Root.Main', LiteralField::create('URLLabel', '<p><a href="' . $this->PreviewLink() . '?stage=Stage" target="_blank" rel="noopener">' . $this->PreviewLink() . '</a></p>'));
		$fields->addFieldToTab("Root.Main", new TextField("FirstName", "First name"));
		$fields->addFieldToTab("Root.Main", new TextField("MiddleName", "Middle name or initial"));
		$fields->addFieldToTab("Root.Main", new TextField("LastName", "Last name"));

		$fields->addFieldToTab("Root.Main", CheckboxField::create('DisplayPronouns', 'Show pronoun(s) of reference?'));

		$proNoun = ListboxField::create(
			$name = 'Pronouns',
			$title = 'Pronouns',
			$source = StaffPronoun::get()->map('ID', 'Pronoun')->toArray()
		);
		$fields->addFieldToTab("Root.Main", $proNoun);
		$otherPronouns = new TextareaField('OtherPronouns', 'Another set of pronouns not listed above');

		$fields->addFieldToTab('Root.Main', $otherPronouns);

		$fields->addFieldToTab("Root.Main", new UploadField("Photo", "Photo (4:3 preferred - resizes to 945 width)"));
		$fields->addFieldToTab("Root.Main", new TextField("EmailAddress", "Email address"));
		$fields->addFieldToTab("Root.Main", new TextField("Position", "Position"));

		$fields->addFieldToTab("Root.Main", new TextField("Phone", "Phone (XXX-XXX-XXXX)"));
		$fields->addFieldToTab("Root.Main", new TextField("DepartmentName", "Department name (optional)"));
		$fields->addFieldToTab("Root.Main", new TextField("DepartmentURL", "Department Website URL (optional)"));
		$fields->addFieldToTab("Root.Main", new TextField("OtherWebsiteLink", "Other website URL (include http:// or https://)"));
		$fields->addFieldToTab("Root.Main", new TextField("OtherWebsiteLabel", "Other website label (default: \"Website\""));

		$fields->addFieldToTab("Root.Main", new CheckboxField('HidePageLink', 'Hide page link from main staff listing and sidebar'));

		if (StaffTeam::get()->First()) {
			$fields->addFieldToTab("Root.Main", CheckboxSetField::create("Teams", 'Team(s)', StaffTeam::get()->map('ID', 'Name'))->addExtraClass('stacked'));
		}

		//$fields->addFieldToTab("Root.Main", new LiteralField("TeamLabel", ''));

		$fields->addFieldToTab("Root.Main", HTMLEditorField::create("Content", "Biography")->addExtraClass('stacked'));

		$this->extend('updateCMSFields', $fields);
		$fields->removeByName("BackgroundImage");
		$fields->removeByName('LayoutType');
		$fields->removeByName('YoutubeBackgroundEmbed');
		$fields->removeByName('Metadata');
		$proNoun->displayIf("DisplayPronouns")->isChecked();
		$otherPronouns->displayIf("DisplayPronouns")->isChecked();

		return $fields;
	}

	public function FullNameTruncated() {
		$lastName = $this->owner->LastName;
		$fullName = $this->owner->FirstName . ' ' . substr($lastName, 0, 1) . '.';

		return $fullName;
	}

	public function FullName() {
		$firstName = $this->FirstName;
		$middleName = $this->MiddleName;
		$lastName = $this->LastName;

		$fullName = $this->FirstName;
		if ($middleName) {
			$fullName .= " " . $this->MiddleName;
		}

		$fullName .= " " . $this->LastName;

		return $fullName;

	}

	public function onBeforeWrite() {
		$filter = new URLSegmentFilter();

		$this->Title = $this->FullName();
		$this->URLSegment = $filter->filter($this->Title);

		// CAUTION: You are required to call the parent-function, otherwise
		// SilverStripe will not execute the request.
		parent::onBeforeWrite();
	}
}
