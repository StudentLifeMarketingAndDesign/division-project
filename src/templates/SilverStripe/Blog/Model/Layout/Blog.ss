
$Header


<main class="main-content__container" id="main-content__container">
	<!-- Background Image Feature -->
	<% if $BackgroundImage %>
		<% include FeaturedImage %>
	<% end_if %>

	$Breadcrumbs

	<% if not $BackgroundImage %>
	<div class="column row">
		<h1>$Title</h1>
	</div>
	<% end_if %>


	$BeforeContent

	<div class="row">
		<div role="main" class="main-content main-content--with-padding <% if $Children || $Menu(2) || $SidebarArea.Elements ||  $SidebarView.Widgets %>main-content--with-sidebar<% else %>main-content--full-width<% end_if %>">
			$BeforeContentConstrained
			<div class="main-content__text">


				$Content

				<% if $ArchiveYear || $CurrentTag || $CurrentCategory %>
					<h2>
						<% if $ArchiveYear %>
							<%t Blog.Archive 'Archive' %>:
							<% if $ArchiveDay %>
								$ArchiveDate.Nice
							<% else_if $ArchiveMonth %>
								$ArchiveDate.format('F, Y')
							<% else %>
								$ArchiveDate.format('Y')
							<% end_if %>
						<% else_if $CurrentTag %>
							<%t Blog.Tag 'Tag' %>: $CurrentTag.Title
						<% else_if $CurrentCategory %>
							<%t Blog.Category 'Category' %>: $CurrentCategory.Title
						<% else %>
							$Title
						<% end_if %>
					</h2>
				<% end_if %>

				<% if $Action == "index" %>
					<% if $SortAlphabetically %>
	 					<% loop $BlogPostsAlpha %>
	 						<% include BlogCard %>
	 					<% end_loop %>
	 				<% else_if $PaginatedList.Exists %>
						<% loop $PaginatedList %>
							<% include BlogCard %>
						<% end_loop %>
					<% end_if %>
				<% else %>
					<% loop $PaginatedList %>
						<% include BlogCard %>
					<% end_loop %>
				<% end_if %>
				$AfterContentConstrained

				$Form
				$CommentsForm

			</div>
            <% with $PaginatedList %>
                <% include Pagination %>
            <% end_with %>
		</div>


		<aside class="sidebar dp-sticky">
			<% include SideNav %>
			<% if $SideBarView %>
				$SideBarView
			<% end_if %>
			$SidebarArea
		</aside>
	</div>

	$AfterContent

</main>
