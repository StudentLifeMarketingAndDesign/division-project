<% if $Posts %>
	<ul>
		<% loop $Posts %>
			<li>
				<a href="$Link" class="clearfix">
					<% if $FeaturedImage %>
						<img src="$FeaturedImage.FocusFill(400,300).URL" alt="$Title">
					<% else_if $BackgroundImage %>
						<img src="$BackgroundImage.FocusFill(400,300).URL" alt="$Title">
					<% end_if %>
					$Title<br>
					<em class="blogcard__date">$PublishDate.format("MMM dd, YYYY")</em>
				</a>
			</li>
		<% end_loop %>
	</ul>
<% end_if %>
