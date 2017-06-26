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
        <% if $Summary %>
          <div class="blogpost__summary">$Summary</div>
        <% end_if %>
      </div>
      <% if $FeaturedImage %>
        <% if FeaturedImage.Width >= 1200 %>
          <p class="post-image"><img class="dp-lazy" src="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7" data-original="$FeaturedImage.CroppedFocusedImage(1200,700).URL" width="1200" height="700" alt="" role="presentation" /></p>
        <% end_if %>
      <% end_if %>
    </div>
  <% end_if %>

  $BlockArea(BeforeContent)

  <div class="row">

    <article role="main" class="main-content main-content--with-padding <% if $Children || $Menu(2) || $SidebarBlocks ||  $SidebarView.Widgets %>main-content--with-sidebar<% else %>main-content--full-width<% end_if %>">
      $BlockArea(BeforeContentConstrained)
      <div class="main-content__text">
      <div class="content">
        <div class="blogmeta clearfix">
          <div class="blogmeta__byline clearfix">
          <p>
            <% loop $Categories.Limit(1) %><a href="$Link" class="topic-single__byline-cat">$Title</a><% end_loop %>
          </p>
          </div>
          <ul class="blogmeta__social">
            <li><a href="javascript:window.open('http://www.facebook.com/sharer/sharer.php?u=$AbsoluteLink', '_blank', 'width=400,height=500');void(0);"  title="Share on Facebook"><img src="{$ThemeDir}/dist/images/icon_facebook.png" alt="Share on Facebook"></a>
            </li>
            <li><a href="https://twitter.com/intent/tweet?text=$AbsoluteLink" title="Share on Twitter" target="_blank"><img src="{$ThemeDir}/dist/images/icon_twitter.png" alt="Share on Twitter"></a></li>
            <li><a href="javascript:window.open('https://www.linkedin.com/cws/share?url=$AbsoluteLink', '_blank', 'width=400,height=500');void(0);" title="Share on LinkedIn" target="_blank"><img src="{$ThemeDir}/dist/images/icon_linkedin.png" alt="share on linkedid"></a></li>
          </ul>
        </div>

        
        $Content
        <% if $Address || $Location %>
          <h2>Located here:</h2>
          $GoogleMap
        <% end_if %>
        <% if $Links %>
          <h2>Additional information:</h2>
          <ul>
          <% loop $Links %>
            <li><a href="$URL" target="_blank"><% if $Title %>$Title<% else %>$URL.LimitCharacters(50)<% end_if %></a></li>
          <% end_loop %>
          </ul>
        <% end_if %>
        <% include TagsCategories %>

      </div>
      
      <% include TopicRelated %>
      
      <h2>More topics:</h2>
      <% with $TopicSearchForm %>
            <% include TopicSearchForm %>
          <% end_with %>
      <% with $Parent %>
      <% include TopicHolderAllTopics %>
      <% end_with %>
      $BlockArea(AfterContentConstrained)
      $Form

    </article>
    <aside class="sidebar dp-sticky">
      <% include SideNav %>
      <% if $SideBarView %>
        $SideBarView
      <% end_if %>
      $BlockArea(Sidebar)
    </aside>
  </div>
  $BlockArea(AfterContent)

</main>