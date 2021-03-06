<?php

use SilverStripe\Forms\CheckboxField;
use SilverStripe\Forms\DropdownField;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\GridField\GridFieldConfig_RecordEditor;
use SilverStripe\Forms\GridField\GridFieldDeleteAction;
use Symbiote\GridFieldExtensions\GridFieldAddNewMultiClass;
use UndefinedOffset\SortableGridField\Forms\GridFieldSortableRows;
use SilverStripe\Forms\GridField\GridFieldAddNewButton;
use SilverStripe\Forms\GridField\GridFieldConfig_RelationEditor;
use SilverStripe\Forms\GridField\GridFieldAddExistingAutocompleter;
use UncleCheese\DisplayLogic\Forms\Wrapper;
use SilverStripe\Security\Permission;
use SilverStripe\Forms\GridField\GridField;
use SilverStripe\Forms\LiteralField;
use MD\DivisionProject\HomePageController;
class HomePage extends Page {

    private static $db = array(
        'ShuffleHomePageFeatures' => 'Boolean'
    );

    private static $has_one = array(

    );

    private static $has_many = array(
        'BackgroundFeatures' => 'HomePageBackgroundFeature',
    );

    private static $layout_types = array(
        'Legacy' => 'Old style - Shuffled Background Features and Hero Features'
    );

    private static $icon_class = 'font-icon-p-home';

    public function getCMSFields() {
        $f = parent::getCMSFields();


        $f->removeByName('Content');
        $f->removeByName('BackgroundImage');
        $f->removeByName('InheritSidebarItems');
        $f->removeByName('SidebarLabel');
        $f->removeByName('SidebarItem');
        $f->removeByName('YoutubeBackgroundEmbed');


        $f->addFieldToTab('Root.Main', CheckboxField::create('ShowChildrenInDropdown','Show child pages in a dropdown menu if page is in the top bar (Yes)'));
            $layoutOptionsField = DropdownField::create(
                'LayoutType',
                'Layout type',
                $this->LayoutTypes()
            )->setEmptyString('(Default Layout)');


        // // Begin Default Slider fields
        // $newgridFieldConfig = GridFieldConfig_RecordEditor::create();
        // $newgridFieldConfig->addComponent($newSortable = new GridFieldSortableRows('SortOrder'));

        // $newSortable->setUpdateVersionedStage('Live');

        // $newgridFieldConfig->removeComponentsByType(GridFieldDeleteAction::class);
        // $newgridFieldConfig->removeComponentsByType(GridFieldAddExistingAutocompleter::class);


        // if (!Permission::check('ADMIN')) {
        //  $newgridFieldConfig->removeComponentsByType(GridFieldAddNewButton::class);

        // }

        // $newHomePageHeroFeatureGridField = GridField::create('NewHomePageHeroFeature', 'Homepage Slides', NewHomePageHeroFeature::get(), $newgridFieldConfig);
        // $shuffleHomePageFeaturesField = CheckboxField::create('ShuffleHomePageFeatures', 'Show features in a random order');


        // $f->push($newHomePageHeroFeatureGridField);

        // $backgroundVideoFields = $this->getBackgroundVideoFields($f);
        // $imageSliderFields = $this->getImageSliderFields($f);

        // $f->addFieldsToTab('Root.Main', $shuffledBackgroundFields);
        // $f->addFieldsToTab('Root.Main', $backgroundVideoFields);
        // $f->addFieldsToTab('Root.Main', $imageSliderFields);


        $f = $this->getShuffledBackgroundFields($f);

        $this->extend('updateCMSFields', $f);


        $f->removeByName('Content');
        $f->removeByName('BackgroundImage');
        $f->removeByName('InheritSidebarItems');
        $f->removeByName('SidebarLabel');
        $f->removeByName('SidebarItem');
        $f->removeByName('YoutubeBackgroundEmbed');

        return $f;
    }


