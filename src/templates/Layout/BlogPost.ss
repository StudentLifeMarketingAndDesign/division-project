$Header
<main class="main-content__container" id="main-content__container">

	<% if $BackgroundImage %>
		<% include FeaturedImage %>
	<% end_if %>

	$Breadcrumbs

	<% if not $BackgroundImage %>
		<div class="column row">
			<div class="main-content__header">
				<h1>$Title</h1>
			</div>
		</div>
	<% end_if %>

	$BlockArea(BeforeContent)

	<div class="row">
		<article role="main" class="main-content main-content--with-padding main-content--with-sidebar">
			$BlockArea(BeforeContentConstrained)
			<div class="main-content__text">
				<% if $FeaturedImage %>
						<p class="post-image">$FeaturedImage.setWidth(840)</p>
					<% end_if %>
				<div class="content">

					<div class="blogmeta clearfix">
						<% include ByLine %>
						<ul class="blogmeta__social">
							<li><a href="javascript:window.open('http://www.facebook.com/sharer/sharer.php?u=$AbsoluteLink', '_blank', 'width=400,height=500');void(0);"  title="Share on Facebook"><img src="{$ThemeDir}/dist/images/facebook_circle.png" alt="Share on Facebook"></a>
							</li>
							<li><a href="https://twitter.com/intent/tweet?text=$AbsoluteLink" title="Share on Twitter" target="_blank"><img src="{$ThemeDir}/dist/images/twitter_circle.png" alt="Share on Twitter"></li>
							<li><a href="javascript:window.open('https://plus.google.com/share?url=$AbsoluteLink', '_blank', 'width=400,height=500');void(0);" title="Share on Google" target="_blank"><img src="{$ThemeDir}/dist/images/google_circle.png" alt="Share on Google"></a></li>
							<li><a href="javascript:window.open('https://www.linkedin.com/cws/share?url=$AbsoluteLink', '_blank', 'width=400,height=500');void(0);" title="Share on LinkedIn" target="_blank"><img src="{$ThemeDir}/dist/images/linkedin_circle.png"></a></li>
						</ul>
					</div>

					$Content
				</div>
				<% include TagsCategories %>
			</div>
			$BlockArea(AfterContentConstrained)
			$Form
		</article>
		<aside class="sidebar">
			<% include SideNav %>
			<% if $SideBarView %>
				$SideBarView
			<% end_if %>
			$BlockArea(Sidebar)
		</aside>
	</div>
	$BlockArea(AfterContent)
</main>

<% if $RelatedNewsEntries %>
	<div class="relatednews">
		<h2 class="relatednews-title text-center">Related News</h2>
		<ul class="column row medium-up-3 ">
			<% loop $RelatedNewsEntries.limit(3) %>
				<li class="column column-block">
					<% include BlogCard %>
				</li>
			<% end_loop %>
		</ul>
	</div>
<% end_if %>











