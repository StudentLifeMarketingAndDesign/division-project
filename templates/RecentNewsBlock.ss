<section class="content-block__container" aria-labelledby="Block$ID"><div class="content-block row column"><div class="newsblock"><h2 id="Block$ID" class="newsblock__header"><% if $Title && $ShowTitle %>$Title<% else %>Recent News<% end_if %></h2> <% loop $Entries %> <% include BlogCard %> <% end_loop %> <br></div></div></section>