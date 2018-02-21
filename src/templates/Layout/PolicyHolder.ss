$Header
<main class="main-content__container" id="main-content__container">

    <!-- Background Image Feature -->
    <% if $BackgroundImage %>
        <% include FeaturedImage %>
    <% end_if %>
    $Breadcrumbs

    <% if not $BackgroundImage %>
        <div class="column row">
            <div class="main-content__header">
                <h1>$Title</h1>
            </div>
        </div>
    <% end_if %>

    $BlockArea(BeforeContent)

    <div class="row">

        <article role="main" class="main-content main-content--with-padding <% if $SiteConfig.ShowExitButton %>main-content--with-exit-button-padding <% end_if %> main-content--with-sidebar">
            $BlockArea(BeforeContentConstrained)
            <% if $MainImage %>
                <img class="main-content__main-img" src="$MainImage.ScaleMaxWidth(500).URL" alt="" role="presentation"/>
            <% end_if %>
            <div class="main-content__text policy">
	            <% if $PolicyYear %>
		    		<% include PolicyArchiveNav %>
		    	<% end_if %>
		    	 <p><a href="$Link(printable)" class="main-content__small-all-caps">Printable version</a></p>
                $Content

                $Policies
            </div>
            $BlockArea(AfterContentConstrained)
            $Form
        </article>
        <aside class="sidebar dp-sticky">
            $BlockArea(Sidebar)
        </aside>
    </div>
    $BlockArea(AfterContent)

</main>