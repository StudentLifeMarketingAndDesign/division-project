<?php

class TextBlock extends ContentBlock{
    
    private static $db = array(
        'ExternalLink' => 'Varchar(155)'
    );

    private static $has_one = array(
        'Image' => 'Image',
        'LinkedPage' => 'SiteTree'
    );
	
    /**
     * If the singular name is set in a private static $singular_name, it cannot be changed using the translation files
     * for some reason. Fix it by defining a method that handles the translation.
     * @return string
     */
    public function singular_name()
    {
        return _t('TextBlock.SINGULARNAME', 'Text+Image Block');
    }

    /**
     * If the plural name is set in a private static $plural_name, it cannot be changed using the translation files
     * for some reason. Fix it by defining a method that handles the translation.
     * @return string
     */
    public function plural_name()
    {
        return _t('TextBlock.PLURALNAME', 'Text+Image Blocks');
    }

    public function getCMSFields() {
        $f = parent::getCMSFields();

        $f->removeByName('LinkedPageID');
        $f->renameField('ExternalLink', 'Link (include http://)');
        $f->addFieldToTab('Root.Main', TextField::create('Title'), 'ExternalLink');
        $f->addFieldToTab('Root.Main', UploadField::create('Image', 'Image (crops to 600x425 in main content area)'));
        $f->addFieldToTab('Root.Main', HTMLEditorField::create('Content'));
 

        return $f;

    }
}