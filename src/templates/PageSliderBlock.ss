<section class="pageslider-container" aria-labelledby="pageslider__id">
	<div class="row">
		<div class="columns large-10 large-offset-1">
			<% if $Title %><h2 class="pageslider-container__title" id="pageslider__id">$Title</h2><% end_if %>
			<% if $Content %><div class="pageslider-container__text">$Content</div><% end_if %>
		</div>
	</div>

	<ul class="pageslider-links">
		<% loop $Links %>
		<li class="pageslider-links__item">
			<a href="$Link" class="pageslider-links__link">
				<% if $BackgroundImage %>
					<img src="{$ThemeDir}/dist/images/pageslider-placeholder.png"  data-original="$BackgroundImage.FocusFill(360,450).URL" width="360" height="450" class="pageslider-links__img dp-lazy" alt="$Title">
				<% else_if $Page.BackgroundImage %>
					<img src="{$ThemeDir}/dist/images/pageslider-placeholder.png"  data-original="$Page.BackgroundImage.FocusFill(360,450).URL" width="360" height="450" class="pageslider-links__img dp-lazy" alt="$Title">
				<% else %>
					<img src="{$ThemeDir}/dist/images/pageslider-placeholder.png" style="display: block; 
		" height="450" class="pageslider-links__img" alt="$Title">
				<% end_if %>
				<div class="pageslider-links__body">
					<% if $Title %>
						<h3 class="pageslider-links__title">$Title</h3>
					<% else_if $Page.Title %>
						<h3 class="pageslider-links__title">$Page.Title</h3>
					<% end_if %>
					<p class="pageslider-links__reveal"><span>Learn More</span></p>
				</div>
			</a>
		</li>
		<% end_loop %>
	</ul>

</section>