<?php

use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\TextField;
use SilverStripe\ORM\ArrayList;
use SilverStripe\View\ArrayData;
use SilverStripe\ORM\DataExtension;
class DivisionImageExtension extends DataExtension {

    private static $db = array(
        'Caption' => 'Text'
    );
	
    private static $has_one = array(
        'LandingPageSection' => 'LandingPageSection'
    );
    public function updateCMSFields(FieldList $fields)
    {
        $f = new TextField('Caption');
        if ($fields->hasTabSet()) {
            $fields->addFieldToTab('Root.Main', $f);
        } else {
            $fields->add($f);
        }
    }
    public function Exif(){
        //echo "hello";
        //http://www.v-nessa.net/2010/08/02/using-php-to-extract-image-exif-data
        $image = $this->owner->AbsoluteURL;
        $filename = $this->owner->Filename;

        $extension = pathinfo($filename, PATHINFO_EXTENSION);

        if(($extension == 'jpg') || ($extension == 'jpeg')){
            $d=new ArrayList();    
            $exif = exif_read_data($image, 0, true);
            foreach ($exif as $key => $section) {
                $a=new ArrayList();    
                foreach ($section as $name => $val)
                    $a->push(new ArrayData(array("Title"=>$name,"Content"=>$val)));
                $d->push(new ArrayData(array("Title"=>strtolower($key),"Content"=>$a)));
            }
            return $d;
        }
         
    }

}
