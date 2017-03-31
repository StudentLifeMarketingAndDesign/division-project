<li class="column stafflist__item">
	<a href="$Link" class="stafflist__link">
		<% if $Photo %>
			<div class="stafflist__img">
				<img src="$Photo.Fill(350,234).URL" alt="Photograph of $FirstName $LastName">
			</div>
		<% else %>
			<div href="$Link" class="stafflist__img">
				<img src="{$ThemeDir}/dist/images/dosl.png" alt="Photograph of $FirstName $LastName">
			</div>
		<% end_if %>
		<div class="stafflist__text">
			<p><span class="stafflist__name">$FirstName $LastName</span>
			<% if $Position %><em class="stafflist__position">$Position</em><% end_if %>
			</p>
		</div>
	</a>
</li>