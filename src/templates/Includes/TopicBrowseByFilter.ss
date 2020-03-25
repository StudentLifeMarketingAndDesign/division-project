  <div class="grid-container grid-container--1800px topic-browse-by-filter">

      <% if $AllCats || $AllTags %>
        <div class="grid-x grid-padding-x">
          <div class="cell topic-browse-by-filter__item">
          <% if $TermPlural %>
            <h2 class="topicholder-section__heading">Browse $TermPlural by...</h2>
          <% else %>
            <h2 class="topicholder-section__heading">Browse by...</h2>
          <% end_if %>
          </div>
        </div>
        <div class="grid-x grid-padding-x"  data-equalizer>
        <% loop $AllCats.Sort('Title ASC') %>
            <div class="topic-browse-by-filter__item cell small-6 medium-12 large-6 margin-bottom-1" data-equalizer-watch><a href="$Link" class="button hollow secondary button--flex-full button--skinny"><span class="topicholder-cat-inner">$Title&nbsp;<span style="topicholder-cat-inner__count">({$BlogPosts.Count})</span></span></a></div>
        <% end_loop %>
        <% loop $AllTags.Sort('Title ASC') %>
            <div class="topic-browse-by-filter__item  cell small-6 medium-12 large-6 xlarge-6 margin-bottom-1" data-equalizer-watch><a href="$Link" class="button hollow secondary button--flex-full button--skinny"><span class="topicholder-cat-inner">$Title&nbsp;<span style="topicholder-cat-inner__count">({$BlogPosts.Count})</span></span></a></div>
          <% end_loop %>
        </div>
      <% end_if %> 




</div>