    public function getShuffledBackgroundFields($f){

        $legacyFieldList = new FieldList();
        $fieldList = new FieldList();

        // Legacy fields

        //Legacy HomePageHeroFeatureGridFieldConfig
        $homePageHeroFeatureGridFieldConfig = GridFieldConfig_RecordEditor::create();

        $homePageHeroFeatureGridFieldConfig->addComponent($sortable = new GridFieldSortableRows('SortOrder'));
        $sortable->setUpdateVersionedStage('Live');


        $homePageHeroFeatureGridFieldConfig->removeComponentsByType(GridFieldDeleteAction::class);


        $homePageHeroFeatureGridFieldConfig->removeComponentsByType('GridFieldDetailForm');
        // $homePageHeroFeatureGridFieldConfig->addComponent(new Heyday\VersionedDataObjects\VersionedDataObjectDetailsForm());

        //Legacy Homepage Features:
        $homePageFeatureGridFieldConfig = GridFieldConfig_RecordEditor::create();
        $homePageFeatureGridFieldConfig->addComponent(new GridFieldSortableRows('SortOrder'));

        $homePageFeatureGridFieldConfig->addComponent(new GridFieldAddNewMultiClass());
        $homePageFeatureGridFieldConfig->removeComponentsByType(GridFieldDeleteAction::class);
        $homePageFeatureGridFieldConfig->removeComponentsByType(GridFieldAddNewButton::class)->getComponentByType(GridFieldAddNewMultiClass::class)->setClasses(
            array(
                'HomePageFeature',
                'HomePageFacebookFeature',
                'HomePageTwitterFeature',
            )
        );

        //Legacy Background Image Field:
        $bgImagesGridFieldConfig = GridFieldConfig_RelationEditor::create();
        $bgImagesGridFieldConfig->removeComponentsByType(GridFieldAddExistingAutocompleter::class);
        if (!Permission::check('ADMIN')) {

            $homePageHeroFeatureGridFieldConfig->removeComponentsByType('GridFieldAddNewButton');

        }

        $homePageBackgroundFeatureGridField = GridField::create('BackgroundFeatures', 'Background images and taglines', $this->BackgroundFeatures(), $bgImagesGridFieldConfig);
        $homePageHeroFeatureGridField       = GridField::create('HomePageHeroFeature', 'Hero features that overlap the background (Only the first two are shown)', HomePageHeroFeature::get(), $homePageHeroFeatureGridFieldConfig);

        $homePageFeatureGridField = GridField::create('HomePageFeature', 'Features below the background image (Only the first three are shown)', HomePageFeature::get(), $homePageFeatureGridFieldConfig);


        $legacyFieldList->push($homePageBackgroundFeatureGridField);
        $legacyFieldList->push(LiteralField::create('SpacerField', '<br /><br />'));
        $legacyFieldList->push($homePageHeroFeatureGridField);
        $legacyFieldList->push($homePageFeatureGridField);

        //New, non-legacy slides:

        // Begin Default Slider fields
        $newgridFieldConfig = GridFieldConfig_RecordEditor::create();
        $newgridFieldConfig->addComponent($newSortable = new GridFieldSortableRows('SortOrder'));

        $newSortable->setUpdateVersionedStage('Live');

        $newgridFieldConfig->removeComponentsByType('GridFieldDeleteAction');
        $newgridFieldConfig->removeComponentsByType('GridFieldAddExistingAutocompleter');

        if (!Permission::check('ADMIN')) {
            $newgridFieldConfig->removeComponentsByType('GridFieldAddNewButton');

        }

        $newHomePageHeroFeatureGridField = GridField::create('NewHomePageHeroFeature', 'Homepage Slides', NewHomePageHeroFeature::get(), $newgridFieldConfig);
        $shuffleHomePageFeaturesField = CheckboxField::create('ShuffleHomePageFeatures', 'Show features in a random order');

        $fieldList->push($shuffleHomePageFeaturesField);
        $fieldList->push($newHomePageHeroFeatureGridField);

        $f->addFieldToTab('Root.Main', Wrapper::create($legacyFieldList)->displayIf('LayoutType')->isEqualTo('Legacy')->end());

        $f->addFieldsToTab('Root.Main', Wrapper::create($fieldList)->displayIf('LayoutType')->isEqualTo('')->end());

        return $f;

    }

}
