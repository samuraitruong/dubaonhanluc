<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head profile="http://gmpg.org/xfn/11">

	<title><?php bloginfo('name'); ?><?php wp_title(); ?></title>

	<link rel="stylesheet" href="<?php bloginfo('stylesheet_url'); ?>" type="text/css" media="screen" />
	<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="<?php bloginfo('rss2_url'); ?>" />

	<?php wp_head(); ?>
	
	<script type="text/javascript" src="<?php bloginfo('template_directory'); ?>/jquery-1.2.6.min.js"></script>
	<script type="text/javascript" src="<?php bloginfo('template_directory'); ?>/jquery-accordion-1.5.2.min.js"></script>
	<script type="text/javascript" src="<?php bloginfo('template_directory'); ?>/sidebar.js"></script>
</head>
<body>
	<div id="wrapper">
		<h1><?php bloginfo('name'); ?></h1>
		<div id="sidebar">
			<ul>
				<?php if(function_exists('dynamic_sidebar') && dynamic_sidebar(appleQuery)) : ?>
				<?php endif; ?>
			</ul>
		</div><!-- end div#sidebar -->
		<div id="content">
			<div id="topStories">
				<span id="sidebarToggleButton" class="sidebarOpen"></span>
				<strong>Top Stories</strong>
				<?php echo date('F j, Y H:i A e'); ?>
				<a href="<?php bloginfo('rss2_url'); ?>" title="RSS 2 feed"><img src="<?php bloginfo('template_directory'); ?>/images/rssIcon.gif" alt="" /></a>
			</div>
			<?php if(have_posts()) : ?><?php while(have_posts()) : the_post(); ?>
				<div class="post">
					<span class="postDate"><?php the_date('F j, Y'); ?></span>
					<h3><a href="<?php the_permalink(); ?>" title="<?php the_title(); ?>"><?php the_title(); ?></a></h3>
					<div class="entry">
						<?php the_content('(read more...)'); ?>
					</div>
				</div>
			<?php endwhile; ?>
			<?php endif; ?>
		</div><!-- end div#content -->
	</div>
</body>
</html>