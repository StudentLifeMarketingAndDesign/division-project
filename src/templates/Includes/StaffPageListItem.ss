<li class="column stafflist__item">
	<% if $Photo %>
		<a href="$Link" class="stafflist__imglink">
			<img src="$Photo.Fill(350,234).URL" alt="Photograph of $FirstName $LastName" class="stafflist__img">
		</a>
	<% else %>
		<a href="$Link" class="stafflist__imglink">
			<img src="division-project/images/dosl.png" alt="Photograph of $FirstName $LastName" class="stafflist__img">
		</a>
	<% end_if %>
	<p class="stafflist__text">
		<a href="$Link">$FirstName $LastName</a>
		<% if $Position %><small class="stafflist__position">$Position</small><% end_if %>
	</p>
</li>