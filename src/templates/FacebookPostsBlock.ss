<%--         'FBID' => 'Varchar(100)',
        'Content' => 'Text',
        'ImageSource' => 'Varchar(255)',
        'URL' => 'Varchar(255)',
        'TimePosted' => 'SS_Datetime' // The time it was posted to the Page Timeline --%>
<% if $AreaName == "AfterContent" %>
<% if $Entries %>
<section class="content-block__container recentnews">
	<div class="content-block row">
		<div class="newsblock">
			<div class="column">
				<h3 class="recentnews-title text-center"><% if $Title && $ShowTitle %>$Title<% else %>Latest posts<% end_if %></h3>
			</div>
			<ul class="medium-up-3 ">
				<% loop $Entries.limit(3) %>
					<li class="column column-block">
						<% include FbPostCard%>
					</li>
				<% end_loop %>
			</ul>
		</div>
	</div>
</section>
<% end_if %>

<% else_if $AreaName == "BeforeContent" %>
<% if $Entries %>
<section class="content-block__container recentnews">
	<div class="content-block row">
		<div class="newsblock">
			<div class="column">
				<h3 class="recentnews-title text-center"><% if $Title && $ShowTitle %>$Title<% else %>Latest posts<% end_if %></h3>
			</div>
			<ul class="medium-up-3 ">
				<% loop $Entries.limit(3) %>
					<li class="column column-block">
						<% include FbPostCard%>
					</li>
				<% end_loop %>
			</ul>
		</div>
	</div>
</section>
<% end_if %>


<% else_if $AreaName == "Sidebar" %>
<section class="content-block__container">
	<div class="content-block row column">
		<div class="">
			<div class="newsblock">
				<h2 class="newsblock__header"><% if $Title && $ShowTitle %>$Title<% else %>Latest posts<% end_if %></h2>
				<ul>
					<% loop $Entries.limit(3) %>
						<li>
							<% if $URL %>
								<a href="$URL" target="_blank" class="clearfix">
							<% else %>
								<a href="$SiteConfig.FacebookLink" target="_blank" class="clearfix">
							<% end_if %>
									<% if $ImageSource %>
									<img src="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7" class="dp-lazy" data-original="$ImageSource.URL" width="$ImageSource.Width" height="$ImageSource.Height" alt="$Title">
								<% end_if %>
								$Content.LimitCharacters(100)<br>
								<em class="bloglistitem__date"><i class="fa fa-facebook"></i> $TimePosted.format("F d, Y") </em>
							</a>
						</li>
					<% end_loop %>
				</ul>
			</div>
		</div>
	</div>
</section>
<% else %>
<section class="content-block__container">
	<div class="content-block row column">
		<div class="newsblock">
			<h2 class="newsblock__header"><% if $Title && $ShowTitle %>$Title<% else %>Latest Posts<% end_if %></h2>
			<% loop $Entries.limit(3) %>
				<% include FbPostCard %>
			<% end_loop %>
			<br>
		</div>
	</div>
</section>