<?php

use SilverStripe\Blog\Model\BlogPost;
// use SilverStripe\Blog\Controllers\BlogPostController;
use MD\DivisionProject\ReportPageController;
class ReportPage extends BlogPost {

	private static $db = array(
	);

	private static $has_one = array(

	);

	private static $has_many = array(
	);

	private static $singular_name = 'Report';

	private static $plural_name = 'Reports';
	/* This is a GLOBAL change that should happen on all CISL sites */
	private static $can_be_root = false;
	public function getCMSFields() {
		$f = parent::getCMSFields();
		//$f->removeByName("Content");
		//$gridFieldConfig = GridFieldConfig_RecordEditor::create();
		//$gridFieldConfig->addComponent(new GridFieldSortableRows('SortOrder'));

		/*$gridField = new GridField("StaffTeam", "Staff Teams", StaffTeam::get(), GridFieldConfig_RecordEditor::create());
		$f->addFieldToTab("Root.Main", $gridField); // add the grid field to a tab in the CMS	*/
		return $f;
	}
}
