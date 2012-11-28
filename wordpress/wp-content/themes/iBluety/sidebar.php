<div class="clear"></div>
</div>
</div>

<div class="95824right" id="rightbox">
<div>
<h3>Amazon Discount Search</h3><div><div id="discount">
  <form onsubmit="lz.amz.search();return false;">
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
      <tr>
        <td align="right"><strong>Category</strong>:</td>
        <td><select id="node" name="node" class="tbox">
            <option value="1036592">Apparel</option>
            <option value="1266092011">Audio &amp; Video </option>
            <option value="15684181">Automotive</option>
            <option value="165796011">Baby</option>
            <option value="3760911">Beauty</option>
            <option value="1057792">Bedding &amp; Bath</option>
            <option value="283155">Books</option>
            <option value="502394">Camera &amp; Photo </option>
            <option value="301185">Cell Phones</option>
            <option value="541966">Computers &amp; Parts</option>
            <option value="130">DVD &amp; Blu-Ray</option>
            <option value="172282">Electronics</option>
            <option value="3370831">Gourmet Food</option>
            <option value="16310101">Grocery</option>
            <option value="3760901">Health &amp; Personal</option>
            <option value="1055398">Home &amp; Garden</option>
            <option value="16310091">Industrial</option>
            <option value="3367581">Jewelry</option>
            <option value="133141011">Kindle Store</option>
            <option value="284507">Kitchen &amp; Dining</option>
            <option value="599858">Magazines &amp; News</option>
            <option value="163856011">MP3 Downloads</option>
            <option value="5174">Music</option>
            <option value="11091801">Musical Instruments</option>
            <option value="1064954">Office Products</option>
            <option value="286168">Outdoor Living</option>
            <option value="229575">PC Games</option>
            <option value="12923371">Pet Supplies</option>
            <option value="672123011">Shoes</option>
            <option value="229534">Software</option>
            <option value="3375251">Sports &amp; Outdoors</option>
            <option value="228013">Tools</option>
            <option value="165793011">Toys &amp; Games</option>
            <option value="468642">VideoGames</option>
            <option value="377110011">Watches</option>
          </select></td>
      </tr>
      <tr>
        <td align="right"><strong>Discount</strong>:</td>
        <td><select id="disc" class="tbox">
            <option value="90">90% off or more</option>
            <option value="80">80% off or more</option>
            <option value="70">70% off or more</option>
            <option value="60">60% off or more</option>
            <option value="50">50% off or more</option>
            <option value="40">40% off or more</option>
            <option value="30" selected="selected">30% off or more</option>
            <option value="20">20% off or more</option>
            <option value="10">10% off or more</option>
            <option value="">All Products</option>
          </select></td>
      </tr>

      <tr>
        <td colspan="2" align="center"><strong style="color:#690">(Optional Values below)</strong>:</td>
      </tr>

      <tr>
        <td align="right"><strong>Keywords</strong>:</td>
        <td><input id="keywords" size="17"  class="tbox" type="text" value=""></td>
      </tr>

      <tr>
        <td align="right"><strong>Price</strong> ($):</td>
        <td>
          Min<input id="min"  style="width:25px" class="tbox" type="text">
          Max<input id="max" style="width:25px" class="tbox" type="text">
         </td>
      </tr>

      <tr>
        <td align="right"><strong>Shipping</strong>:</td>
        <td><select id="shipping" class="tbox">
            <option value="all" selected="selected">All</option>
            <option value="eligible">Prime Eligible</option>
            <option value="free">Free Super Saver</option>
          </select></td>
      </tr>

      <tr>
        <td align="right"><strong>Sort By</strong>:</td>
        <td><select id="sort" class="tbox">
            <option value="relevancerank" selected="selected">Relevance</option>
            <option value="pmrank">Bestselling</option>
            <option value="price">Price: Low to High</option>
            <option value="-price">Price: High to Low</option>
            <option value="reviewrank_authority">Customer Review</option>
          </select></td>
      </tr>

      <tr>
        <td align="center" colspan="2"><input value="" class="submitdiscount" type="submit"></td>
      </tr>
      
    </table>
  </form>
</div></div></div>



<div>
<h2>All Brand</h2>
<div>
  <ul id="catel">
    <?php wp_list_cats('sort_column=name&optioncount=0&depth=1'); ?>
<div class="clear"></div>
</ul>
</div></div>



<?php if (is_single() or is_archive() or is_tag() or is_page()) { ?>
<div>
<h2>Recent Products</h2>
<div>
<ul id="recentproducts">
    <?php get_archives("postbypost", 10); ?>
<div class="clear"></div>
</ul>
<style type="text/css">
#recentproducts a{ line-height:22px; height:22px; overflow:hidden; display:block; text-align:left; padding-left:22px; background:url(/theme/images/bullet.gif) 5px center no-repeat; font-size:10px}
#recentproducts li{border-bottom:1px dashed #dfdfdf;}
#recentproducts{clear:both}
#recentproducts span{font-size:9px}
</style>
</div></div>
<?php } ?>
			

<div>
<h2>Recommended</h2>
<div>
<ul id="recommend">
	<?php $rand_posts = get_posts("numberposts=10&orderby=rand"); foreach( $rand_posts as $post ) : ?>
					<li>
						<a href="<?php the_permalink(); ?>" title="<?php the_title(); ?>"><?php the_title(); ?></a>
					</li>
	<?php endforeach; ?>
<div class="clear"></div>
</ul>
</div></div>


<div>
<h2>By Price</h2><div><ul class="catelist">
</ul>
</div></div>

<div>
<h2>By Color</h2><div><ul class="catelist">
</ul>
</div></div>





<?php if (!is_single() and !is_home()) { ?>
<div>
<h2>Tag Cloud</h2>
<div>
<div id="tagscloud">
  <?php wp_tag_cloud('smallest=8&largest=16&number=18&orderby=RAND'); ?>
</div>

</div>
</div>
<?php } ?>
</div>