

<% if $FeaturedTopics %>
  <section class="topicholder-section topicholder-section--light-gray">
    <div class="grid-container">
      <div class="grid-x grid-padding-x">
        <div class="cell">
             <h2 class="topicholder-section__heading">Featured Topics</h2>
        </div>
      </div>
      <div class="grid-x grid-padding-x small-up-2 medium-up-4">
        <% loop $FeaturedTopics.Sort('FeaturedSortOrder') %>
          <div class="cell">
            <h2 style="font-size: 28px;"><a href="$Link">$Title.LimitCharacters(60)</a></h2>
            <p style="font-size: 12px;">Last Edited: $LastEdited.Format("MMMM d, YYYY")</p>
          </div>
        <% end_loop %>
      </div>
    </div>
  </section>
<% end_if %>
  <div class="grid-container grid-container--wpadding">

      <% if $AllCats || $AllTags %>
        <div class="grid-x grid-padding-x">
          <div class="cell">
               <h2 class="topicholder-section__heading">Browse by...</h2>
          </div>
        </div>
      <% end_if %>
      <% if $AllCats %>
        <div class="grid-x grid-padding-x small-up-2 medium-up-4 large-up-6"  data-equalizer>
          <% loop $AllCats.Sort('Title ASC') %>
            <div class="cell margin-bottom-2" data-equalizer-watch><a href="$Link" class="button large hollow secondary button--flex-full"><span class="topicholder-cat-inner" style="display: block; margin: auto; ">$Title</span></a></div>
          <% end_loop %>
        </div>
      <% end_if %>
      <% if $AllTags %>
        <div class="grid-x grid-padding-x small-up-2 medium-up-4 large-up-6"  data-equalizer>
          <% loop $AllTags.Sort('Title ASC') %>
            <div class="cell margin-bottom-2" data-equalizer-watch><a href="$Link" class="button large hollow secondary button--flex-full"><span class="topicholder-cat-inner" style="display: block; margin: auto;">$Title</span></a></div>
          <% end_loop %>
        </div>
      <% end_if %>




</div>

<% if $AllCats.Count > 4 %>
      <section class="topicholder-section topicholder-section--gray">
        <div class="grid-container grid-container--wpadding">
          <div class="grid-x grid-padding-x">
            <div class="cell">
                <h2 class="topicholder-section__heading">Browse All</h2>
                 <ul class="topicholder-all-list">
                   <% loop $AllCats.Sort('Title ASC') %>
                      <li class="topicholder-all-list__item topicholder-all-list__item--avoid-break"><h3 class="topicholder-all-list__item-heading">$Title</h3>
                        <% if $BlogPosts %>
                        <ul class="topicholder-sublist">
                          <% loop $BlogPosts.Sort('Title ASC') %>
                            <li class="topicholder-sublist__item"><a href="$Link">$Title</a></li>
                          <% end_loop %>
                        </ul>
                      <% end_if %>
                        </li>
                    <% end_loop %>

<%--                   <% loop $BlogPosts.Sort('Title ASC') %> 
                    <li style="list-style-type: none;"><h3 style="font-size: 17px; margin-bottom: 5px; margin-top: 0;"><a style="color: #666;" href="$Link">$Title</a></h3></li>
                  <% end_loop %> --%>
                </ul>
            </div>
          </div>
        </div>

      </div>
 <% else_if $AllTags.Count > 4 %>
      <section class="topicholder-section topicholder-section--gray">
        <div class="grid-container grid-container--wpadding">
          <div class="grid-x grid-padding-x">
            <div class="cell">
               <h2 class="topicholder-section__heading">Browse All</h2>
                 <ul class="topicholder-all-list">
                   <% loop $AllTags.Sort('Title ASC') %>
                      <li class="topicholder-all-list__item topicholder-all-list__item--avoid-break"><h3 class="topicholder-all-list__item-heading">$Title</h3>
                        <% if $BlogPosts %>
                        <ul class="topicholder-sublist">
                          <% loop $BlogPosts.Sort('Title ASC') %>
                            <li class="topicholder-sublist__item"><a href="$Link">$Title</a></li>
                          <% end_loop %>
                        </ul>
                      <% end_if %>
                        </li>
                    <% end_loop %>

                </ul>
            </div>
          </div>
        </div>

      </div>


<% else %>

      <section class="topicholder-section topicholder-section--gray">
        <div class="grid-container grid-container--wpadding">
          <div class="grid-x grid-padding-x">
            <div class="cell">
                 <h2 class="topicholder-section__heading">Browse all</h2>
                 <ul class="topicholder-all-list">
                   <% loop $TopicsByLetter %>
                        <li class="topicholder-all-list__item topicholder-all-list__item--avoid-break"><h3 class="topicholder-all-list__item-heading">$Title</h3>
                      <% if $Topics %>
                        <ul class="topicholder-sublist">
                      <% loop $Topics %>
                          <li class="topicholder-sublist__item"><h3 class="topicholder-sublist__heading" ><a href="$Link">$Title</a></h3></li>
                      <% end_loop %>
                      </ul>
                      <% end_if %>
                    </li>
                    <% end_loop %>
                </ul>
            </div>
          </div>
        </div>
      </div>

<% end_if %>
  <section class="topicholder-featured topicholder-section topicholder-section--light-gray">
      <div class="grid-container grid-container--wpadding">
        <div class="grid-x grid-padding-x">
          <div class="cell">
               <h2 class="topicholder-section__heading">Recently Updated</h2>
          </div>
        </div>
        <div class="grid-x grid-padding-x small-up-2 medium-up-4">
          <% loop $BlogPosts.Limit(4).Sort('LastEdited DESC') %>
            <div class="cell">
              <h2 class="topicholder-featured__heading"><a href="$Link">$Title</a></h2>
              <p class="topicholder-featured__preview">$Content.LimitCharacters(40).ATT</p>
              <p style="topicholder-featured__meta">Last Edited: $LastEdited.Format("MMMM d, YYYY")</p>
            </div>
          <% end_loop %>
        </div>
    </div>
  </div>
