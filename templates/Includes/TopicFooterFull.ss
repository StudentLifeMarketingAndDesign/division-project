<section class="topicholder-featured topicholder-section topicholder-section--light-gray"><div class="grid-container grid-container--wpadding"><div class="grid-x grid-padding-x"><div class="cell large-12"> <% if $TermPlural %> <h2 class="topicholder-section__heading">Recently updated $TermPlural.LowerCase</h2> <% else %> <h2 class="topicholder-section__heading">Recently updated</h2> <% end_if %> <div class="grid-x grid-padding-x small-up-2"> <% loop $BlogPosts.Limit(4).Sort('LastEdited DESC') %> <div class="cell"><h2 class="topicholder-featured__heading"><a href="$Link">$Title</a></h2><p class="topicholder-featured__preview">$Content.LimitCharacters(90).ATT</p><p class="topicholder-featured__meta">Last Edited: $LastEdited.Format("MMMM d, YYYY")</p></div> <% end_loop %> </div></div></div></div></section>