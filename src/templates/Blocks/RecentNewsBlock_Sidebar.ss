<section class="content-block__container">
	<div class="content-block row column">
		<div class="">
			<div class="$CSSClasses">
				<h2 class="recentnewsblock__header"><% if $Title %>$Title<% else %>Recent News<% end_if %></h2>
				<ul>
					<% loop $Entries.limit(3) %>
						<% include RecentNewsContent %>
					<% end_loop %>
				</ul>
			</div>
		</div>
	</div>
</section>