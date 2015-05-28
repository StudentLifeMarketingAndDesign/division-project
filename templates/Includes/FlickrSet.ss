<% if $Photos %>
	<% if $Type == "slideshow" %>
		<div class="flexslider">
			<ul class="slides">
				<% loop $Photos %>
				<li><a href="$Large1024Url"><img src="$Medium800Url" alt="$Title"></a></li>
				<% end_loop %>
			</ul>
		</div>
	<% else %>

		<ul class="large-block-grid-{$Columns} slideshow-container">
			<% loop $Photos %>
				<li><p><a href="$Large1024Url" title="$Description"><img data-src="$Medium800Url" src="<% include PlaceholderLargeSrc %>" /></a></p>
				<p>$Description</p></li>
			<% end_loop %>
		</ul>
	<% end_if %>
	<p><a href="$Photoset.Url" target="_blank" class="btn">View gallery on Flickr</a></p>
<% end_if %>