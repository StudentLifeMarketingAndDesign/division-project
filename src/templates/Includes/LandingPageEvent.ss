<div class="lp-event row" id="lp-event-{$ID}">
	<div class="medium-4 medium-push-8 columns">
		<a href="$AfterClassLink" target="_blank" class="lp-event__image-link"><img src="$Image.URL" alt="" role="presentation" class="lp-event__image" /></a>
	</div>
	<div class="medium-8 medium-pull-4 columns">
		<h3 class="lp-event__header"><a href="$AfterClassLink">$Title</a></h3>
			<p class="lp-eventlist-date">
				<% if $Dates %>
				<strong> Date &amp; Time: </strong>
				<% loop $Dates %>
					<% with $StartDateTime %>
						<time itemprop="startDate" datetime="$Format(c)">
							$Format(l), $Format(F) $Format(j)
						</time>
						 <span class="lp-eventlist-time">$Format("g:i A")<% end_with %><% if $EndTime %><% with $EndTime %>&ndash;$Format("g:i A") 
						<% end_with %>
					<% end_if %>
				<% end_loop %>
				</span>
				<% end_if %>
			<br />	
		<% if $Venue %>
			<strong>Location: </strong>$Location &ndash; $Venue.Title <br />
		<% end_if %>

		<% if $Sponser %>
			<strong>Sponsor: </strong>$Sponser <br />
		<% end_if %>

		<% if $Cost %>
			<strong>Cost: </strong>$Cost <br />
		<% end_if %>

		<% if $MoreInfoLink %>
			<a href="$MoreInfoLink"><strong>Website <i class="fa fa-external-link" aria-hidden="true"></i></strong></a><br />
		<% end_if %>

		<% if $FacebookEventLink %>
			<strong><a href="$ParsedFacebookEventLink">Facebook Event</a></strong>
		<% end_if %>
		</p>
		$Content
	</div>

</div>
<% if not $Last %>
<hr />	
<% end_if %>