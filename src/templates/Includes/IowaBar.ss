<% include UiowaAlert %>

<div class="iowa-bar iowa-bar--narrow" data-uids-header>
    <div class="iowa-bar__container">
        <div class="uids-logo uids-logo--tab">
            <a href="https://www.uiowa.edu">
                <div class="show-for-sr">The University of Iowa</div>
                <svg xmlns="http://www.w3.org/2000/svg" class="uids-logo__icon" aria-labelledby="logo-header" role="img" viewBox="0 0 311.6 90.2">
                    <path class="st0" d="M40 18.8h-7.3v52.4H40v19H0v-19h7.3V18.8H0V0h40V18.8z" />
                    <path class="st0" d="M93.8 90.2h-29c-10.5 0-17.4-6.9-17.4-18.2V18.2C47.4 7 54.4 0 64.8 0h29c10.5 0 17.4 7 17.4 18.2V72C111.2 83.2 104.2 90.2 93.8 90.2zM85.6 71.2V18.8H73v52.4H85.6z" />
                    <path class="st0" d="M122.6 18.8h-6.4V0h38v18.9H147l6.5 43.4L167 0h19.2l14.4 62.3 5.2-43.4h-6.6V0h37.5v18.9h-6.2l-11.3 71.4h-30.6l-11.8-53.2 -12.1 53.1h-29.4L122.6 18.8z" />
                    <path class="st0" d="M230.1 71.2h6.9L250.7 0h41l13.5 71.2h6.4v19H281l-2.9-22h-15.2l-2.7 22h-30L230.1 71.2 230.1 71.2zM276.5 51.7l-5.8-36.4 -6 36.4H276.5z" />
                    <image src="../../images/uiowa-primary.png">
                        <title id="logo-header">University of Iowa</title>
                    </image>
                </svg>
            </a>
        </div>
        <nav role="navigation" aria-labelledby="uids-toplinks" class="uids-toplinks show-for-medium">
            <h2 class="show-for-sr" id="uids-toplinks">Top links</h2>
            <ul class="menu uids-toplinks__menu ">
                <li class="uids-toplinks__item">
                    <a href="https://diversity.uiowa.edu/about/division-units" class="uids-toplinks__link">Our 3 Division Units</a>
                </li>
                <li class="uids-toplinks__item">
                    <a href="https://diversity.uiowa.edu/report-concern" class="uids-toplinks__link">Report a Concern</a>
                </li>
                <li class="uids-toplinks__item">
                <a href="https://diversity.uiowa.edu/report-concern" class="uids-toplinks__link">Lorem Ipsum</a>
            </li>
            </ul>
        </nav>
    </div>
</div>



<%-- <div id="ui-wrapper" class="ui-wrapper ui-wrapper--{$DarkLightHeader}">
	<div id="uiowa-bar" class="uiowa-bar" role="region" aria-label="University of Iowa global header">
		<a href="http://www.uiowa.edu" title="The University of Iowa" id="wordmark-link" class="uiowa--bar--wordmark uiowa--bar--wordmark--uiowa">
		    <svg aria-labelledby="uiowa-wordmark" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 72.8 21.4" id="wordmark" class="uiowalogo uiowalogo--{$DarkLightHeader} uiowalogo--{$HeaderType}">
		      <defs><style>.st0{fill:#ffcd00;}</style></defs><title>The University of Iowa</title><path class="st0" d="M9.3,4.5H7.6v12.2h1.7v4.4H0v-4.4h1.7V4.5H0V0.2h9.3V4.5z" />
		      <path class="st0" d="M21.9,21.2h-6.8c-2.5,0-4.1-1.6-4.1-4.3V4.4c0-2.6,1.6-4.3,4.1-4.3h6.8c2.5,0,4.1,1.6,4.1,4.3V17
				C26,19.6,24.3,21.2,21.9,21.2z M20,16.8V4.5h-2.9v12.2H20z"/>
		      <path class="st0" d="M28.6,4.5h-1.5V0.2H36v4.4h-1.7l1.5,10.1L39,0.2h4.5l3.4,14.6l1.2-10.1h-1.5V0.2h8.8v4.4h-1.4l-2.6,16.7h-7.1
				L41.3,8.8l-2.8,12.4h-6.9L28.6,4.5z"/>
		      <path class="st0" d="M53.8,16.8h1.6l3.2-16.6h9.6l3.2,16.6h1.5v4.4h-7.1L65,16.1h-3.6l-0.6,5.1h-7L53.8,16.8L53.8,16.8z M64.6,12.2
				l-1.4-8.5l-1.4,8.5H64.6z"/>
		        <image src="{$ThemeDir}/dist/images/ui-logo-footer.png" xlink:href="">
		        </image>
		        <title id="uiowa-wordmark">University of Iowa</title>
		    </svg>
		</a>
		<% if $SiteConfig.QuickLinkTitleOne %>
			<div id="uiowa-search">
				<ul class="links links--{$DarkLightHeader} links--{$HeaderType}">
					<% if $SiteConfig.QuickLinkTitleOne %>
					<li class="division-bar__menu-item"><a class="division-bar__link division-bar__link--{$DarkLightHeader}" href="$SiteConfig.QuickLinkURLOne">$SiteConfig.QuickLinkTitleOne</a></li>
					<% end_if %>
					<% if $SiteConfig.QuickLinkTitleTwo %>
						<li class="division-bar__menu-item"><a class="division-bar__link division-bar__link--{$DarkLightHeader}" href="$SiteConfig.QuickLinkURLTwo">$SiteConfig.QuickLinkTitleTwo</a></li>
					<% end_if %>
					<% if $SiteConfig.QuickLinkTitleThree %>
						<li class="division-bar__menu-item"><a class="division-bar__link division-bar__link--{$DarkLightHeader}" href="$SiteConfig.QuickLinkURLThree">$SiteConfig.QuickLinkTitleThree</a></li>
					<% end_if %>
				</ul>
			</div>
		<% end_if %>
		</div>
	</div> --%>