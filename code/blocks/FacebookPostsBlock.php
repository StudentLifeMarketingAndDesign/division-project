<?php
use Olliepop\FBPageFeed\FBPageFeedService;
use SilverStripe\SiteConfig\SiteConfig;
use SilverStripe\Forms\LiteralField;
use DNADesign\Elemental\Models\BaseElement;

class FacebookPostsBlock extends BaseElement{

	private static $db = array(

	);

	private static $has_one = array(

	);
	private static $many_many = array(

	);
	private static $table_name = 'FacebookPostsBlock';  

	public function getType()
    {
        return 'Facebook Posts Block';
    }

        // $this->appID = $siteConfig->FBAppID;
        // $this->appSecret = $siteConfig->FBAppSecret;
        // $this->accessToken = $siteConfig->FBAccessToken;
	public function getCMSFields() {
		$fields = parent::getCMSFields();
		$siteConfig = SiteConfig::current_site_config();

		if(!($siteConfig->FBAppID && $siteConfig->FBAppSecret && $siteConfig->FBAccessToken && $siteConfig->FBPageID)){
			$fields->addFieldToTab("Root.Main", new LiteralField("BadFbPostsConfigWarning",
				"<p class=\"message warning\">This site is not set up to use Facebook posts properly and this block will not work if you use it right now. <a href=\"admin/settings/\"><em>Please set up the FB app ID, token, and secret in this site's settings</em></a> or email imu-web@uiowa.edu for help.</p>"), "Title");
		}

		return $fields;
	}

	public function Entries(){
        $fbService = new FBPageFeedService();
        return $fbService->getStoredPosts();
	}

}