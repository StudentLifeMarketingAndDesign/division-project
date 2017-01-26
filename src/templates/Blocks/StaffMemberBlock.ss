<section class="content-block__container content-block__container--padding">
	<div class="content-block">
		<div class="featured-page row">
			<% if $StaffPage.Photo %>
				<div class="featured-page__media medium-6 columns">
					<a href="$StaffPage.Link">
						<img src="$StaffPage.Photo.CroppedFocusedImage(600,420).URL" alt="">
					</a>
				</div>
			<% end_if %>
			<div class="medium-6 columns">
				<div class="featured-page__body">
					<h3 class="featured-page__title">$StaffPage.Title</h3>
					<hr class="featured-page__rule">
					<div class="featured-page__desc">
						<p class="featured-page__position">$StaffPage.Position</p>
						<ul class="featured-page__contact">
							<% if $StaffPage.EmailAddress %>
							<li><img src="{$ThemeDir}/dist/images/mail.png" alt="email"> <a href="mailto:$StaffPage.EmailAddress">$StaffPage.EmailAddress</a></li>
							<% end_if %>
							<% if $StaffPage.Phone %>
								<li><img src="{$ThemeDir}/dist/images/call.png" alt="Phone number"> $StaffPage.Phone</li>
							<% end_if %>
						</ul>
					</div>
					<div class="featured-page__button">
						<a href="$StaffPage.Link">View Profile</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>