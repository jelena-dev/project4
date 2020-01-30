<?php require_once('includes/header.php')?>
				<ul id="topics">
				<?php if($topics) : ?>
					<?php foreach($topics as $topic) : ?>
					<li class="topic">
						<div class="row">
							<div class="col-md-2">
								<img class="avatar pull-left" src="images/avatars/<?=$topic->avatar; ?>" />
							</div>
							<div class="col-md-10">
								<div class="topic-content pull-right">
									<h3><a href="topic.php?id=<?php echo $topic->id;?>"><?=$topic->title; ?></a></h3>
									<div class="topic-info">
										<a href="topics.php?category=<?php echo urlFormat($topic->category_id)?>"><?=$topic->name; ?></a> >> <a href="topics.php?user=<?php echo urlFormat($topic->user_id)?>"><?=$topic->username; ?></a> >> <?php echo formatDate($topic->create_date); ?> 
										<span class="badge pull-right"><?php echo replyCount($topic->id); ?></span>
									</div>
								</div>
							</div>
						</div>
					</li>
					<?php endforeach; ?>
					
				</ul>
				<?php else : ?>
					<p>No topics to display!</p>
                <?php endif;?>
						<h3>Forum Statistics</h3>
					<ul>
						<li>Total Number of Users: <strong><?echo $totalUsers; ?></strong></li>
						<li>Total Number of Topics: <strong><?php echo $totalTopics; ?></strong></li>
						<li>Total Number of Categories: <strong><?php echo $totalCategories; ?></strong></li>
					</ul>
				
				<?php require_once('includes/footer.php')?>